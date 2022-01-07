global class Loan_Details_Batch implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String status = 'Disbursed';
         string status1='Rejected';
        return Database.getQueryLocator([SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,
                                         Prospect_Code__c,Prospect_ID__c FROM Loan_Account__c WHERE (LOAN_STATUS__c=:status or LOAN_STATUS__c!=:status1) and Prospect_Code__c!=:Null]);
    }
    
    global void execute(Database.BatchableContext BC, List<Loan_Account__c > scope) {
        if(scope != null && scope.size()>0){
            Map<id,List<Loan_Account__c >> Loan_Account_List_Map = new Map<id,List<Loan_Account__c >>();
            map<id,string>Prospectcodemap= new map<id,string>();
            map<string,id>loan_proscode_map= new map<string,id>();
            string AUTHENTICATION;
            string BASICINFO;
            string token;
            string PROSPECTCODE;
            integer no_of_loan=0;
            String Final_json;
            String endpoint;
            string Loan_PROSPECT_CODE;
            String STATUS;
            String MESSAGE;
            string la_Prospect_Code;
            string la_DISBURSAL_DATE;
            string la_Login_Date;
            string la_Sanction_Date;
            string la_Maturity_Date;
            string la_First_EMI_Date;
            list<Loan_Account__c> loan_Detail_Update= new list<Loan_Account__c>();
            list<LOAN_AUTHENTICATION__mdt> LoanAuth=new list<LOAN_AUTHENTICATION__mdt>();
            for(Loan_Account__c loa:scope){
                if(Loan_Account_List_Map.get(loa.id)==null){
                    Loan_Account_List_Map.put(loa.id,new List<Loan_Account__c>{loa});
                    
                    Prospectcodemap.put(loa.id,loa.Prospect_Code__c);
                    loan_proscode_map.put(loa.Prospect_Code__c,loa.Id);
                }else{
                    Loan_Account_List_Map.get(loa.id).add(loa);
                }
                
                
            }
            
            system.debug('Loan_Account_List_Map->'+Loan_Account_List_Map);
            system.debug('Prospectcodemap->'+Prospectcodemap);
            //Get TOKEN 
            token=Loan_Creation.AUTHENTICATION();
            //Get UNIQUE_REQUEST_ID
            string UNIQUE_REQUEST_ID;
            string form_no;
            // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
            list<Loan_API__c> Loanunqno=[select UNIQUE_REQUEST_ID__c,FORMNO__c from Loan_API__c Limit 1];      
            UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c);    
            form_no=string.valueOf(Loanunqno[0].FORMNO__c);
            // AUTHENTICATION details
            AUTHENTICATION= '{"AUTHENTICATION":';
            AUTHENTICATION+='{"TOKEN":"'+token+'",';
            AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
            AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
            // PROSPECT_DETAILS 
            BASICINFO='"BASICINFO":[';
            
            for(id loanid :Loan_Account_List_Map.keyset()){
                system.debug('Loan_Account_List_Map size->'+Loan_Account_List_Map.size());
                if(no_of_loan<Loan_Account_List_Map.size()){         
                    if(Prospectcodemap.containsKey(loanid)){
                        PROSPECTCODE=Prospectcodemap.get(loanid);
                        system.debug('PROSPECTCODE->'+PROSPECTCODE);
                        no_of_loan=no_of_loan+1;
                        BASICINFO+='{ "IS_PROSPECT": "Y",';
                        BASICINFO+='"RULE_ID": "",';
                        BASICINFO+='"PROSPECTCODE":"'+PROSPECTCODE+'"},';
                        system.debug('no_of_loan->'+no_of_loan);
                    }
                }
                 if(no_of_loan==Loan_Account_List_Map.size()){         
                    if(Prospectcodemap.containsKey(loanid)){
                        PROSPECTCODE=Prospectcodemap.get(loanid);
                        system.debug('PROSPECTCODE->'+PROSPECTCODE);
                        system.debug('no_of_loan final->'+no_of_loan);
                        BASICINFO+='{ "IS_PROSPECT": "Y",';
                        BASICINFO+='"RULE_ID": "",';
                        BASICINFO+='"PROSPECTCODE":"'+PROSPECTCODE+'"}]';
                    }
                }
                
                
            }
            system.debug('PROSPECT_DETAILS->'+BASICINFO);
            
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
            
            // Updating the UNIQUE_REQUEST_ID
            Loan_Creation.updateloanAPISetting(UNIQUE_REQUEST_ID,form_no);
            
            Loan_Detail_Response_Batch_parse loan_details_res= new Loan_Detail_Response_Batch_parse();
            loan_details_res=Loan_Detail_Response_Batch_parse.parse(responsebody);
            system.debug('loan_details_res->'+loan_details_res);
            
            system.debug('status->'+string.valueof(loan_details_res.STATUS));
            system.debug('message->'+string.valueof(loan_details_res.MESSAGE));
            system.debug('loan_details_res->'+loan_details_res);
            STATUS=string.valueof(loan_details_res.STATUS);
            MESSAGE=string.valueof(loan_details_res.MESSAGE);
            system.debug('STATUS->'+STATUS);
            system.debug('STATUS->'+MESSAGE);
            
            list<Loan_Detail_Response_Batch_parse.LOAN_DETAIL> LOAN_DETAIL=new  list<Loan_Detail_Response_Batch_parse.LOAN_DETAIL>();
            LOAN_DETAIL=loan_details_res.LOAN_DETAIL.LOAN_DETAIL;
            
            if(LOAN_DETAIL!=null && STATUS=='S'&& MESSAGE=='SUCCESS'){
                
                for(Loan_Detail_Response_Batch_parse.LOAN_DETAIL Ld :LOAN_DETAIL){
                    
                    Loan_PROSPECT_CODE=Ld.PROSPECT_CODE;
                    system.debug('la_Prospect_Code->'+Loan_PROSPECT_CODE);
                    system.debug('PRODUCT_NAME->'+Ld.PRODUCT_NAME);
                    system.debug('LOAN_STATUS->'+Ld.LOAN_STATUS);
                    system.debug('DISBAMT->'+Ld.DISBAMT);
                    system.debug('SANCTIONED_AMOUNT->'+Ld.SANCTIONED_AMOUNT);
                    system.debug('INST_TYPE->'+Ld.INST_TYPE);
                    system.debug('DPD->'+Ld.DPD);
                    system.debug('POS->'+Ld.POS);               
                    system.debug('INT_RATE->'+Ld.INT_RATE);               
                    system.debug('DISBURSAL_DATE->'+Ld.DISBURSAL_DATE);                
                    system.debug('SANCTION_DATE->'+Ld.SANCTION_DATE);
                    system.debug('MATURITY_DATE->'+Ld.MATURITY_DATE);
                    system.debug('EMI_START_DATE->'+ Ld.EMI_START_DATE);
                    
                    if(loan_proscode_map.containskey(Loan_PROSPECT_CODE)){
                        
                        Loan_Account__c loan_details= new Loan_Account__c();
                        
                        loan_details.id=loan_proscode_map.get(Ld.PROSPECT_CODE);
                        if(string.isNotBlank(Ld.PRODUCT_NAME)){
                            loan_details.Product__c=Ld.PRODUCT_NAME;
                        }
                        if(string.isNotBlank(Ld.LOAN_STATUS)){
                            loan_details.LOAN_STATUS__c=Ld.LOAN_STATUS;
                        }
                        if(Ld.DISBAMT!=null){
                            loan_details.Disbursal_Amount__c=decimal.valueOf(Ld.DISBAMT);  
                        }
                        
                        if(Ld.SANCTIONED_AMOUNT!=null){
                            loan_details.Sanctioned_Amount__c=decimal.valueOf(Ld.SANCTIONED_AMOUNT);
                        }
                        
                        if((string.isNotBlank(Ld.INST_TYPE)) || (string.isNotEmpty(Ld.INST_TYPE))){
                            loan_details.Installment_Frequency__c=Ld.INST_TYPE;
                        }
                        
                        if(string.isNotBlank(Ld.DPD)){
                            
                            loan_details.DPD__c=decimal.valueOf(Ld.DPD);  
                        }
                        
                        if(string.isNotBlank(Ld.POS)){
                            loan_details.Principal_Outstanding__c=decimal.valueOf(Ld.POS);
                        }
                        
                        if(Ld.INT_RATE!=Null){
                            loan_details.Approved_ROI__c=decimal.valueOf(Ld.INT_RATE);  
                        }
                        if(string.isNotBlank(Ld.LOAN_STATUS)){
                            loan_details.Final_Decision_Status__c=Ld.LOAN_STATUS;
                        }
                        
                        // Date fields are capture in string variable.
                        if(string.isNotBlank(Ld.DISBURSAL_DATE)){
                            la_DISBURSAL_DATE=Ld.DISBURSAL_DATE;
                        }
                        
                        if(string.isNotBlank(Ld.SANCTION_DATE)){
                            la_Sanction_Date= Ld.SANCTION_DATE;
                        }
                        if(string.isNotBlank(Ld.MATURITY_DATE)){
                            la_Maturity_Date=Ld.MATURITY_DATE;
                        }
                        if(string.isNotBlank(Ld.EMI_START_DATE)){
                            la_First_EMI_Date= Ld.EMI_START_DATE;
                        }
                        
                        // converting string to date Formate
                        if(string.isNotEmpty(la_DISBURSAL_DATE)){
                            date DISB_date=Loan_Details_Batch.convertstringtodate(la_DISBURSAL_DATE);
                            loan_details.Disbursal_Date__c=DISB_date;   
                        }
                        if(string.isNotEmpty(la_Login_Date)){
                            date login_date=Loan_Details_Batch.convertstringtodate(la_Login_Date);
                            loan_details.Login_Date__c=login_date;   
                        }
                        if(string.isNotEmpty(la_Sanction_Date)){
                            date Sanction_date=Loan_Details_Batch.convertstringtodate(la_Sanction_Date);
                            loan_details.Sanction_Date__c=Sanction_date;   
                        }
                        if(string.isNotEmpty(la_Maturity_Date)){
                            date Maturity_date=Loan_Details_Batch.convertstringtodate(la_Maturity_Date);
                            loan_details.Maturity_Date__c=Maturity_date;   
                        }
                        if(string.isNotEmpty(la_First_EMI_Date)){
                            date First_EMI_date=loan_details_Batch.convertstringtodate(la_First_EMI_Date);
                            loan_details.First_EMI_Date__c=First_EMI_date;   
                        }
                        system.debug('loan_details details->'+loan_details);
                        
                        loan_Detail_Update.add(loan_details);
                        
                        
                    }
                    
                    if(loan_Detail_Update!=null && !loan_Detail_Update.isEmpty()){
                        // Updating the UNIQUE_REQUEST_ID value
                        
                        Update loan_Detail_Update;
                    }                    
                }
                
            }
            
            
            
            
            
        } 
        
        
        
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
    
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
    
    
}