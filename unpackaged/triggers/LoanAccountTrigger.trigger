trigger LoanAccountTrigger on Loan_Account__c (after Update, after insert) {
    if(trigger.isInsert && trigger.isAfter){
        Map<id,id> LoanAcct_OwnerMap = new Map<id,id>();
        for(Loan_Account__c la:trigger.new){
            LoanAcct_OwnerMap.put(la.id,la.OwnerId);
        }
        if(LoanAcct_OwnerMap != null){
            system.debug('call sharing method');
            ShareRecordsToManagers.shareRecords(LoanAcct_OwnerMap,'Loan_Account__c');
        }
    }
    if(trigger.isUpdate && trigger.isAfter){
        Set<id> laIdSet = new Set<id>();
        Map<Id,Loan_Account__c> OldMap= new map<id,Loan_Account__c>(); 
        Map<Id,Loan_Account__c> NewMap= new map<id,Loan_Account__c>();
        for(Loan_Account__c la:trigger.new){
            if(true){
                
                laIdSet.add(la.id);
                OldMap=Trigger.OldMap;
                NewMap=Trigger.NewMap;
                system.debug('OldMap'+OldMap);
                system.debug('NewMap'+NewMap);
            }
        }
        if(laIdSet !=null && laIdSet.size()>0){
            LoanAccountTriggerHandler.CreateCollectionTask(laIdSet,OldMap,NewMap);
        }
    }
}