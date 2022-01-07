trigger TargetTrigger on Targets__c (before insert,before update,after insert,after update) {
    
    if(trigger.isAfter){
        Map<id,id> RecId_OwnerId_Map = new Map<id,id>();
        List<Targets__share> shareRecList = new List<Targets__share>();
        for(Targets__c t:trigger.new){
            if(trigger.isInsert ||(trigger.isUpdate && t.Salesperson__c != trigger.oldMap.get(t.id).Salesperson__c))
                RecId_OwnerId_Map.put(t.id,t.OwnerId);
                if(t.Branch_Manager__c!=null){
                Targets__share obj = new Targets__share();
                obj.AccessLevel = 'Read';
                obj.UserOrGroupId =t.Branch_Manager__c;
                obj.ParentID = t.id;
                obj.RowCause = 'Manual';
                shareRecList.add(obj);
                    
                }
            }
        if(shareRecList != null && shareRecList.size()>0){
            try{
                insert shareRecList;
            }
            catch(exception e){
                system.debug('ex: '+e.getMessage());
            }
        }
        if(RecId_OwnerId_Map != null){
            system.debug('call sharing method');
            ShareRecordsToManagers.shareRecords(RecId_OwnerId_Map,'Targets__c');
        }
    }else{
        /***Check for duplicate target for salesperson***/
        if(trigger.isInsert){
            For(Targets__c tOld: [select Salesperson__c, Start_Date__c, End_Date__c FROM Targets__c]){
                for(Targets__c tnew:trigger.new){
                    if(tOld.Salesperson__c == tnew.Salesperson__c && ((tnew.Start_Date__c >=tOld.Start_Date__c && tnew.Start_Date__c 
                       <=tOld.End_Date__c) || (tnew.End_Date__c >=tOld.Start_Date__c && tnew.End_Date__c <=tOld.End_Date__c) 
                       || (tOld.Start_Date__c >=tnew.Start_Date__c && tOld.Start_Date__c <=tnew.End_Date__c) 
                       || (tOld.End_Date__c >=tnew.Start_Date__c && tOld.End_Date__c <=tnew.End_Date__c)) ){
                           tnew.addError('Target already defined for this time period');
                       }
                }
            }
        }
        
        /***Set Monthly target fetched from Disbursement Target Table***/
        List<Disbursement_Target_Table__c> DList = [SELECT Designation__c,CTC_Range_Min_In_Lakhs__c,CTC_Range_Max_In_Lakhs__c,Monthly_Target_In_Cr__c,Location__c FROM Disbursement_Target_Table__c LIMIT 50000];
        Set<id> UserIdSet = new Set<id>();
        for(Targets__c t:trigger.new){
            if(trigger.isInsert ||trigger.isUpdate||(trigger.isUpdate && t.Salesperson__c != trigger.oldMap.get(t.id).Salesperson__c)){
                system.debug('in trigger');
                if(t.Salesperson__c !=null){
                    UserIdSet.add(t.Salesperson__c);
                }
            }
        }
        if(UserIdSet != null && UserIdSet.size()>0){
            //prepare role id, name map
            Map<id,string> roleMap = new Map<id,string>();
            for(UserRole rl:[select id,Name FROM UserRole]){
                roleMap.put(rl.id,rl.Name);
            }
            
            Map<id,Decimal> TargetMap = new Map<id,Decimal>();
            for(User u:[select Branch__c,CTC_Range_Max_In_Lakhs__c,CTC_Range_Min_In_Lakhs__c,UserRoleId FROM User WHERE id=:UserIdSet]){
                for(Disbursement_Target_Table__c dis:DList){
                    system.debug('u branch: '+u.Branch__c +' dis: '+dis.Location__c);
                    system.debug('u : '+u.CTC_Range_Min_In_Lakhs__c +' dis: '+dis.CTC_Range_Min_In_Lakhs__c);
                    system.debug('u : '+u.CTC_Range_Max_In_Lakhs__c +' dis: '+dis.CTC_Range_Max_In_Lakhs__c);
                    system.debug('u : '+roleMap.get(u.UserRoleId) +' dis: '+dis.Designation__c);
                    if(u.Branch__c != null && dis.Location__c !=null && u.Branch__c ==dis.Location__c && 
                       u.CTC_Range_Min_In_Lakhs__c != null && dis.CTC_Range_Min_In_Lakhs__c != null && u.CTC_Range_Min_In_Lakhs__c ==dis.CTC_Range_Min_In_Lakhs__c &&
                       u.CTC_Range_Max_In_Lakhs__c != null && dis.CTC_Range_Max_In_Lakhs__c != null && u.CTC_Range_Max_In_Lakhs__c == dis.CTC_Range_Max_In_Lakhs__c &&
                       dis.Designation__c != null && roleMap.containsKey(u.UserRoleId) && dis.Designation__c == roleMap.get(u.UserRoleId)){
                           TargetMap.put(u.id, dis.Monthly_Target_In_Cr__c);
                       }
                }
            }
            for(Targets__c tg:trigger.new){
                if(TargetMap.containskey(tg.Salesperson__c))
                    tg.Volumes__c = TargetMap.get(tg.Salesperson__c);
            }
           
        }
    }
}