global class Loan_TAT_Batch implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts {
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String status = 'Disbursed';
        string status1='Rejected';
        return Database.getQueryLocator([SELECT id,Applicant_Code__c,Applicant__r.name,LOAN_STATUS__c,
                                         Prospect_Code__c,Prospect_ID__c FROM Loan_Account__c WHERE (LOAN_STATUS__c!=:status or LOAN_STATUS__c!=:status1) and Prospect_Code__c!=:Null and Applicant_Code__c!=:Null]);
    }
    global void execute(Database.BatchableContext BC, List<Loan_Account__c > scope) {
        if(scope != null && scope.size()>0){
            
            string AUTHENTICATION;
            string PROSPECT_DETAILS;
            string token;
            string PROSPECTCODE;
            integer no_of_loan=1;
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
            string la_Imd_START_DATE_TIME;
            string la_Imd_END_DATE_TIME;
            String la_Imd_STATUS;
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
            Map<id,List<Loan_Account__c >> Loan_Account_List_Map = new Map<id,List<Loan_Account__c >>();
            map<id,string>Prospectcodemap= new map<id,string>();
            map<string,id>loan_proscode_map= new map<string,id>();
            list<Loan_Account__c> loan_tat_Update= new list<Loan_Account__c>();
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
            
            // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
            list<Loan_TAT__c> Loanunqno=[select UNIQUE_REQUEST_ID__c from Loan_TAT__c Limit 1];      
            UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c); 
            // AUTHENTICATION details
            AUTHENTICATION= '{"AUTHENTICATION":';
            AUTHENTICATION+='{"TOKEN":"'+token+'",';
            AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
            AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
            // PROSPECT_DETAILS 
            PROSPECT_DETAILS='"PROSPECT_DETAILS":[';
            
            for(id loanid :Loan_Account_List_Map.keyset()){
                system.debug('Loan_Account_List_Map size->'+Loan_Account_List_Map.size());
                if(no_of_loan<Loan_Account_List_Map.size()){         
                    if(Prospectcodemap.containsKey(loanid)){
                        PROSPECTCODE=Prospectcodemap.get(loanid);
                        system.debug('PROSPECTCODE->'+PROSPECTCODE);
                        no_of_loan=no_of_loan+1;
                        PROSPECT_DETAILS+='{"PROSPECT_CODE":"'+PROSPECTCODE+'"},';
                        system.debug('no_of_loan->'+no_of_loan);
                    }
                    
                }
                if(no_of_loan==Loan_Account_List_Map.size()){         
                    if(Prospectcodemap.containsKey(loanid)){
                        PROSPECTCODE=Prospectcodemap.get(loanid);
                        system.debug('PROSPECTCODE->'+PROSPECTCODE);
                        system.debug('no_of_loan final->'+no_of_loan);
                        PROSPECT_DETAILS+='{"PROSPECT_CODE":"'+PROSPECTCODE+'"}]';
                    }
                }
                
                
            }
            system.debug('PROSPECT_DETAILS->'+PROSPECT_DETAILS);
            
            Final_json=AUTHENTICATION+PROSPECT_DETAILS+'}';
            system.debug('Final_json->'+Final_json);
            
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
            responsebody = responsebody.replace (',""','');
            system.debug('loanresponse after Modification->'+responsebody);
            // Updating the UNIQUE_REQUEST_ID
            Loan_TAT_Sync_Button.updateloanAPISetting(UNIQUE_REQUEST_ID);
            
            Loan_TAT_Response_Batch_parse Loan_TAT_res= new Loan_TAT_Response_Batch_parse();
            Loan_TAT_res=Loan_TAT_Response_Batch_parse.parse(responsebody);
            
            system.debug('status->'+string.valueof(Loan_TAT_res.STATUS));
            system.debug('message->'+string.valueof(Loan_TAT_res.MESSAGE));
            system.debug('Loan_TAT_res->'+Loan_TAT_res);
            STATUS=string.valueof(Loan_TAT_res.STATUS);
            MESSAGE=string.valueof(Loan_TAT_res.MESSAGE);
            system.debug('STATUS->'+STATUS);
            system.debug('STATUS->'+MESSAGE);
            
            list<Loan_TAT_Response_Batch_parse.LOAN_DETAIL> LOAN_DETAIL=new  list<Loan_TAT_Response_Batch_parse.LOAN_DETAIL>();
            LOAN_DETAIL=Loan_TAT_res.LOAN_DETAIL.LOAN_DETAIL;
            
            if(LOAN_DETAIL!=null && STATUS=='S'&& MESSAGE=='SUCCESS'){
                
                for(Loan_TAT_Response_Batch_parse.LOAN_DETAIL Ld :LOAN_DETAIL){
                    
                    Loan_PROSPECT_CODE=Ld.PROSPECT_CODE;
                    system.debug('la_Prospect_Code->'+Loan_PROSPECT_CODE);
                    system.debug('TECHNICAL_VALUATION->'+Ld.TECHNICAL_VALUATION);
                    system.debug('LEGAL_VALUATION->'+Ld.LEGAL_VALUATION);
                    system.debug('VERIFICATION->'+Ld.VERIFICATION);
                    system.debug('PRODUCT_NAME->'+Ld.PRODUCT_NAME);
                    system.debug('LOAN_STATUS->'+Ld.LOAN_STATUS);
                    system.debug('DISBAMT->'+Ld.DISBAMT);
                    system.debug('SANCTIONED_AMOUNT->'+Ld.SANCTIONED_AMOUNT);
                    system.debug('INSURANCE_AMT_TOTAL->'+Ld.INSURANCE_AMT_TOTAL);
                    system.debug('INST_TYPE->'+Ld.INST_TYPE);
                    system.debug('DPD->'+Ld.DPD);
                    system.debug('PF_AMOUNT->'+Ld.PF_AMOUNT);
                    system.debug('POS->'+Ld.POS);
                    system.debug('REJECT_REMARKS->'+Ld.REJECT_REMARKS);
                    system.debug('INT_RATE->'+Ld.INT_RATE);
                    system.debug('REJECT_ACTION_TYPE->'+Ld.REJECT_ACTION_TYPE);
                    system.debug('IMDDETAIL->'+ Ld.IMDDETAIL);
                    system.debug('DISBURSAL_DATE->'+Ld.DISBURSAL_DATE);
                    system.debug('LOGINDETAIL.START_DATE_TIME->'+Ld.LOGINDETAIL.START_DATE_TIME);
                    system.debug('SANCTION_DATE->'+Ld.SANCTION_DATE);
                    system.debug('MATURITY_DATE->'+Ld.MATURITY_DATE);
                    system.debug('EMI_START_DATE->'+ Ld.EMI_START_DATE);
                    list<Loan_TAT_Response_Batch_parse.TECHNICAL_VALUATION>TECHNICAL_VALUATION= new list<Loan_TAT_Response_Batch_parse.TECHNICAL_VALUATION>();
                    list<Loan_TAT_Response_Batch_parse.LEGAL_VALUATION>LEGAL_VALUATION= new list<Loan_TAT_Response_Batch_parse.LEGAL_VALUATION>();
                    list<Loan_TAT_Response_Batch_parse.CREDIT_DECISION>CREDIT_DECISION= new list<Loan_TAT_Response_Batch_parse.CREDIT_DECISION>();
                    list<Loan_TAT_Response_Batch_parse.VERIFICATION>VERIFICATION= new list<Loan_TAT_Response_Batch_parse.VERIFICATION>();
                    list<Loan_TAT_Response_Batch_parse.IMDDETAIL>IMDDETAIL= new list<Loan_TAT_Response_Batch_parse.IMDDETAIL>();
                    
                    if(Ld.TECHNICAL_VALUATION!=null){
                        TECHNICAL_VALUATION=Ld.TECHNICAL_VALUATION;
                    }
                    if(Ld.LEGAL_VALUATION!=null){
                        LEGAL_VALUATION=Ld.LEGAL_VALUATION;
                    }
                    if(Ld.CREDIT_DECISION!=null){
                        CREDIT_DECISION=Ld.CREDIT_DECISION;
                    }
                    if(Ld.VERIFICATION!=null){
                        VERIFICATION=Ld.VERIFICATION;
                    }
                    if(Ld.IMDDETAIL!=null){
                    IMDDETAIL=Ld.IMDDETAIL;
                   }
                    if(IMDDETAIL!=null || !IMDDETAIL.isEmpty()){
                        
                        for(Loan_TAT_Response_Batch_parse.IMDDETAIL imd:IMDDETAIL){
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
                        
                        for(Loan_TAT_Response_Batch_parse.TECHNICAL_VALUATION tec:TECHNICAL_VALUATION){
                            if(tec.START_DATE_TIME!=null && (tec.END_DATE_TIME==null ||tec.END_DATE_TIME!=null) ){
                                la_tec_START_DATE_TIME=tec.START_DATE_TIME;
                            }
                            break;
                        } 
                        for(Loan_TAT_Response_Batch_parse.TECHNICAL_VALUATION tec:TECHNICAL_VALUATION){
                                if( tec.END_DATE_TIME!=null){
                                    la_tec_END_DATE_TIME=tec.END_DATE_TIME;
                                }
                                if(tec.TECHNICAL_STATUS!=null && tec.END_DATE_TIME!=null){
                                    la_tec_TECHNICAL_STATUS=tec.TECHNICAL_STATUS;  
                                }
                                
                            }
                            
                            
                        } 
                                                

                    if(LEGAL_VALUATION!=null || !LEGAL_VALUATION.isEmpty()){
                        integer leg_size=LEGAL_VALUATION.size();
                        
                        for(Loan_TAT_Response_Batch_parse.LEGAL_VALUATION leg:LEGAL_VALUATION){
                            if(leg.START_DATE_TIME!=null && (leg.END_DATE_TIME==null ||leg.END_DATE_TIME==null)){
                                la_leg_START_DATE_TIME=leg.START_DATE_TIME;
                            }
                            break;
                        } 
                        for(Loan_TAT_Response_Batch_parse.LEGAL_VALUATION leg:LEGAL_VALUATION){
                                if(leg.END_DATE_TIME!=null){
                                    la_leg_END_DATE_TIME=leg.END_DATE_TIME;
                                }
                                if(leg.END_DATE_TIME!=null && leg.LEGAL_STATUS!=null){
                                    la_leg_STATUS=leg.LEGAL_STATUS;  
                                }   
                            }
                         
                    }   
                    if(VERIFICATION!=null || !VERIFICATION.isEmpty()){
                        integer vef_size=VERIFICATION.size();
                        
                        for(Loan_TAT_Response_Batch_parse.VERIFICATION vef:VERIFICATION){
                            if(vef.START_DATE_TIME!=null && (vef.END_DATE_TIME==null || vef.END_DATE_TIME!=null)){
                                la_ver_START_DATE_TIME=vef.START_DATE_TIME; 
                            }
                            break;
                        } 
                        for(Loan_TAT_Response_Batch_parse.VERIFICATION vef:VERIFICATION){
                                if(vef.END_DATE_TIME!=null){
                                    la_ver_END_DATE_TIME=vef.END_DATE_TIME;
                                }
                                if( vef.END_DATE_TIME!=null && vef.VERIFICATION_STATUS!=null){
                                    la_ver_STATUS=vef.VERIFICATION_STATUS;  
                                }
                            }
                        }
                    if(CREDIT_DECISION!=null || !CREDIT_DECISION.isEmpty()){
                        integer cd_size=CREDIT_DECISION.size();
                        
                        for(Loan_TAT_Response_Batch_parse.CREDIT_DECISION crd:CREDIT_DECISION){
                            if(crd.START_DATE_TIME!=null && (crd.END_DATE_TIME==null ||crd.END_DATE_TIME!=null)){
                                la_crd_START_DATE_TIME=crd.START_DATE_TIME;
                                
                            }
                            break;
                        } 
                        for(Loan_TAT_Response_Batch_parse.CREDIT_DECISION crd:CREDIT_DECISION){
                                if(crd.END_DATE_TIME!=null){
                                    la_crd_END_DATE_TIME=crd.END_DATE_TIME;
                                }
                            }
                        }  
                    
                    
                    if(loan_proscode_map.containskey(Loan_PROSPECT_CODE)){
                        
                        Loan_Account__c loan_tat= new Loan_Account__c();
                        
                        loan_tat.id=loan_proscode_map.get(Ld.PROSPECT_CODE);
                        if(string.isNotBlank(Ld.PRODUCT_NAME)){
                            loan_tat.Product__c=Ld.PRODUCT_NAME;
                        }
                        if(string.isNotBlank(Ld.LOAN_STATUS)){
                            loan_tat.LOAN_STATUS__c=Ld.LOAN_STATUS;
                        }
                        if(Ld.DISBAMT!=null){
                            loan_tat.Disbursal_Amount__c=decimal.valueOf(Ld.DISBAMT);  
                        }
                        
                        if(Ld.SANCTIONED_AMOUNT!=null){
                            loan_tat.Sanctioned_Amount__c=decimal.valueOf(Ld.SANCTIONED_AMOUNT);
                        }
                        
                        if(string.isNotBlank(Ld.INSURANCE_AMT_TOTAL) || string.isNotEmpty(Ld.INSURANCE_AMT_TOTAL)){
                            loan_tat.Insurance_Amount__c=decimal.valueOf(Ld.INSURANCE_AMT_TOTAL);
                        }
                        if((string.isNotBlank(Ld.INST_TYPE)) || (string.isNotEmpty(Ld.INST_TYPE))){
                            loan_tat.Installment_Frequency__c=Ld.INST_TYPE;
                        }
                        
                        if(string.isNotBlank(Ld.DPD)){
                            
                            loan_tat.DPD__c=decimal.valueOf(Ld.DPD);  
                        }
                        if(string.isNotBlank(Ld.PF_AMOUNT)){
                            loan_tat.PF_Amount__c=decimal.valueOf(Ld.PF_AMOUNT);
                        }
                        if(string.isNotBlank(Ld.POS)){
                            loan_tat.Principal_Outstanding__c=decimal.valueOf(Ld.POS);
                        }
                        if(string.isNotBlank(Ld.REJECT_REMARKS)){
                            loan_tat.Reject_Remarks__c=Ld.REJECT_REMARKS;
                        }
                        if(string.isNotBlank(Ld.INT_RATE)){
                            loan_tat.Approved_ROI__c=decimal.valueOf(Ld.INT_RATE);  
                        }
                        if(string.isNotBlank(Ld.LOAN_STATUS)){
                            loan_tat.Final_Decision_Status__c=Ld.LOAN_STATUS;
                        }
                        if(string.isNotBlank(Ld.REJECT_ACTION_TYPE)){
                            loan_tat.Reject_Reason__c=Ld.REJECT_ACTION_TYPE;
                        }
                        
                        if(string.isNotBlank(la_tec_TECHNICAL_STATUS)){
                            loan_tat.Technical_Status__c=la_tec_TECHNICAL_STATUS;
                        }
                        if(string.isNotBlank(la_leg_STATUS)){
                            loan_tat.Legal_Status__c=la_leg_STATUS;
                        }if(string.isNotBlank(la_Imd_STATUS)){
                            
                            loan_tat.IMD_STATUS__c=la_Imd_STATUS;                            
                        }
                        
                        // Date fields are capture in string variable.
                        if(string.isNotBlank(Ld.DISBURSAL_DATE)){
                            la_DISBURSAL_DATE=Ld.DISBURSAL_DATE;
                        }
                        if(string.isNotBlank(Ld.LOGINDETAIL.START_DATE_TIME)){
                            la_Login_Date=Ld.LOGINDETAIL.START_DATE_TIME;
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
                            date DISB_date=Loan_TAT_Batch.convertstringtodate(la_DISBURSAL_DATE);
                            loan_tat.Disbursal_Date__c=DISB_date;   
                        }
                        if(string.isNotEmpty(la_Login_Date)){
                            date login_date=Loan_TAT_Batch.convertstringtodate(la_Login_Date);
                            loan_tat.Login_Date__c=login_date;   
                        }
                        if(string.isNotEmpty(la_Sanction_Date)){
                            date Sanction_date=Loan_TAT_Batch.convertstringtodate(la_Sanction_Date);
                            loan_tat.Sanction_Date__c=Sanction_date;   
                        }
                        if(string.isNotEmpty(la_Maturity_Date)){
                            date Maturity_date=Loan_TAT_Batch.convertstringtodate(la_Maturity_Date);
                            loan_tat.Maturity_Date__c=Maturity_date;   
                        }
                        if(string.isNotEmpty(la_First_EMI_Date)){
                            date First_EMI_date=Loan_TAT_Batch.convertstringtodate(la_First_EMI_Date);
                            loan_tat.First_EMI_Date__c=First_EMI_date;   
                        }
                        if(string.isNotEmpty(la_Imd_START_DATE_TIME)){
                            date Imd_START_date=Loan_TAT_Batch.convertstringtodate(la_Imd_START_DATE_TIME);
                            loan_tat.IMD_Presentation_Date__c=Imd_START_date;   
                        }
                        if(string.isNotEmpty(la_Imd_END_DATE_TIME)){
                            date Imd_End_date=Loan_TAT_Batch.convertstringtodate(la_Imd_END_DATE_TIME);
                            loan_tat.IMD_Clearance_Date__c=Imd_End_date;   
                        }
                        if(string.isNotEmpty(la_tec_START_DATE_TIME)){
                            date tec_START_DATE_TIME=Loan_TAT_Batch.convertstringtodate(la_tec_START_DATE_TIME);
                            loan_tat.Technical_Start_Date__c=tec_START_DATE_TIME;   
                        }
                        if(string.isNotEmpty(la_tec_END_DATE_TIME)){
                            date tec_END_DATE_TIME=Loan_TAT_Batch.convertstringtodate(la_tec_END_DATE_TIME);
                            loan_tat.Technical_Completion_Date__c=tec_END_DATE_TIME;   
                        }
                        if(string.isNotEmpty(la_leg_START_DATE_TIME)){
                            date leg_START_DATE_TIME=Loan_TAT_Batch.convertstringtodate(la_leg_START_DATE_TIME);
                            loan_tat.Legal_Start_Date__c=leg_START_DATE_TIME;   
                        }
                        if(string.isNotEmpty(la_leg_END_DATE_TIME)){
                            date leg_END_DATE_TIME=Loan_TAT_Batch.convertstringtodate(la_leg_END_DATE_TIME);
                            loan_tat.Legal_Completion_Date__c=leg_END_DATE_TIME;   
                        }
                        if(string.isNotEmpty(la_crd_START_DATE_TIME)){
                            date crd_START_DATE_TIME=Loan_TAT_Batch.convertstringtodate(la_crd_START_DATE_TIME);
                            loan_tat.Underwriting_Start_Date__c=crd_START_DATE_TIME;   
                        }
                        if(string.isNotEmpty(la_crd_END_DATE_TIME)){
                            date crd_END_DATE_TIME=Loan_TAT_Batch.convertstringtodate(la_crd_END_DATE_TIME);
                            loan_tat.Underwriting_End_Date__c=crd_END_DATE_TIME;   
                        }
                        
                        system.debug('loan_tat details->'+loan_tat);
                        
                        loan_tat_Update.add(loan_tat);
                        
                        
                    }
                    
                    if(loan_tat_Update!=null && !loan_tat_Update.isEmpty()){
                        // Updating the UNIQUE_REQUEST_ID value
                        
                        Update loan_tat_Update;
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