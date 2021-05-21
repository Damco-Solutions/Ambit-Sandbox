trigger AchievementTrigger on Achievement__c (after insert , after Update) {
    if(trigger.isAfter && trigger.isInsert ||trigger.isAfter && trigger.isUpdate){
        Map<id,id> RecId_OwnerId_Map = new Map<id,id>();
        List<Achievement__share> shareRecList = new List<Achievement__share>();
        for(Achievement__c ac:trigger.new){
            if(ac.User__c !=null){
                RecId_OwnerId_Map.put(ac.id,ac.User__c);
                Achievement__share obj = new Achievement__share();
                obj.AccessLevel = 'Read';
                obj.UserOrGroupId = ac.User__c;
                obj.ParentID = ac.id;
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
            ShareRecordsToManagers.shareRecords(RecId_OwnerId_Map,'Achievement__c');
        }
    }
   
}