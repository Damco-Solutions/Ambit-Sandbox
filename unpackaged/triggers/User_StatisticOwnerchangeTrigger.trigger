trigger User_StatisticOwnerchangeTrigger on User_Statistics__c (before insert,before update) {
    
    for(User_Statistics__c US: Trigger.new)
    {
        if(Trigger.isUpdate)
        {
          /*  if((trigger.oldmap.get(US.Id) !=null) && (trigger.oldmap.get(US.Id).ownerId!=US.Salesperson__c))
            {
                US.OwnerId=US.Salesperson__c;
            }*/
        }
        else if(Trigger.isInsert){
              US.OwnerId=US.Salesperson__c;
        }
    }
    
}