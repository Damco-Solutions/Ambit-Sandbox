trigger Sales_Plan_User_Statistics on Sales_Plan__c (after insert,after update) {
 if(trigger.isInsert  || trigger.isUpdate)
    {
        
        Set<Id> SalesPlanList=Trigger.newmap.keyset();
        Sales_plan_User_StatisticsHelper.insertUpdateUser_Statistics(SalesPlanList);
        
    }
}