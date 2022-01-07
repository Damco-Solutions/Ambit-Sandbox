global  class Sync_Loan_Account {
    
    @AuraEnabled
    global  static string LoanDetailRequest(Id loanId){
        
        system.debug('class called');
        set<string> loan_status= new set<string>();
        string AUTHENTICATION;
        string BASICINFO;
        string token;
        String Final_json;
        String endpoint;
        string PROSPECT_DETAILS;
        string UNIQUE_REQUEST_ID;
        list<LOAN_AUTHENTICATION__mdt> LoanAuth=new list<LOAN_AUTHENTICATION__mdt>();
        list<Loan_Account__c> loan =[SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,
                                     Prospect_Code__c,Prospect_ID__c FROM Loan_Account__c WHERE id=:loanId LIMIT 1];
        for(Loan_Account__c la : loan){
            if(la.LOAN_STATUS__c=='Disbursed'){
                
                token=Loan_Creation.AUTHENTICATION();
                //Get UNIQUE_REQUEST_ID
                
                // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
                list<Loan_API__c> Loanunqno=[select UNIQUE_REQUEST_ID__c,FORMNO__c from Loan_API__c Limit 1];      
                UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c);    
                
                // AUTHENTICATION details
                AUTHENTICATION= '{"AUTHENTICATION":';
                AUTHENTICATION+='{"TOKEN":"'+token+'",';
                AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
                AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
                // PROSPECT_DETAILS 
                BASICINFO='"BASICINFO":{';
                BASICINFO+=' "IS_PROSPECT": "Y",';
                BASICINFO+='"RULE_ID": "",';
                BASICINFO+='"PROSPECT_CODE":"'+la.Prospect_Code__c+'"}';
                Final_json=AUTHENTICATION+BASICINFO+'}';
                system.debug('Final_json->'+Final_json);
                
                LoanAuth=[select Get_loan_details__c from LOAN_AUTHENTICATION__mdt Limit 1];
                endpoint=LoanAuth[0].Get_loan_details__c;  
                HttpRequest req = new HttpRequest();
                req.setHeader('Accept', '*/*');
                req.setHeader('Content-Type', 'application/json;charset=UTF-8');
                req.setEndpoint(endpoint);
                req.setMethod('POST');
                req.setbody(Final_json);
                Http http = new Http();
                HTTPResponse response = http.send(req); 
                string responsebody = response.getBody();
                system.debug('loanresponse->'+responsebody);
                
                
            }
            else{
                token=Loan_Creation.AUTHENTICATION();
                //Get UNIQUE_REQUEST_ID
                
                // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
                list<Loan_API__c> Loanunqno=[select UNIQUE_REQUEST_ID__c,FORMNO__c from Loan_API__c Limit 1];      
                UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c);    
                
                // AUTHENTICATION details
                AUTHENTICATION= '{"AUTHENTICATION":';
                AUTHENTICATION+='{"TOKEN":"'+token+'",';
                AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
                AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
                // PROSPECT_DETAILS 
                PROSPECT_DETAILS='"PROSPECT_DETAILS":{';
                PROSPECT_DETAILS+='"PROSPECT_CODE":"'+la.Prospect_Code__c+'"}';
                
                Final_json=AUTHENTICATION+PROSPECT_DETAILS+'}';
                LoanAuth=[select Loan_TAT__c from LOAN_AUTHENTICATION__mdt Limit 1];
                endpoint=LoanAuth[0].Loan_TAT__c;  
                HttpRequest req = new HttpRequest();
                req.setHeader('Accept', '*/*');
                req.setHeader('Content-Type', 'application/json;charset=UTF-8');
                req.setEndpoint(endpoint);
                req.setMethod('POST');
                req.setbody(Final_json);
                Http http = new Http();
                HTTPResponse response = http.send(req); 
                string responsebody = response.getBody();
                system.debug('loanresponse->'+responsebody);
                
            }
            
            
        }
        
        
        return null;
        
        
        
    }
    
}