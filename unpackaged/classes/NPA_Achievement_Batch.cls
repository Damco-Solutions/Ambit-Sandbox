global class NPA_Achievement_Batch implements Database.Batchable<sObject>,Schedulable,Database.Stateful{
    Private Map<id,Decimal> AllLoans = new Map<id,Decimal>();
    Private Map<id,Decimal> NPA_DPD_Map = new Map<id,Decimal>();
    global Database.QueryLocator start(Database.BatchableContext bc){
        String status = 'Disbursed';
        String query = 'Select Id,name,DPD__c,OwnerId from Loan_Account__c WHERE Disbursal_Amount__c !=null AND Disbursal_Date__c !=null';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Loan_Account__c> Loans){
        if(Loans !=null && Loans.size()>0){
            for(Loan_Account__c la:Loans){
                system.debug('name: '+la.name);
                if(AllLoans.containsKey(la.OwnerId)){
                    AllLoans.put(la.OwnerId,AllLoans.get(la.OwnerId)+1);
                }else{
                    AllLoans.put(la.OwnerId,1);
                }
                if(la.DPD__c !=null && la.DPD__c>90){
                    if(NPA_DPD_Map.containsKey(la.OwnerId)){
                        NPA_DPD_Map.put(la.OwnerId,NPA_DPD_Map.get(la.OwnerId)+1);
                    }else{
                        NPA_DPD_Map.put(la.OwnerId,1);
                    }
                }
            }
        }
    }
    global void finish(Database.BatchableContext BC){
        Target_Achievement_batch bt = new Target_Achievement_batch(AllLoans,NPA_DPD_Map);
        database.executebatch(bt);
    }
    global void execute(SchedulableContext sc){
        NPA_Achievement_Batch conInstance = new NPA_Achievement_Batch();
        database.executebatch(conInstance);
    }
}