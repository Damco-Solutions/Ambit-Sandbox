trigger EligibilityCalculatorTrigger on Eligibility_Calculator__c (before insert, before update) {
	
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            EligibilityCalculatorTriggerHandler.calculateABB(trigger.new);
        }
    }
}