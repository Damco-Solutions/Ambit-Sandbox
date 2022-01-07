trigger Achievement_User_Statistics on Achievement__c (after insert,after update) {
    if(trigger.isInsert  || trigger.isUpdate)
    {
            Set<Id> AchievementList=Trigger.newmap.keyset();
            Achievement_User_StatisticsHelper.insertUpdateUser_Statistics(AchievementList);
        
        
    }
    
}