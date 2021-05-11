public class EligibilityCalculatorTriggerHandler {
	
    public static void calculateABB(List<Eligibility_Calculator__c> ECList){
        decimal avg1 = 0;
        decimal avg2 = 0;
        decimal avg3 = 0;
        decimal avg4 = 0;
        decimal avg5 = 0;
        decimal avg6 = 0;
        
        for(Eligibility_Calculator__c ec:ECList){
            if(ec.Average_Monthly_Balance_1__c != null)
                avg1 = ec.Average_Monthly_Balance_1__c;
            if(ec.Average_Monthly_Balance_2__c != null)
                avg2 = ec.Average_Monthly_Balance_2__c;
            if(ec.Average_Monthly_Balance_3__c != null)
                avg3 = ec.Average_Monthly_Balance_3__c;
            if(ec.Average_Monthly_Balance_4__c != null)
                avg4 = ec.Average_Monthly_Balance_4__c;
            if(ec.Average_Monthly_Balance_5__c != null)
                avg5 = ec.Average_Monthly_Balance_5__c;
            if(ec.Average_Monthly_Balance_6__c != null)
                avg6 = ec.Average_Monthly_Balance_6__c;
            Decimal[] avgArray= new Decimal[] {avg1,avg2,avg3,avg4,avg5,avg6};
                system.debug('unsorted>>'+avgArray);
                avgArray.sort();
            system.debug('sorted>>'+avgArray);
            ec.ABB__c = (avgArray[0]+avgArray[1]+avgArray[2])/3;
        }
    }
}