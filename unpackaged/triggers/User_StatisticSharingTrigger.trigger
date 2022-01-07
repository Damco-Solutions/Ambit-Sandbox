trigger User_StatisticSharingTrigger on User_Statistics__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        Map<id,id> RecId_OwnerId_Map = new Map<id,id>();
        List<User_Statistics__share> shareRecList = new List<User_Statistics__share>();
        for(User_Statistics__c ac:trigger.new){
            if(ac.Salesperson__c !=null){
                RecId_OwnerId_Map.put(ac.id,ac.Salesperson__c );
                User_Statistics__share obj = new User_Statistics__share();
                obj.AccessLevel = 'Read';
                obj.UserOrGroupId = ac.Salesperson__c ;
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
            ShareRecordsToManagers.shareRecords(RecId_OwnerId_Map,'User_Statistics__c');
        }
    }
   

}