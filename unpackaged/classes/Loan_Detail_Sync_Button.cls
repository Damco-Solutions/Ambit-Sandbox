Global class Loan_Detail_Sync_Button {
    
    @AuraEnabled
    global  static string AuthenticationRequest(Id LoanId){
        string token;
        string UNIQUE_REQUEST_ID;
        string Prospect_Code;
        string RequestJson;
        string Status;
        string Product;
        string Error=system.label.Get_Loan_Detail;
        system.debug('class called');
        
        //try{
        Loan_Account__c[] La=[SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,Prospect_Code__c,Prospect_ID__c,Product__c FROM Loan_Account__c WHERE id=:LoanId and Prospect_Code__c!=:Null Limit 1];
        
        Prospect_Code=la[0].Prospect_Code__c;
        Product=la[0].Product__c;
        Status=la[0].LOAN_STATUS__c;
        
        if(status=='DISBURSED' && string.isNotBlank(Prospect_Code)){
            //Get TOKEN 
            token=Loan_Creation.AUTHENTICATION();
            
            // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
            list<Loan_Detail__c> Loanunqno=[select UNIQUE_REQUEST_ID__c from Loan_Detail__c Limit 1];      
            UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c); 
          
            
            // Create the Json Request For Loan TaT
            RequestJson=Loan_Detail_Sync_Button.RequestJSON(la[0],token,UNIQUE_REQUEST_ID);
            
            system.debug('RequestJson->'+RequestJson);
            // API call- sending the request to Mifin system
            string response=Loan_Detail_Sync_Button.requestack(RequestJson);
            
            // Updating the UNIQUE_REQUEST_ID value
            Loan_Detail_Sync_Button.updateloanAPISetting(UNIQUE_REQUEST_ID);
            
            // Storeing the response coming from Mifin System to Salesforce
            string Final_Response=Loan_Detail_Sync_Button.getLoan_detail_Update(response,la[0].id,Prospect_Code);
            
            return Final_Response;
            
            
            /*catch (Exception e) {
// "Convert" the exception into an AuraHandledException
throw new AuraHandledException('Something went wrong: '+ e.getMessage());    
}*/
            
        }
        else{
            return Error;
        }
    }
    
    @AuraEnabled
    global  static String RequestJSON(Loan_Account__c La,string token,string UNIQUE_REQUEST_ID){
        
        string AUTHENTICATION;
        string BASICINFO;
        // AUTHENTICATION details
        AUTHENTICATION= '{"AUTHENTICATION":';
        AUTHENTICATION+='{"TOKEN":"'+token+'",';
        AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
        AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
        
        // PROSPECT_DETAILS
        BASICINFO= '"BASICINFO":';
        BASICINFO+='{"IS_PROSPECT": "Y",';
        BASICINFO+='"RULE_ID": "",';
        BASICINFO+='"PROSPECTCODE":"'+La.Prospect_Code__c+'"}}';
        
        string Reqjson=AUTHENTICATION+BASICINFO;
        
        return Reqjson;
        
    }
    
    @AuraEnabled 
    global static string requestack(String inputjson){
        list<LOAN_AUTHENTICATION__mdt> LoanAuth=new list<LOAN_AUTHENTICATION__mdt>();
        String endpoint;
        LoanAuth=[select Get_loan_details__c from LOAN_AUTHENTICATION__mdt Limit 1];
        endpoint=LoanAuth[0].Get_loan_details__c;  
        HttpRequest req = new HttpRequest();
        req.setHeader('Accept', '*/*');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setbody(inputjson);
        Http http = new Http();
        HTTPResponse response = http.send(req); 
        string responsebody = response.getBody();
        system.debug('loanresponse->'+responsebody);
        
        return responsebody;
        
        
    }
    
    @AuraEnabled 
    global static string getLoan_detail_Update(String responsebody ,id loanAccountid, string Prospect_Code){
        String STATUS;
        String MESSAGE;
        string la_Prospect_Code;
        string la_DISBURSAL_DATE;
        string la_Login_Date;
        string la_Sanction_Date;
        string la_Maturity_Date;
        string la_First_EMI_Date;
        
        
        list<Loan_Account__c> loan_Detail_Update= new list<Loan_Account__c>();
        
        Loan_Detail_Response_sync_parse loan_detail_res= new Loan_Detail_Response_sync_parse();
        // try{
        loan_detail_res=Loan_Detail_Response_sync_parse.parse(responsebody);
        system.debug('loan_detail_res->'+loan_detail_res);
        system.debug('status->'+string.valueof(loan_detail_res.STATUS));
        system.debug('message->'+string.valueof(loan_detail_res.MESSAGE));
        
        
        STATUS=string.valueof(loan_detail_res.STATUS);
        MESSAGE=string.valueof(loan_detail_res.MESSAGE);
        system.debug('STATUS->'+STATUS);
        system.debug('STATUS->'+MESSAGE);
        if(STATUS=='F'){
              
              return MESSAGE;
            
           }
        
        if(STATUS=='S'&& MESSAGE=='SUCCESS'){
            
            system.debug('LOAN_DETAIL->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL);
            
            
            system.debug('PRODUCT_NAME->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.PRODUCT_NAME);
            system.debug('LOAN_STATUS->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS);
            system.debug('DISBAMT->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DISBAMT);
            system.debug('SANCTIONED_AMOUNT->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.SANCTIONED_AMOUNT);
            
            system.debug('INST_TYPE->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE);
            system.debug('DPD->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DPD);
            
            system.debug('POS->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.POS);
            
            system.debug('INT_RATE->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE);
            
            system.debug('DISBURSAL_DATE->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DISBURSAL_DATE);
            
            system.debug('SANCTION_DATE->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.SANCTION_DATE);
            system.debug('MATURITY_DATE->'+loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.MATURITY_DATE);
            system.debug('EMI_START_DATE->'+ loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.EMI_START_DATE);
            la_Prospect_Code=string.valueof(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.PROSPECT_CODE);
            system.debug('la_Prospect_Code->'+la_Prospect_Code);
            
            
            
            if(la_Prospect_Code==Prospect_Code){
                Loan_Account__c loan_detail= new Loan_Account__c();
                loan_detail.id=loanAccountid;
                if(string.isNotEmpty(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.PRODUCT_NAME)){
                    loan_detail.Product__c=loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.PRODUCT_NAME; 
                }
                
                if(string.isNotEmpty(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS)){
                    loan_detail.LOAN_STATUS__c=loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS;
                }
                
                if(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DISBAMT!=null){
                    loan_detail.Disbursal_Amount__c=decimal.valueOf(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DISBAMT);   
                }
                if(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.SANCTIONED_AMOUNT!=null){
                    loan_detail.Sanctioned_Amount__c=decimal.valueOf(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.SANCTIONED_AMOUNT);
                }
                
                
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE) && string.isNotEmpty(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE)){
                    loan_detail.Installment_Frequency__c=loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE;
                }
                
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DPD) && string.isNotEmpty(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DPD)){
                    
                    loan_detail.DPD__c=decimal.valueOf(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DPD);  
                }
                
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.POS) && string.isNotEmpty(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.POS)){
                    loan_detail.Principal_Outstanding__c=decimal.valueOf(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.POS);
                }
                
                if(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE!=null){
                    loan_detail.Approved_ROI__c=decimal.valueOf(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE);
                }
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS)  && string.isNotEmpty(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS)){
                    loan_detail.Final_Decision_Status__c=loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS;
                }
                
                
                system.debug('loan_detail details 1->'+loan_detail);
                
                // Date fields are capture in string variable.
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DISBURSAL_DATE)){
                    la_DISBURSAL_DATE=loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.DISBURSAL_DATE;  
                }
                
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.SANCTION_DATE)){
                    la_Sanction_Date= loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.SANCTION_DATE;
                }
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.MATURITY_DATE)){
                    la_Maturity_Date=loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.MATURITY_DATE;  
                }
                if(string.isNotBlank(loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.EMI_START_DATE)){
                    la_First_EMI_Date= loan_detail_res.LOAN_DETAIL.LOAN_DETAIL.EMI_START_DATE;
                }
                
                system.debug('loan_detail details Dates 2->'+loan_detail);
                
                
                // converting string to date Formate
                if(string.isNotEmpty(la_DISBURSAL_DATE)){
                    date DISB_date=loan_detail_Sync_Button.convertstringtodate(la_DISBURSAL_DATE);
                    loan_detail.Disbursal_Date__c=DISB_date;   
                }
                 system.debug('loan_detail.Disbursal_Date__c->'+loan_detail.Disbursal_Date__c);
                if(string.isNotEmpty(la_Sanction_Date)){
                    date Sanction_date=loan_detail_Sync_Button.convertstringtodate(la_Sanction_Date);
                    loan_detail.Sanction_Date__c=Sanction_date;   
                }
                 system.debug('loan_detail.Sanction_Date__c->'+loan_detail.Sanction_Date__c);
                if(string.isNotEmpty(la_Maturity_Date)){
                    date Maturity_date=loan_detail_Sync_Button.convertstringtodate(la_Maturity_Date);
                    loan_detail.Maturity_Date__c=Maturity_date;   
                }
                 system.debug(' loan_detail.Maturity_Date__c->'+ loan_detail.Maturity_Date__c);
                
                if(string.isNotEmpty(la_First_EMI_Date)){
                    date First_EMI_date=loan_detail_Sync_Button.convertstringtodate(la_First_EMI_Date);
                    loan_detail.First_EMI_Date__c=First_EMI_date;   
                }
                
                 system.debug('loan_detail.First_EMI_Date__c->'+loan_detail.First_EMI_Date__c);
                
                system.debug('loan_detail details->'+loan_detail);
                
                loan_Detail_Update.add(loan_detail);
                
                
            }
        }
        
        if(!loan_Detail_Update.isEmpty() && loan_Detail_Update!=null ){
            
            update loan_Detail_Update;
            
        }
        
        
        return MESSAGE; 
        
        
        //}
        /*  catch (Exception e) {
// "Convert" the exception into an AuraHandledException
throw new AuraHandledException('Darn it! Something went wrong: '
+ e.getMessage());    
}*/
    }
    
    
    //  Method to converting string to date Format
    @AuraEnabled 
    global static Date convertstringtodate(String string_date){
         Date strtoda;
         Integer myIntMonth1;
        Map<String,Integer> monthMap = new Map<String,Integer>();
        monthMap.put('JAN',1); monthMap.put('FEB',2);
        monthMap.put('MAR',3); monthMap.put('APR',4);
        monthMap.put('MAY',5); monthMap.put('JUN',6);
        monthMap.put('JUL',7); monthMap.put('AUG',8);
        monthMap.put('SEP',9); monthMap.put('OCT',10);
        monthMap.put('NOV',11); monthMap.put('DEC',12);
        string myDate=string_date;
        system.debug('myDate->'+myDate);
        String[] myDateOnly = myDate.split(' ');
         system.debug('myDateOnly->'+myDateOnly);
        String[] strDate = myDateOnly[0].split('-');
         system.debug('strDate->'+strDate);
        Integer year_len=strDate[2].length();
        system.debug('year_len->'+year_len);
        Integer myIntDate = Integer.valueOf(strDate[0]);
        system.debug('myIntDate->'+myIntDate);
        Integer myIntMonth = monthMap.get(strDate[1]);
        system.debug('myIntMonth->'+myIntMonth);
        if(myIntMonth==null){
           myIntMonth1 = Integer.valueOf(strDate[1]); 
        }
        
        system.debug('myIntMonth->'+myIntMonth1);
        Integer myIntYear ;
        if(year_len==4){
            myIntYear = integer.valueOf(strDate[2]);
        }else{
            myIntYear = integer.valueOf('20'+strDate[2]);
        }
         if(myIntMonth!=null){
       strtoda= Date.newInstance(myIntYear, myIntMonth, myIntDate);
       }else{
        strtoda= Date.newInstance(myIntYear, myIntMonth1, myIntDate);
       }
        
        return strtoda;
    }
     //updating custom setting value.
     @AuraEnabled
    global  static void updateloanAPISetting(string unqiueid){
        list<Loan_Detail__c> Loanunqno=[select UNIQUE_REQUEST_ID__c from Loan_Detail__c ]; 
        list<Loan_Detail__c> Loanunqupdate= new list<Loan_Detail__c>();
        
        for(Loan_Detail__c ls:Loanunqno){
            ls.UNIQUE_REQUEST_ID__c=decimal.valueOf(unqiueid)+1;
            Loanunqupdate.add(ls);
            
        }
        system.debug('Loanunqupdate->'+Loanunqupdate);
        update Loanunqupdate;
        
    }
    
    
}