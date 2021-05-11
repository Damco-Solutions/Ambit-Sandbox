trigger SalesIncentiveTrigger on Sales_Incentive__c (After insert) {
    if(trigger.isInsert && trigger.isAfter){
        Map<id,id> SalesIncentive_OwnerMap = new Map<id,id>();
        Set<id> DSA_IncentiveIdSet = new Set<id>();
        for(Sales_Incentive__c sa:trigger.new){
            if(sa.DSA_Connector__c !=null){
                system.debug('>'+sa.DSA_Connector__c);
                DSA_IncentiveIdSet.add(sa.id);
            }else{
                SalesIncentive_OwnerMap.put(sa.id,sa.OwnerId);
            }
        }
        if(SalesIncentive_OwnerMap != null && SalesIncentive_OwnerMap.size()>0){
            system.debug('call sharing method');
            ShareRecordsToManagers.shareRecords(SalesIncentive_OwnerMap,'Sales_Incentive__c');
        }
        if(DSA_IncentiveIdSet != null && DSA_IncentiveIdSet.size()>0){
            ShareRecordsToManagers.shareDSARecords(DSA_IncentiveIdSet);
        }
        
    }

}