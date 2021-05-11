@isTest
public class LoanAccountTriggerHandler_Test {
    public static testmethod void test1(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        Loan_Account__c la = new Loan_Account__c();
        la.Applicant__c = c.id;
        la.DPD__c=0;
        la.EMI_Overdue_Amount__c=1500;
        la.Other_Overdue_Amount__c=500;
        la.LOAN_STATUS__c='Pending';
        insert la;
        
        la.LOAN_STATUS__c='Disbursed';
        la.DPD__c=2;
        update la; 
         
        
        
        list<Collection_Task__c>collectionlistpending=[SELECT id,Loan_Account__c,Name,Status__c from Collection_Task__c where Loan_Account__c=:la.id and Status__c=:'Pending'];  
        la.DPD__c=24;
        la.EMI_Overdue_Amount__c=1200;
        la.Other_Overdue_Amount__c=300;
        update la;
        
        Collection_Task__c coll = new Collection_Task__c();
        for(Collection_Task__c ca: collectionlistpending){
            ca.Status__c='Complete - Fully Recovered';
            ca.Loan_Account__c=la.id;
             update ca;
            
            
        }   
    }
    
      public static testmethod void test2(){
        Contact c1 = new Contact();
        c1.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c1.FirstName = 'Test';
        c1.LastName = 'Name';
        c1.Email = 'test@abc.com';
        c1.Phone = '86559944';
        c1.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c1;
        Loan_Account__c la1 = new Loan_Account__c();
        la1.Applicant__c = c1.id;
        la1.DPD__c=0;
        la1.EMI_Overdue_Amount__c=1500;
        la1.Other_Overdue_Amount__c=500;
        la1.LOAN_STATUS__c='Pending';
        insert la1;
        
        la1.LOAN_STATUS__c='Disbursed';
        la1.DPD__c=2;
        update la1; 
    
          Collection_Task__c collectionlistpending=[SELECT id,Loan_Account__c,Name,Status__c from Collection_Task__c where Loan_Account__c=:la1.id and Status__c=:'Pending' ];
           Collection_Task__c coll = new Collection_Task__c();
          coll.id= collectionlistpending.id; 
          coll.Status__c='Complete - Fully Recovered';
           coll.Loan_Account__c=la1.id;
             update coll;
          
        list<Collection_Task__c>collectionlistcompleted=[SELECT id,Loan_Account__c,Name,Status__c from Collection_Task__c where Loan_Account__c=:la1.id and Status__c=:'Complete - Fully Recovered'];  
        la1.DPD__c=24;
        la1.EMI_Overdue_Amount__c=1200;
        la1.Other_Overdue_Amount__c=300;
        update la1;

        
       
            
            
        }
}