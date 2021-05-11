public class CreateLoanApplication {
    @InvocableMethod
    public static void CreateLA(List<Contact> ApplicantList){
        if(ApplicantList != null && ApplicantList.size()>0){
            List<Loan_Account__c> toCreateList = new List<Loan_Account__c>();
            for(Contact con:ApplicantList){
                Loan_Account__c la = new Loan_Account__c();
                if(con.Agent__c != null)
                    la.DSA_Connector__c = con.Agent__c;
                la.Applicant__c = con.id;
                la.OwnerId = con.OwnerId;
                toCreateList.add(la);
            }
            if(toCreateList != null && toCreateList.size()>0){
                try{
                    Approval.LockResult[] lrList = Approval.lock(ApplicantList, false);
                    insert toCreateList;
                }
                catch(dmlException ex){
                    system.debug('error: '+ex.getMessage());
                }
            }
        }
    }
}