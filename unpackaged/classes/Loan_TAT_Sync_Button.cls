global class Loan_TAT_Sync_Button {
    
    @AuraEnabled
    global  static string AuthenticationRequest(Id LoanId){
        string token;
        string UNIQUE_REQUEST_ID;
        string Prospect_Code;
        string RequestJson;
        string Status;
        string Product;
        string Error=system.label.Fetch_From_LOS;
        system.debug('class called');
        
        //try{
            Loan_Account__c[] La=[SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,Prospect_Code__c,Prospect_ID__c,Product__c FROM Loan_Account__c WHERE id=:LoanId and Prospect_Code__c!=:Null Limit 1];
            
            Prospect_Code=la[0].Prospect_Code__c;
            Product=la[0].Product__c;
            Status=la[0].LOAN_STATUS__c;
          
        if(status!='DISBURSED' && string.isNotBlank(Prospect_Code)){
            //Get TOKEN 
            token=Loan_Creation.AUTHENTICATION();
            
            // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
            list<Loan_TAT__c> Loanunqno=[select UNIQUE_REQUEST_ID__c from Loan_TAT__c Limit 1];      
            UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c); 
          
            
            // Create the Json Request For Loan TaT
            RequestJson=Loan_TAT_Sync_Button.RequestJSON(la[0],token,UNIQUE_REQUEST_ID);
            
            system.debug('RequestJson->'+RequestJson);
            // API call- sending the request to Mifin system
            string response=Loan_TAT_Sync_Button.requestack(RequestJson);
            response = response.replace (',""','');
            system.debug('response after all modification->'+response);
            // Updating the UNIQUE_REQUEST_ID value
            Loan_TAT_Sync_Button.updateloanAPISetting(UNIQUE_REQUEST_ID);
            
            // Storeing the response coming from Mifin System to Salesforce
            string Final_Response=Loan_TAT_Sync_Button.getLoan_TaT_Update(response,la[0].id,Prospect_Code);
            
            return Final_Response;
            
        }
        else{
            return Error;
        }
        

            
        
        /*catch (Exception e) {
            // "Convert" the exception into an AuraHandledException
            throw new AuraHandledException('Something went wrong: '+ e.getMessage());    
        }*/
        
    }
    
    @AuraEnabled
    global  static String RequestJSON(Loan_Account__c La,string token,string UNIQUE_REQUEST_ID){
        
        string AUTHENTICATION;
        string PROSPECT_DETAILS;
        // AUTHENTICATION details
        AUTHENTICATION= '{"AUTHENTICATION":';
        AUTHENTICATION+='{"TOKEN":"'+token+'",';
        AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
        AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
        
        // PROSPECT_DETAILS 
        PROSPECT_DETAILS='"PROSPECT_DETAILS":[';
        PROSPECT_DETAILS+='{"PROSPECT_CODE":"'+La.Prospect_Code__c+'"}]}';
        
        string Reqjson=AUTHENTICATION+PROSPECT_DETAILS;
        
        return Reqjson;
        
    }
    
    @AuraEnabled 
    global static string requestack(String inputjson){
        list<LOAN_AUTHENTICATION__mdt> LoanAuth=new list<LOAN_AUTHENTICATION__mdt>();
        String endpoint;
        LoanAuth=[select Loan_TAT__c from LOAN_AUTHENTICATION__mdt Limit 1];
        endpoint=LoanAuth[0].Loan_TAT__c;  
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
    global static string getLoan_TaT_Update(String responsebody ,id loanAccountid, string Prospect_Code){
        String STATUS;
        String MESSAGE;
        string la_Prospect_Code;
        string la_DISBURSAL_DATE;
        string la_Login_Date;
        string la_Sanction_Date;
        string la_Maturity_Date;
        string la_First_EMI_Date;
        string la_Imd_START_DATE_TIME;
        string la_Imd_END_DATE_TIME;
        string la_Imd_STATUS;
        string la_tec_START_DATE_TIME;
        string la_tec_END_DATE_TIME;
        string la_tec_TECHNICAL_STATUS;
        string la_leg_START_DATE_TIME;
        string la_leg_END_DATE_TIME;
        string la_leg_STATUS;
        string la_ver_START_DATE_TIME;
        string la_ver_END_DATE_TIME;
        string la_ver_STATUS;
        string la_crd_START_DATE_TIME;
        string la_crd_END_DATE_TIME;
        
        list<Loan_Account__c> loan_tat_Update= new list<Loan_Account__c>();
        list<Loan_TAT_Response_sync_parse.TECHNICAL_VALUATION>TECHNICAL_VALUATION= new list<Loan_TAT_Response_sync_parse.TECHNICAL_VALUATION>();
        list<Loan_TAT_Response_sync_parse.LEGAL_VALUATION>LEGAL_VALUATION= new list<Loan_TAT_Response_sync_parse.LEGAL_VALUATION>();
        list<Loan_TAT_Response_sync_parse.CREDIT_DECISION>CREDIT_DECISION= new list<Loan_TAT_Response_sync_parse.CREDIT_DECISION>();
        list<Loan_TAT_Response_sync_parse.VERIFICATION>VERIFICATION= new list<Loan_TAT_Response_sync_parse.VERIFICATION>();
        list<Loan_TAT_Response_sync_parse.IMDDETAIL>IMDDETAIL= new list<Loan_TAT_Response_sync_parse.IMDDETAIL>();
        Loan_TAT_Response_sync_parse Loan_TAT_res= new Loan_TAT_Response_sync_parse();
       // try{
            Loan_TAT_res=Loan_TAT_Response_sync_parse.parse(responsebody);
            system.debug('Loan_TAT_res->'+Loan_TAT_res);
           system.debug('status->'+string.valueof(Loan_TAT_res.STATUS));
            system.debug('message->'+string.valueof(Loan_TAT_res.MESSAGE));
            
            
            STATUS=string.valueof(Loan_TAT_res.STATUS);
            MESSAGE=string.valueof(Loan_TAT_res.MESSAGE);
            system.debug('STATUS->'+STATUS);
            system.debug('STATUS->'+MESSAGE);
          if(STATUS=='F'){
              
              return MESSAGE;
            
           }
            
            if(STATUS=='S'&& MESSAGE=='SUCCESS'){

                system.debug('LOAN_DETAIL->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL);
                la_Prospect_Code=string.valueof(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PROSPECT_CODE);
                system.debug('la_Prospect_Code->'+la_Prospect_Code);
                system.debug('TECHNICAL_VALUATION->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.TECHNICAL_VALUATION);
                system.debug('LEGAL_VALUATION->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LEGAL_VALUATION);
                system.debug('VERIFICATION->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.VERIFICATION);
                system.debug('PRODUCT_NAME->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PRODUCT_NAME);
                system.debug('LOAN_STATUS->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS);
                system.debug('DISBAMT->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DISBAMT);
                system.debug('SANCTIONED_AMOUNT->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.SANCTIONED_AMOUNT);
                system.debug('INSURANCE_AMT_TOTAL->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INSURANCE_AMT_TOTAL);
                system.debug('INST_TYPE->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE);
                system.debug('DPD->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DPD);
                system.debug('PF_AMOUNT->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PF_AMOUNT);
                system.debug('POS->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.POS);
                system.debug('REJECT_REMARKS->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_REMARKS);
                system.debug('INT_RATE->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE);
                system.debug('REJECT_ACTION_TYPE->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_ACTION_TYPE);
                system.debug('IMDDETAIL->'+ Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.IMDDETAIL);
                system.debug('DISBURSAL_DATE->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DISBURSAL_DATE);
                system.debug('LOGINDETAIL.START_DATE_TIME->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOGINDETAIL.START_DATE_TIME);
                 system.debug('SANCTION_DATE->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.SANCTION_DATE);
                 system.debug('MATURITY_DATE->'+Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.MATURITY_DATE);
                 system.debug('EMI_START_DATE->'+ Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.EMI_START_DATE);
               
                
                
                if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.TECHNICAL_VALUATION!=null){
                    TECHNICAL_VALUATION=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.TECHNICAL_VALUATION;
                }
                 if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LEGAL_VALUATION!=null){
                    LEGAL_VALUATION=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LEGAL_VALUATION;
                }
                 if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.CREDIT_DECISION!=null){
                    CREDIT_DECISION=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.CREDIT_DECISION;
                }
                 if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.VERIFICATION!=null){
                    VERIFICATION=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.VERIFICATION;
                }
                if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.IMDDETAIL!=null){
                    IMDDETAIL=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.IMDDETAIL;
                }
               
                system.debug('TECHNICAL_VALUATION->'+TECHNICAL_VALUATION);
                system.debug('LEGAL_VALUATION->'+LEGAL_VALUATION);
                system.debug('VERIFICATION->'+VERIFICATION);
                system.debug('IMDDETAIL->'+IMDDETAIL);
                if(IMDDETAIL!=null || !IMDDETAIL.isEmpty()){
                    integer imd_size=IMDDETAIL.size();
                    
                    for(Loan_TAT_Response_sync_parse.IMDDETAIL imd:IMDDETAIL){
                        if(imd.START_DATE_TIME!=null){
                            la_Imd_START_DATE_TIME=imd.START_DATE_TIME;
                        }
                         if(imd.END_DATE_TIME!=null){
                            la_Imd_END_DATE_TIME=imd.END_DATE_TIME;
                        }
                        if(imd.STATUS!=null){
                            la_Imd_STATUS=imd.STATUS;
                        }
                        
                    } 
                   
                }
                
                
                if(TECHNICAL_VALUATION!=null || !TECHNICAL_VALUATION.isEmpty()){
                    integer tec_size=TECHNICAL_VALUATION.size();
                    system.debug('tec_size->'+tec_size);
                    if (tec_size==1){
                         for(Loan_TAT_Response_sync_parse.TECHNICAL_VALUATION tec:TECHNICAL_VALUATION){
                               if(tec.START_DATE_TIME!=null && tec.END_DATE_TIME!=null){
                                   la_tec_START_DATE_TIME=tec.START_DATE_TIME;
                                   la_tec_END_DATE_TIME=tec.END_DATE_TIME;
                                   la_tec_TECHNICAL_STATUS=tec.TECHNICAL_STATUS;
                         }if(tec.START_DATE_TIME!=null && tec.END_DATE_TIME==null){
                                   la_tec_START_DATE_TIME=tec.START_DATE_TIME;      
                         }
                             
                             
                  }
                    }if(tec_size!=1){    
                    for(Loan_TAT_Response_sync_parse.TECHNICAL_VALUATION tec:TECHNICAL_VALUATION){
                        if(tec.START_DATE_TIME!=null && tec.END_DATE_TIME==null){
                            system.debug('inside tech');
                            la_tec_START_DATE_TIME=tec.START_DATE_TIME;
                        }
                        break;
                    } 
                    for(Loan_TAT_Response_sync_parse.TECHNICAL_VALUATION tec:TECHNICAL_VALUATION){
                        for(Integer i = 0; i<tec_size; i++){
                            if(i==tec_size && tec.END_DATE_TIME!=null){
                                la_tec_END_DATE_TIME=tec.END_DATE_TIME;
                            }
                            if(i==tec_size && tec.TECHNICAL_STATUS!=null){
                                la_tec_TECHNICAL_STATUS=tec.TECHNICAL_STATUS;  
                            }
                            
                        }
                        
                        
                    } 
                    /*if(tec_START_DATE_TIME!=null){
for(Integer i = 0; i<tec_START_DATE_TIME.size(); i++){
la_tec_START_DATE_TIME=tec_START_DATE_TIME[0];
}
}    


if(tec_END_DATE_TIME!=null){
for(Integer i = 0; i<tec_END_DATE_TIME.size(); i++){
if(i==tec_END_DATE_TIME.size()){
la_tec_END_DATE_TIME=tec_END_DATE_TIME[i]; 
}

}
}*/    
                    
               }
                    
           }
                
                
                
                if(LEGAL_VALUATION!=null || !LEGAL_VALUATION.isEmpty()){
                    integer leg_size=LEGAL_VALUATION.size();
                    if(leg_size==1){
                         for(Loan_TAT_Response_sync_parse.LEGAL_VALUATION leg:LEGAL_VALUATION){
                        if(leg.START_DATE_TIME!=null && leg.END_DATE_TIME!=null){
                            la_leg_START_DATE_TIME=leg.START_DATE_TIME;
                            la_leg_END_DATE_TIME=leg.END_DATE_TIME;
                            la_leg_STATUS=leg.LEGAL_STATUS;  
                        }
                        if(leg.START_DATE_TIME!=null && leg.END_DATE_TIME==null){
                            la_leg_START_DATE_TIME=leg.START_DATE_TIME;
                             
                        }
                      
                    }
                        
                        
                 }
                    
                   if(leg_size!=1){ 
                    for(Loan_TAT_Response_sync_parse.LEGAL_VALUATION leg:LEGAL_VALUATION){
                        if(leg.START_DATE_TIME!=null && leg.END_DATE_TIME==null){
                            la_leg_START_DATE_TIME=leg.START_DATE_TIME;
                        }
                        break;
                    } 
                    for(Loan_TAT_Response_sync_parse.LEGAL_VALUATION leg:LEGAL_VALUATION){
                        for(Integer i = 0; i<leg_size; i++){
                            if(i==leg_size && leg.END_DATE_TIME!=null){
                                la_leg_END_DATE_TIME=leg.END_DATE_TIME;
                            }
                            if(i==leg_size && leg.LEGAL_STATUS!=null){
                                la_leg_STATUS=leg.LEGAL_STATUS;  
                            }   
                        }
                    } 
                }
             }
                if(VERIFICATION!=null || !VERIFICATION.isEmpty()){
                    integer vef_size=VERIFICATION.size();
                    
                    for(Loan_TAT_Response_sync_parse.VERIFICATION vef:VERIFICATION){
                        if(vef.START_DATE_TIME!=null && vef.END_DATE_TIME==null){
                            la_ver_START_DATE_TIME=vef.START_DATE_TIME; 
                        }
                        break;
                    } 
                    for(Loan_TAT_Response_sync_parse.VERIFICATION vef:VERIFICATION){
                        for(Integer i = 0; i<vef_size; i++){
                            if(i==vef_size && vef.END_DATE_TIME!=null){
                                la_ver_END_DATE_TIME=vef.END_DATE_TIME;
                            }
                            if(i==vef_size && vef.VERIFICATION_STATUS!=null){
                                la_ver_STATUS=vef.VERIFICATION_STATUS;  
                            }
                        }
                    }
                }
                if(CREDIT_DECISION!=null || !CREDIT_DECISION.isEmpty()){
                    integer cd_size=CREDIT_DECISION.size();
                    
                    for(Loan_TAT_Response_sync_parse.CREDIT_DECISION crd:CREDIT_DECISION){
                        
                        if(crd.START_DATE_TIME!=null && crd.END_DATE_TIME!=null){
                            la_crd_START_DATE_TIME=crd.START_DATE_TIME;
                           break; 
                        }
                       
                    } 
                      
                    for(Loan_TAT_Response_sync_parse.CREDIT_DECISION crd:CREDIT_DECISION){
                            if(crd.END_DATE_TIME!=null){
                                la_crd_END_DATE_TIME=crd.END_DATE_TIME;
                            }
                        }
                    } 
                
                
                
                if(la_Prospect_Code==Prospect_Code){
                    Loan_Account__c loan_tat= new Loan_Account__c();
                    loan_tat.id=loanAccountid;
                    if(string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PRODUCT_NAME)){
                       loan_tat.Product__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PRODUCT_NAME; 
                    }
                    
                    if(string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS)){
                      loan_tat.LOAN_STATUS__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS;
                    }
                   
                    if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DISBAMT!=null){
                      loan_tat.Disbursal_Amount__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DISBAMT);   
                    }
                    if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.SANCTIONED_AMOUNT!=null){
                        loan_tat.Sanctioned_Amount__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.SANCTIONED_AMOUNT);
                    }
    
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INSURANCE_AMT_TOTAL) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INSURANCE_AMT_TOTAL)){
                        loan_tat.Insurance_Amount__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INSURANCE_AMT_TOTAL);
                    }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE)){
                        loan_tat.Installment_Frequency__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INST_TYPE;
                    }

                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DPD) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DPD)){
                        
                        loan_tat.DPD__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DPD);  
                    }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PF_AMOUNT) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PF_AMOUNT)){
                        loan_tat.PF_Amount__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PF_AMOUNT);
                    }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.POS) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.POS)){
                        loan_tat.Principal_Outstanding__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.POS);
                    }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_REMARKS) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_REMARKS)){
                        loan_tat.Reject_Remarks__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_REMARKS;
                    } 
                    
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE) && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE)){
                      loan_tat.Approved_ROI__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.INT_RATE);
                     }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS)  && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS)){
                    loan_tat.Final_Decision_Status__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOAN_STATUS;
                    }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_ACTION_TYPE)  && string.isNotEmpty(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_ACTION_TYPE)){
                    loan_tat.Reject_Reason__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.REJECT_ACTION_TYPE;
                    }
                    if( string.isNotEmpty(la_Imd_STATUS)){
                        loan_tat.IMD_STATUS__c=la_Imd_STATUS;
                    }
                    if(string.isNotBlank(la_tec_TECHNICAL_STATUS) && string.isNotEmpty(la_tec_TECHNICAL_STATUS)){
                        loan_tat.Technical_Status__c=la_tec_TECHNICAL_STATUS;
                    }
                    if(string.isNotBlank(la_leg_STATUS)){
                        loan_tat.Legal_Status__c=la_leg_STATUS;
                    }
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.CURRENTLY_ASSIGNED_TO)){
                        loan_tat.Pending_With__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.CURRENTLY_ASSIGNED_TO;
                    }
                      if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PROPERTY_ADDRESS)){
                        loan_tat.PROPERTY_ADDRESS_IN_CASE_OF_LAP__c=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.PROPERTY_ADDRESS;
                    }
                      if(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.TENOR!=null){
                        loan_tat.Residual_Tenure__c=decimal.valueOf(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.TENOR);
                    }
                    
                     system.debug('loan_tat details 1->'+loan_tat);
                  
                    
                    if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DISBURSAL_DATE)){
                      la_DISBURSAL_DATE=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.DISBURSAL_DATE;  
                    }
                      if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOGINDETAIL.START_DATE_TIME)){
                      la_Login_Date=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.LOGINDETAIL.START_DATE_TIME;  
                    }
                      if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.SANCTION_DATE)){
                     la_Sanction_Date= Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.SANCTION_DATE;
                    }
                      if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.MATURITY_DATE)){
                     la_Maturity_Date=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.MATURITY_DATE;  
                    }
                      if(string.isNotBlank(Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.EMI_START_DATE)){
                      la_First_EMI_Date= Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL.EMI_START_DATE;
                    }

                  
                      system.debug('loan_tat details Dates 2->'+loan_tat);
                    
                    
                    // converting string to date Formate
                    if(string.isNotEmpty(la_DISBURSAL_DATE)){
                        date DISB_date=Loan_TAT_Sync_Button.convertstringtodate(la_DISBURSAL_DATE);
                        loan_tat.Disbursal_Date__c=DISB_date;   
                    }
                    if(string.isNotEmpty(la_Login_Date)){
                        date login_date=Loan_TAT_Sync_Button.convertstringtodate(la_Login_Date);
                        loan_tat.Login_Date__c=login_date;   
                    }
                    if(string.isNotEmpty(la_Sanction_Date)){
                        date Sanction_date=Loan_TAT_Sync_Button.convertstringtodate(la_Sanction_Date);
                        loan_tat.Sanction_Date__c=Sanction_date;   
                    }
                    if(string.isNotEmpty(la_Maturity_Date)){
                        date Maturity_date=Loan_TAT_Sync_Button.convertstringtodate(la_Maturity_Date);
                        loan_tat.Maturity_Date__c=Maturity_date;   
                    }
                    if(string.isNotEmpty(la_First_EMI_Date)){
                        date First_EMI_date=Loan_TAT_Sync_Button.convertstringtodate(la_First_EMI_Date);
                        loan_tat.First_EMI_Date__c=First_EMI_date;   
                    }
                    if(string.isNotEmpty(la_Imd_START_DATE_TIME)){
                        date Imd_START_date=Loan_TAT_Sync_Button.convertstringtodate(la_Imd_START_DATE_TIME);
                        loan_tat.IMD_Presentation_Date__c=Imd_START_date;   
                    }
                    if(string.isNotEmpty(la_Imd_END_DATE_TIME)){
                        date Imd_End_date=Loan_TAT_Sync_Button.convertstringtodate(la_Imd_END_DATE_TIME);
                        loan_tat.IMD_Clearance_Date__c=Imd_End_date;   
                    }
                     if(string.isNotEmpty(la_tec_START_DATE_TIME)){
                        date tec_START_DATE_TIME=Loan_TAT_Sync_Button.convertstringtodate(la_tec_START_DATE_TIME);
                        loan_tat.Technical_Start_Date__c=tec_START_DATE_TIME;   
                    }
                     if(string.isNotEmpty(la_tec_END_DATE_TIME)){
                        date tec_END_DATE_TIME=Loan_TAT_Sync_Button.convertstringtodate(la_tec_END_DATE_TIME);
                        loan_tat.Technical_Completion_Date__c=tec_END_DATE_TIME;   
                    }
                     if(string.isNotEmpty(la_leg_START_DATE_TIME)){
                        date leg_START_DATE_TIME=Loan_TAT_Sync_Button.convertstringtodate(la_leg_START_DATE_TIME);
                        loan_tat.Legal_Start_Date__c=leg_START_DATE_TIME;   
                    }
                     if(string.isNotEmpty(la_leg_END_DATE_TIME)){
                        date leg_END_DATE_TIME=Loan_TAT_Sync_Button.convertstringtodate(la_leg_END_DATE_TIME);
                        loan_tat.Legal_Completion_Date__c=leg_END_DATE_TIME;   
                    }
                     if(string.isNotEmpty(la_crd_START_DATE_TIME)){
                        date crd_START_DATE_TIME=Loan_TAT_Sync_Button.convertstringtodate(la_crd_START_DATE_TIME);
                        loan_tat.Underwriting_Start_Date__c=crd_START_DATE_TIME;   
                    }
                    if(string.isNotEmpty(la_crd_END_DATE_TIME)){
                        date crd_END_DATE_TIME=Loan_TAT_Sync_Button.convertstringtodate(la_crd_END_DATE_TIME);
                        loan_tat.Underwriting_End_Date__c=crd_END_DATE_TIME;   
                    }
                    

                    system.debug('loan_tat details->'+loan_tat);

                    loan_tat_Update.add(loan_tat);
                    
                    
                }
            }
            
            if(!loan_tat_Update.isEmpty() && loan_tat_Update!=null ){
                
                update loan_tat_Update;
                
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
        list<Loan_TAT__c> Loanunqno=[select UNIQUE_REQUEST_ID__c from Loan_TAT__c ]; 
        list<Loan_TAT__c> Loanunqupdate= new list<Loan_TAT__c>();
        
        for(Loan_TAT__c ls:Loanunqno){
            ls.UNIQUE_REQUEST_ID__c=decimal.valueOf(unqiueid)+1;
            Loanunqupdate.add(ls);
            
        }
        system.debug('Loanunqupdate->'+Loanunqupdate);
        update Loanunqupdate;
        
    }
        
}