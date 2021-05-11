trigger Collection_Task_Trigger on Collection_Task__c (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        Map<id,id> RecId_OwnerId_Map = new Map<id,id>();
        for(Collection_Task__c ct:trigger.new){
            RecId_OwnerId_Map.put(ct.id,ct.OwnerId);
        }
        if(RecId_OwnerId_Map != null){
            system.debug('call sharing method');
            ShareRecordsToManagers.shareRecords(RecId_OwnerId_Map,'Collection_Task__c');
        }
    }
}