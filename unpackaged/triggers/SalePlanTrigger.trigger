trigger SalePlanTrigger on Sales_Plan__c (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        Map<id,id> SalePlan_OwnerMap = new Map<id,id>();
        for(Sales_Plan__c sa:trigger.new){
            SalePlan_OwnerMap.put(sa.id,sa.OwnerId);
        }
        
        if(SalePlan_OwnerMap != null){
            system.debug('call sharing method');
            ShareRecordsToManagers.shareRecords(SalePlan_OwnerMap,'Sales_Plan__c');
        }        
    }
    
}