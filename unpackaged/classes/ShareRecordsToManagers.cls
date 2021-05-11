/*** CLass created by- Shabana Tarannum on 20-01-2021 ****/
public class ShareRecordsToManagers {    
    public static void shareRecords(Map<id,id> RecordId_OwnerIdMap, String ObjectAPIName){
        system.debug('obj name: '+ObjectAPIName);
        Map<id,id> user_Manager_Map = new Map<id,id>();
        List<User> UserList = [select id, ManagerId FROM User where isActive=true LIMIT 50000];
        for(user u:UserList){
            user_Manager_Map.put(u.id, u.ManagerId);
        }
        
        //Put all Owners in a set
        Set<id> RecordOwnerSet = new Set<id>();
        for(id own:RecordId_OwnerIdMap.values()){
            RecordOwnerSet.add(own);
        }
        //get all heirarchial managers wrt to a user
        Map<id,Set<id>> userId_ManagersIdList = new Map<id,Set<id>>();
        for(id owner:RecordOwnerSet){
            Set<id> managerHeirarchyId = new Set<id>();
            id ManagerId;
            id queryUSer = owner;
            do{
                system.debug('count');
                ManagerId = user_Manager_Map.get(queryUSer);
                if(ManagerId != null){
                    queryUSer = ManagerId;
                    if(userId_ManagersIdList.get(owner)==null){
                        userId_ManagersIdList.put(owner, new Set<id>{ManagerId});
                    }else{
                        userId_ManagersIdList.get(owner).add(ManagerId);
                    }
                }else{
                    ManagerId = null;
                }
            }while(ManagerId !=null);
            
        }
        
        //create share record for each user
        string ShareAPIName = ObjectAPIName.replace('__c', '__share');
        List<sObject> sharesToCreate = new List<sObject>();
        for(id RecordId: RecordId_OwnerIdMap.keyset()){
            system.debug('Record= '+RecordId);
            if(userId_ManagersIdList.get(RecordId_OwnerIdMap.get(RecordId)) !=null){
                for(id userId:userId_ManagersIdList.get(RecordId_OwnerIdMap.get(RecordId))){
                    system.debug('USer= '+userId);
                    system.debug('ShareAPIName= '+ShareAPIName);
                    system.debug('Schema.getGlobalDescribe().get(ShareAPIName)->'+Schema.getGlobalDescribe().get(ShareAPIName));
                    Schema.SObjectType ObjShareType = Schema.getGlobalDescribe().get(ShareAPIName);
                    system.debug('ObjShareType= '+ObjShareType);
                    SObject ObjShare = ObjShareType.newSObject();
                    ObjShare.put('ParentId', RecordId);
                    ObjShare.put('UserOrGroupId', userId);
                    ObjShare.put('AccessLevel', 'Read');
                    ObjShare.put('RowCause', 'Manual');
                    sharesToCreate.add(ObjShare);
                    Loan_Account__Share Las = new Loan_Account__Share();
                    Las.AccessLevel = 'read';
                    Las.ParentId  = RecordId;
                    Las.UserOrGroupId = userId;
                    Las.RowCause=Schema.Loan_Account__Share.RowCause.Manual;
                    //sharesToCreate.add(Las); 
                }
            }
        }
        if(sharesToCreate != null && sharesToCreate.size()>0){
            system.debug('sharesToCreate size= '+sharesToCreate.size());
            try{
                insert sharesToCreate;
            }
            catch(exception e){
                system.debug('e: '+e.getMessage());
            }
        }
    }
    
    public static void shareDSARecords(Set<id> incentiveIds){
        List<sObject> sharesToCreate = new List<sObject>();
        List<Account> BranchList = [select id,Branch_Manager__c FROM Account WHERE RecordType.Name ='Branch'];
        for(Sales_Incentive__c si: [select DSA_Connector__r.Agent_Branch__r.Branch_Manager__c,DSA_Connector__r.Agent_Branch__r.Name FROM Sales_Incentive__c WHERE id=:incentiveIds]){
            if(si.DSA_Connector__r.Agent_Branch__r.Name =='CORPORATE'){
                if(BranchList != null && BranchList.size()>0){
                    for(Account branch:BranchList){
                        Sales_Incentive__Share Las = new Sales_Incentive__Share();
                        Las.AccessLevel = 'read';
                        Las.ParentId  = si.id;
                        Las.UserOrGroupId = branch.Branch_Manager__c;
                        Las.RowCause=Schema.Sales_Incentive__Share.RowCause.Manual;
                        system.debug('Las: '+Las);
                        sharesToCreate.add(Las);
                    }
                }
            }else{
                Sales_Incentive__Share Las = new Sales_Incentive__Share();
                Las.AccessLevel = 'read';
                Las.ParentId  = si.id;
                Las.UserOrGroupId = si.DSA_Connector__r.Agent_Branch__r.Branch_Manager__c;
                Las.RowCause=Schema.Sales_Incentive__Share.RowCause.Manual;
                system.debug('Las: '+Las);
                sharesToCreate.add(Las);
            }
        }
        if(sharesToCreate != null && sharesToCreate.size()>0){
            system.debug('sharesToCreate size= '+sharesToCreate.size());
            try{
                insert sharesToCreate;
            }
            catch(exception e){
                system.debug('e: '+e.getMessage());
            }
        }
    }
}