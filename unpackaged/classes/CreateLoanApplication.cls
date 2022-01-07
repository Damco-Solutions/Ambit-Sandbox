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
                la.Applicant_Code__c=con.Applicant_Code__c;
                la.Prospect_Code__c=con.Prospect_Code__c;
                la.Prospect_ID__c=con.Prospect_Id__c;
                la.LOAN_STATUS__c='Applied';
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