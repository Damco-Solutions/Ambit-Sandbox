global  with sharing class Loan_Creation {
    
    @AuraEnabled
    global  static string Applicantload(Id AppId){
        string Division;
        string token;
        string PROSPECTID;
        string PROSPECTCODE;
        string UNIQUE_REQUEST_ID;
        string form_no;
        string status;
        string message;
        string error;
        string loanresponse;
        string issuerespone;
        string Loandetails;
        map<string,string>Applicantmap= new map<string,string>();
        map<string,string>Co_gr_appmap= new map<string,string>();
        map<string,string>Applicantcodemap= new map<string,string>();
        map<string,string>Co_gr_appcodemap= new map<string,string>();
        map<string,string>Applicanttypemap= new map<string,string>();
        map<string,string>Co_gr_apptypemap= new map<string,string>();
        map<string,list<Loan_Creation_response.ADDRESS_DETAIL>> app_addressmap= new map<string,list<Loan_Creation_response.ADDRESS_DETAIL>>();
        map<string,list<Loan_Creation_response.ADDRESS_DETAIL>> coapp_addressmap=new map<string,list<Loan_Creation_response.ADDRESS_DETAIL>>();
        
        // Geeting UNIQUE_REQUEST_ID,FORMNO value from custom setting.
        list<Loan_API__c> Loanunqno=[select UNIQUE_REQUEST_ID__c,FORMNO__c from Loan_API__c Limit 1];      
        UNIQUE_REQUEST_ID= string.valueOf(Loanunqno[0].UNIQUE_REQUEST_ID__c);    
        form_no=string.valueOf(Loanunqno[0].FORMNO__c);
        system.debug('formno->'+form_no);
        system.debug('UNIQUE_REQUEST_ID->'+UNIQUE_REQUEST_ID);
        Contact [] con = [SELECT id,Pan_Card__C, Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                          State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                          RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                          Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                          Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                          Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Parent_Applicant__r.Applicant_Code__c,FORMNO__c,OFFICE_ADDRESS_ID__c,PERMANENT_ADDRESS_ID__c,RESIDENCE_ADDRESS_ID__c,
                          GST_Applicable__c,GST_Number__c,Segment__c,Cluster__c,Type_of_Business__c,Time_at_Current_Address__c,Flat_House_Number_Office__c,Building_Street_Name_Office__c,Area_Office__c,District_Office__c,City_Office__c,State_Office__c,Pincode_Office__c,
                          Mailing_Current_Address__c,Mailing_Permanent_Address__c,Mailing_Office_Address__c,Destination_Permanent_Address__c,Destination_Office_Address__c,Destination_Current_Address__c,Pan_Card_Form_60__c,Document_No__c,Document_Type__c,Sourcing_Channel_1__c,
                          SOURCING_AGENT_1__c,Channel__c,Agent__r.Sec_Sourcing_Channel__c,Agent__r.DSA_Connector__c,Agent__r.Agent_Code__pc,Agent__r.Sourcing_Channel_2__c,CIBIL_SCORE_DATE__c,Date_of_Incorporation__c,CIN_Number__c,Company_Name_NON_ind__c,Status__c,Created_date__c,Relationship_Manager__c,Relationship_Manager__r.Name,ASSIGNED_TO__c FROM Contact WHERE id=:AppId ];
        
        Contact [] coapp_grant = [SELECT id,Pan_Card__C,Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                                  State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                                  RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                                  Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Applicant_Code__c,OFFICE_ADDRESS_ID__c,PERMANENT_ADDRESS_ID__c,RESIDENCE_ADDRESS_ID__c,
                                  GST_Applicable__c,GST_Number__c,Segment__c,Cluster__c,Type_of_Business__c,Time_at_Current_Address__c,Flat_House_Number_Office__c,Building_Street_Name_Office__c,Area_Office__c,District_Office__c,City_Office__c,State_Office__c,Pincode_Office__c,
                                  Mailing_Current_Address__c,Mailing_Permanent_Address__c,Mailing_Office_Address__c,Destination_Permanent_Address__c,Destination_Office_Address__c,Destination_Current_Address__c,Pan_Card_Form_60__c,Document_No__c,Document_Type__c,Sourcing_Channel_1__c,
                                  SOURCING_AGENT_1__c,Channel__c,Agent__r.Sec_Sourcing_Channel__c,Agent__r.DSA_Connector__c,Agent__r.Agent_Code__pc,Agent__r.Sourcing_Channel_2__c,CIBIL_SCORE_DATE__c,Date_of_Incorporation__c,CIN_Number__c,Company_Name_NON_ind__c,Status__c,Created_date__c,Relationship_Manager__c,Relationship_Manager__r.Name,ASSIGNED_TO__c FROM Contact WHERE id in:getcoapplicant(con[0])];
        
        
        system.debug('coapp_grant->'+coapp_grant);
        
        if(con[0].Status__c!='Prospect' && con[0].Applicant_Type__c=='APPLICANT'){
            
            issuerespone=System.Label.PUSH_TO_LOS_On_Applicant;
        }
        if(con[0].Status__c!='Prospect' && (con[0].Applicant_Type__c=='CO-APPLICANT'||con[0].Applicant_Type__c=='GUARANTOR')){
            
            issuerespone=System.Label.PUSH_TO_LOS_On_CO_Applicant;
        }
        
        if(con[0].Status__c=='Prospect' && con[0].Applicant_Type__c=='APPLICANT'){
            
            for(contact mainapp:con){
            Applicantmap.put(mainapp.Name,mainapp.id);
            Applicanttypemap.put(mainapp.Name,mainapp.Applicant_Type__c);
        }
        
        for(contact co_gr_app:coapp_grant){
            Co_gr_appmap.put(co_gr_app.Name,co_gr_app.id);
            Co_gr_apptypemap.put(co_gr_app.Name,co_gr_app.Applicant_Type__c);
        }
        
        // Get  Division value
        Division=con[0].Division__c;
        
        // Get TOKEN from Mifin AUTHENTICATION
        token=Loan_Creation.AUTHENTICATION();
        
        // Create Loan Creation Request for Applicant and Co-Applicant/Guarantor        
        Loandetails=Loan_Creation.Loandetails(con[0],token,coapp_grant,UNIQUE_REQUEST_ID,form_no); 
        
        // Pass the Loan Creation Request in MIFIN System
        loanresponse=Loan_Creation.loanrequest(Loandetails,Division);
        
        // Update the UNIQUE_REQUEST_ID value
        Loan_Creation.updateloanAPISetting(UNIQUE_REQUEST_ID,form_no);
        
        // Deserailzed the Response from MIFIN System
        Loan_Creation_response lcresponse= new Loan_Creation_response();
        
        lcresponse=Loan_Creation_response.parse(loanresponse);
        system.debug('lcresponse->'+lcresponse);
        system.debug('status->'+string.valueof(lcresponse.RECEIVE.STATUS));
        system.debug('message->'+string.valueof(lcresponse.RECEIVE.MESSAGE));
        
        status=string.valueof(lcresponse.RECEIVE.STATUS);
        message=string.valueof(lcresponse.RECEIVE.MESSAGE);
        string CUSTOMER_DETAILS=string.valueof(lcresponse.RECEIVE.CUSTOMER_DETAILS);
        
        if(status=='F'){
            if(lcresponse.RECEIVE.ERR_DTLS!=null){
                error=string.valueof(lcresponse.RECEIVE.ERR_DTLS);
            }
            issuerespone=error;   
            
        }
        if(status=='S'){
            issuerespone=message;
            if(lcresponse.RECEIVE.CUSTOMER_DETAILS.LOAN_DETAIL.PROSPECTID!=null){
                PROSPECTID=string.valueof(lcresponse.RECEIVE.CUSTOMER_DETAILS.LOAN_DETAIL.PROSPECTID);
            }
            if(lcresponse.RECEIVE.CUSTOMER_DETAILS.LOAN_DETAIL.PROSPECTCODE!=null){
                 PROSPECTCODE=lcresponse.RECEIVE.CUSTOMER_DETAILS.LOAN_DETAIL.PROSPECTCODE;
            }
            

            list<Loan_Creation_response.CUSTOMER_DETAIL> CUSTOMER_DETAIL=new  list<Loan_Creation_response.CUSTOMER_DETAIL>();
            list<Loan_Creation_response.ADDRESS_DETAIL> ADDRESS_DETAIL=new list<Loan_Creation_response.ADDRESS_DETAIL>();
            if(lcresponse.RECEIVE.CUSTOMER_DETAILS.LOAN_DETAIL.CUSTOMER_DETAIL!=null){
                 CUSTOMER_DETAIL=lcresponse.RECEIVE.CUSTOMER_DETAILS.LOAN_DETAIL.CUSTOMER_DETAIL;
            
            }
           
            system.debug('CUSTOMER_DETAIL->'+CUSTOMER_DETAIL);
            system.debug('CUSTOMER_DETAIL->'+CUSTOMER_DETAIL.size());
            for(Loan_Creation_response.CUSTOMER_DETAIL cusdel:CUSTOMER_DETAIL){
                
                if(Applicantmap.containsKey(cusdel.APPLICANT_NAME)){
                    
                    Applicantcodemap.put(cusdel.APPLICANT_NAME,cusdel.APPLICANTCODE);
                    app_addressmap.put(cusdel.APPLICANT_NAME,cusdel.ADDRESS_DETAIL);
                    
                }else if(Co_gr_appmap.containsKey(cusdel.APPLICANT_NAME)){
                    
                    Co_gr_appcodemap.put(cusdel.APPLICANT_NAME,cusdel.APPLICANTCODE);
                    coapp_addressmap.put(cusdel.APPLICANT_NAME,cusdel.ADDRESS_DETAIL);
                }
            }
            system.debug('Applicantcodemap->'+Applicantcodemap);
            system.debug('Co_gr_appcodemap->'+Co_gr_appcodemap);
            system.debug('app_addressmap->'+app_addressmap);
            system.debug('coapp_addressmap->'+coapp_addressmap);
            Loan_Creation.updateloandetails(PROSPECTCODE,PROSPECTID,Applicantcodemap,Co_gr_appcodemap,Applicantmap,Co_gr_appmap,app_addressmap,coapp_addressmap);
            
            
            
        }
            
        }
        
        return issuerespone ;
        
    }
     @AuraEnabled
    global  static String Loandetails(Contact headerlist, string token,list<contact> coapp_grant,string UNIQUE_REQUEST_ID,string form_no)
    {
        
        
        String APPLICATION_DATE;
        String CUSTOMER_ENTITY_TYPE;
        String FATHER_FNAME;
        String FATHER_MNAME;
        String FATHER_LNAME;
        String IS_PAN_AVAILABLE;
        string AUTHENTICATION;
        String LOAN_DETAILS;
        String APPLICANT;
        String AUTHORISED_SIGN;
        String ADDRESS_DETAILS;
        string CIBIL;
        String MONTHS_OF_STAY_CURRENT_AREA;
        String DATEOFBIRTH;
        string DATE_OF_INCORPORATION;
        string CIN;
        String YEAR_OF_STAY_CURRENT_AREA;
        String EMAIL_AVAILABLE;
        string SALUTATION;
        string PRODUCT;
        string CIBIL_SCORE_DATE;
        string cibilscore;
        String EQUIFAX;
        string CRIF;
        string EXPERIAN;
        string Finaljson;
        string FirstName;
        string MiddleName;
        string LastName;
        string Non_COMPANY_NAME;
        string Ind_COMPANY_NAME;
        if(headerlist.Created_date__c!=null){
            Date cr=headerlist.Created_date__c;
            Datetime dt1 =(Datetime)cr; 
            APPLICATION_DATE = dt1.format('dd-MMM-yyyy');
            system.debug('APPLICATION_DATE->'+APPLICATION_DATE);
        }
        if(headerlist.RecordTypeId!=null){
            String recordTypeDevName=headerlist.RecordTypeId; 
            CUSTOMER_ENTITY_TYPE= Schema.getGlobalDescribe().get('contact').getDescribe().getRecordTypeInfosById().get(recordTypeDevName).getName();
            CUSTOMER_ENTITY_TYPE=CUSTOMER_ENTITY_TYPE.toUpperCase();
            system.debug('CUSTOMER_ENTITY_TYPE->'+CUSTOMER_ENTITY_TYPE);
            
        }
        if(headerlist.Applicant_Father_Name__c!=null){
            
            string fullname=headerlist.Applicant_Father_Name__c;
            fullName = fullname.trim();
            system.debug('fullName->'+fullName);
            boolean hasLength = fullName.trim().length() > 0;
            boolean containsSpace = fullName.Contains(' ');
            If( hasLength  ) {
                If(containsSpace ) {
                    FATHER_FNAME = fullName.Substring(0,fullName.indexOf(' '));
                    FATHER_LNAME = fullName.Substring(fullName.indexOf(' '),fullName.length());
                    FATHER_LNAME = FATHER_LNAME.trim();
                    if (FATHER_LNAME.length() == 0){
                        FATHER_LNAME = 'unknown';
                    }//endif
                }
                else{
                    FATHER_FNAME = fullName;
                }//endif  
            }//endif
            
        }
        if(headerlist.Pan_Card__c!=null){
            
            IS_PAN_AVAILABLE='Y';
        }else{
            IS_PAN_AVAILABLE='N';
        }
        if(headerlist.Time_at_Current_Address__c!=null){
            Decimal months=headerlist.Time_at_Current_Address__c;
            integer Monthstay= integer.valueOf(months);
            MONTHS_OF_STAY_CURRENT_AREA= string.valueOf(Monthstay);
            system.debug('MONTHS_OF_STAY_CURRENT_AREA->'+MONTHS_OF_STAY_CURRENT_AREA);
        }
        if(headerlist.Time_At_Address_In_Years__c!=null){
            integer yearstay= integer.valueOf(headerlist.Time_At_Address_In_Years__c);
            YEAR_OF_STAY_CURRENT_AREA=string.valueOf(yearstay);
            system.debug('YEAR_OF_STAY_CURRENT_AREA->'+YEAR_OF_STAY_CURRENT_AREA);
        }
        if(headerlist.Birthdate!=null){
            Date cr=headerlist.Birthdate;
            Datetime dt1 =(Datetime)cr; 
            DATEOFBIRTH = dt1.format('dd-MMM-yyyy');
            system.debug('DATEOFBIRTH->'+DATEOFBIRTH);
            
        } 
        if(headerlist.Date_of_Incorporation__c!=null){
            Date cr=headerlist.Date_of_Incorporation__c;
            Datetime dt1 =(Datetime)cr; 
            DATE_OF_INCORPORATION = dt1.format('dd-MMM-yyyy');
            system.debug('DATE_OF_INCORPORATION->'+DATE_OF_INCORPORATION);
        }
        /* if(headerlist.Salutation!=null){
SALUTATION=headerlist.Salutation;
SALUTATION=SALUTATION.replace('.','');
SALUTATION=SALUTATION.toUpperCase();
}*/
        if(headerlist.Product__c!=null){
            if(headerlist.Product__c=='Lead - VYAPAR (SECURED LOAN)'){
                PRODUCT='AMBIT_VYAPAR';
            } if(headerlist.Product__c=='Lead - UDYAM (UNSECURED LOAN)'){
                PRODUCT='AMBIT-Udyam';
            } if(headerlist.Product__c=='Lead - UCV'){
                PRODUCT='Used Commercial Vehicle';
            }
            if(headerlist.Product__c=='Lead - Rural Vyapar'){
                PRODUCT='Ambit-Rural Vyapar';
            }  
            if(headerlist.Product__c=='Lead - Rural Udyam'){
                PRODUCT='Ambit-Rural Udyam';
            }  
        } 
        if(headerlist.Email!=null){
            
            EMAIL_AVAILABLE='Y';
        }else{
            EMAIL_AVAILABLE='N';
        }
        
        if(headerlist.CIN_Number__c!=null){
            CIN=headerlist.CIN_Number__c;
        }else{
            CIN=''; 
        }
        if(headerlist.CIBIL_Score__c!=null){
            if(headerlist.CIBIL_Score__c!=0){
                integer cibilsc= integer.valueOf(headerlist.CIBIL_Score__c);
                cibilscore=string.valueOf(cibilsc);
                system.debug('cibilscore->'+cibilscore);   
            }
            else{
                cibilscore='000';
            }
            
        }
        
        if(headerlist.CIBIL_SCORE_DATE__c!=null){
            Date cb=headerlist.CIBIL_SCORE_DATE__c;
            Datetime dt1 =(Datetime)cb; 
            CIBIL_SCORE_DATE = dt1.format('dd-MMM-yyyy');
            system.debug('CIBIL_SCORE_DATE->'+CIBIL_SCORE_DATE);   
        }else
        {
            CIBIL_SCORE_DATE ='';
        }
        
        /*if(headerlist.FirstName!=null){
String s1 =headerlist.FirstName; 
String s2 = s1.escapeHtml4();
FirstName=s2;
}else{
FirstName='';
}
if(headerlist.MiddleName!=null){
String s1 =headerlist.MiddleName; 
String s2 = s1.escapeHtml4();
MiddleName=s2;
}else{
MiddleName='';
}
if(headerlist.LastName!=null){
String s1 =headerlist.LastName; 
String s2 = s1.escapeHtml4();
LastName=s2;
}else{
LastName='';
}  

if(headerlist.Name!=null){
String s1 =headerlist.Name; 
String s2 = s1.escapeHtml4();
Non_COMPANY_NAME=s2;
}
if(headerlist.Company_Name__c!=Null){
String s1 =headerlist.Company_Name__c; 
String s2 = s1.escapeHtml4();
Ind_COMPANY_NAME=s2;
}else{
Ind_COMPANY_NAME='';
}*/
        
        // loan creation request for Non Individual
        if(CUSTOMER_ENTITY_TYPE=='Non Individual'){
            // AUTHENTICATION details
            AUTHENTICATION= '{"AUTHENTICATION":';
            AUTHENTICATION+='{"TOKEN":"'+token+'",';
            AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
            AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
            LOAN_DETAILS = '"LOAN_DETAILS":';
            
            LOAN_DETAILS +='{"USERID":"'+headerlist.ASSIGNED_TO__c+'",';
            LOAN_DETAILS +='"APPLICATION_DATE":"'+APPLICATION_DATE+'",';
            LOAN_DETAILS +='"ASSIGNED_TO":"'+headerlist.ASSIGNED_TO__c+'",';
            LOAN_DETAILS +='"EXTERNAL_PROSPECT_CODE":"'+headerlist.Id+'",';
            LOAN_DETAILS +='"FORMNO":"'+headerlist.Id+'",';
            LOAN_DETAILS +='"TYPE_OF_LOAN":"'+headerlist.Nature_of_Loan__c+'",';
            LOAN_DETAILS +='"LOAN_TENOR":"'+headerlist.Tenure_In_Months__c+'",';
            LOAN_DETAILS +='"LOAN_AMOUNT":"'+headerlist.Loan_Amount__c+'",';
            LOAN_DETAILS +='"RELATIONSHIP_MGR":"'+headerlist.Relationship_Manager__r.Name+'",';
            LOAN_DETAILS +='"PURPOSE_SUB_SCHEME":"'+headerlist.Purpose__c+'",';
            LOAN_DETAILS +='"PROMO_SCHEME_CUSTOMER_TYPE":"",';
            LOAN_DETAILS +='"SOURCING_CHANNEL_TYPE":"Sales Team",';
            LOAN_DETAILS +='"SOURCING_CHANNEL":"'+headerlist.Sourcing_Channel_1__c+'",';
            LOAN_DETAILS +='"SOURCING_AGENT":"'+headerlist.SOURCING_AGENT_1__c+'",';
            if(headerlist.Channel_Type__c=='Direct Sourcing'){
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL_TYPE":"",';
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL":"",';
                LOAN_DETAILS +='"SEC_SOURCING_AGENT":"",';
            }else{
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL_TYPE":"'+headerlist.Agent__r.DSA_Connector__c+'",';
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL":"'+headerlist.Agent__r.Sec_Sourcing_Channel__c+'",';
                LOAN_DETAILS +='"SEC_SOURCING_AGENT":"'+headerlist.Agent__r.Sourcing_Channel_2__c+'",';
            }
            
            LOAN_DETAILS +='"BRANCH":"'+headerlist.Branch__r.Name+'",';
            LOAN_DETAILS +='"PRODUCT":"'+PRODUCT+'",';
            LOAN_DETAILS +='"SCHEME":"'+headerlist.Scheme__c+'",';
            if(headerlist.Document_Type__c=='Driving License'){
                LOAN_DETAILS +='"DRIVING_LICENCE_NO":"'+headerlist.Document_No__c+'",';
            }
            
            APPLICANT='"APPLICANT":[ {';
            if(headerlist.Parent_Applicant__c!=null){
                APPLICANT +='"IS_EXISTING":"Y",';
                APPLICANT +='"APPLICANT_CODE":"'+headerlist.Parent_Applicant__r.Applicant_Code__c+'",';
            }else{
                APPLICANT +='"IS_EXISTING":"N",';
            }
            
            
            APPLICANT +='"EXTERNAL_CUSTOMER_CODE":"'+headerlist.Id+'",';
            APPLICANT +='"APPLICANT_TYPE":"'+headerlist.Applicant_Type__c+'",';
            APPLICANT +='"CUSTOMER_ENTITY_TYPE":"NON-INDIVIDUAL",';
            
            if(headerlist.Salutation!=null){
                APPLICANT +='"SALUTATION":"'+headerlist.Salutation+'",'; 
            }else{
                APPLICANT +='"SALUTATION":"",';
            }
            
            if(headerlist.FirstName!=null){
                APPLICANT +='"FNAME":"'+headerlist.FirstName+'",'; 
            }else{
                APPLICANT +='"FNAME":"",'; 
            }
            if(headerlist.Middlename!=null){
                APPLICANT +='"MNAME":"'+headerlist.Middlename+'",';
            }else{
                APPLICANT +='"MNAME":"",';
            }
            if(headerlist.Lastname!=null){
                APPLICANT +='"LNAME":"'+headerlist.Lastname+'",';
            }else{
                APPLICANT +='"LNAME":"",'; 
            }
            APPLICANT +='"MARITAL_STATUS":"",';
            APPLICANT +='"CONSTITUTION":"'+headerlist.Constitution__c+'",';        
            APPLICANT +='"GENDER":"",'; 
            APPLICANT +='"FATHER_FNAME":"",';
            APPLICANT +='"FATHER_LNAME":"",';
            APPLICANT +='"SEGMENT":"'+headerlist.Segment__c+'",';
            APPLICANT +='"TYPE_OF_BUSINESS":"'+headerlist.Type_of_Business__c+'",';
            APPLICANT +='"CLUSTER":"'+headerlist.Cluster__c+'",';
            APPLICANT +='"EDUCATIONAL_QUALIFICATION":"",';
            APPLICANT +='"DATE_OF_INCORPORATION":"'+DATE_OF_INCORPORATION+'",';
            APPLICANT +='"COMPANY_NAME":"'+headerlist.Name+'",';
            APPLICANT +='"CUST_CATEGORY":"'+headerlist.Customer_Type__c+'",';
            APPLICANT +='"IS_PAN_AVAILABLE":"'+IS_PAN_AVAILABLE+'",';
            APPLICANT +='"PAN_NUMBER":"'+headerlist.Pan_Card__c+'",';
            APPLICANT +='"CIN":"'+CIN+'",';
            APPLICANT +='"FORM_60_NAME":"'+headerlist.Name+'Form60.doc",';
            
            AUTHORISED_SIGN='"AUTHORISED_SIGN":';
            AUTHORISED_SIGN +='[ {"FIRST_NAME":"",';
            if(headerlist.MiddleName!=null){
                AUTHORISED_SIGN +='"MIDDLE_NAME":"'+headerlist.MiddleName+'",'; 
            } 
            AUTHORISED_SIGN +='"LAST_NAME":"'+headerlist.Lastname+'",';
            AUTHORISED_SIGN +='"SIGN":"",';
            AUTHORISED_SIGN +='"DINNO":"",';
            AUTHORISED_SIGN +='"EMAIL":"'+headerlist.Email+'",';
            AUTHORISED_SIGN +='"CONTACTNO":"'+headerlist.MobilePhone+'",';
            AUTHORISED_SIGN +='"DELEGATION":""}],';
            
            ADDRESS_DETAILS='"ADDRESS_DETAILS":';
            ADDRESS_DETAILS +='[ {"ADDRESS_TYPE":"OFFICE ADDRESS",';
            if(headerlist.OFFICE_ADDRESS_ID__c!=null){
                ADDRESS_DETAILS +='"ADDRESSID":"'+headerlist.OFFICE_ADDRESS_ID__c+'",';
            }if(headerlist.OFFICE_ADDRESS_ID__c==null){
                ADDRESS_DETAILS +='"ADDRESSID":"",';
            }
            ADDRESS_DETAILS +='"ADDRESS1":"'+headerlist.Flat_House_Number_Office__c+'",';
            ADDRESS_DETAILS +='"ADDRESS2":"'+headerlist.Building_Street_Name_Office__c+'",';
            ADDRESS_DETAILS +='"ADDRESS3":"'+headerlist.Area_Office__c+'",';
            ADDRESS_DETAILS +='"EMAIL":"'+headerlist.Email+'",';
            ADDRESS_DETAILS +='"EMAIL_AVAILABLE":"'+EMAIL_AVAILABLE+'",';
            ADDRESS_DETAILS +='"DISTRICT":"'+headerlist.District_Office__c+'",';
            ADDRESS_DETAILS +='"STATE":"'+headerlist.State_Office__c+'",';
            ADDRESS_DETAILS +='"MOBILE1":"'+headerlist.MobilePhone+'",';
            ADDRESS_DETAILS +='"PINCODE":"'+headerlist.Pincode_Office__c+'",';
            if(headerlist.Phone!=null){
                ADDRESS_DETAILS +='"PHONE1":"'+headerlist.Phone+'",'; 
            }else{
                ADDRESS_DETAILS +='"PHONE1":"",'; 
            }
            
            ADDRESS_DETAILS +='"OCCUPANCY_STATUS":"'+headerlist.Occupancy_Status__c+'",';
            ADDRESS_DETAILS +='"YEAR_OF_STAY_CURRENT_AREA":"'+YEAR_OF_STAY_CURRENT_AREA+'",';
            ADDRESS_DETAILS +='"MONTHS_OF_STAY_CURRENT_AREA":"'+MONTHS_OF_STAY_CURRENT_AREA+'",';
            if(headerlist.GST_Applicable__c=='Y'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"'+headerlist.GST_Number__c+'",'; 
            }if(headerlist.GST_Applicable__c=='N'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                
            } 
            if(headerlist.Destination_Office_Address__c==true){
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"N",';
            }
            if(headerlist.Mailing_Office_Address__c==true){
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"N",';
            }
            
            ADDRESS_DETAILS +='"COMPANY_NAME":"'+headerlist.Name+'",';
            ADDRESS_DETAILS +='"CITY":"'+headerlist.City_Office__c+'"},';
            ADDRESS_DETAILS +='{"ADDRESS_TYPE":"PERMANENT ADDRESS",';
            if(headerlist.PERMANENT_ADDRESS_ID__c!=null){
                ADDRESS_DETAILS +='"ADDRESSID":"'+headerlist.PERMANENT_ADDRESS_ID__c+'",';
            }if(headerlist.PERMANENT_ADDRESS_ID__c==null){
                ADDRESS_DETAILS +='"ADDRESSID":"",';
            }
            
            ADDRESS_DETAILS +='"ADDRESS1":"'+headerlist.Flat_House_Number_Mailing__c+'",';
            ADDRESS_DETAILS +='"ADDRESS2":"'+headerlist.Building_Street_Name_Mailing__c+'",';
            ADDRESS_DETAILS +='"ADDRESS3":"'+headerlist.Area_Mailing__c+'",';
            ADDRESS_DETAILS +='"EMAIL_AVAILABLE":"'+EMAIL_AVAILABLE+'",';
            ADDRESS_DETAILS +='"EMAIL":"'+headerlist.Email+'",';
            ADDRESS_DETAILS +='"DISTRICT":"'+headerlist.District_Mailing__c+'",';
            ADDRESS_DETAILS +='"STATE":"'+headerlist.State_Mailing__c+'",';
            ADDRESS_DETAILS +='"MOBILE1":"'+headerlist.MobilePhone+'",';
            ADDRESS_DETAILS +='"PINCODE":"'+headerlist.Pincode_Mailing__c+'",';
            if(headerlist.Phone!=null){
                ADDRESS_DETAILS +='"PHONE1":"'+headerlist.Phone+'",'; 
            }else{
                ADDRESS_DETAILS +='"PHONE1":"",'; 
            }
            ADDRESS_DETAILS +='"OCCUPANCY_STATUS":"'+headerlist.Occupancy_Status__c+'",';
            ADDRESS_DETAILS +='"YEAR_OF_STAY_CURRENT_AREA":"'+YEAR_OF_STAY_CURRENT_AREA+'",';
            ADDRESS_DETAILS +='"MONTHS_OF_STAY_CURRENT_AREA":"'+MONTHS_OF_STAY_CURRENT_AREA+'",';
            if(headerlist.GST_Applicable__c=='Y'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"'+headerlist.GST_Number__c+'",'; 
            }if(headerlist.GST_Applicable__c=='N'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
            }
            if(headerlist.Destination_Permanent_Address__c==true){
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"N",';
            }
            if(headerlist.Mailing_Permanent_Address__c==true){
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"N",';
            }
            ADDRESS_DETAILS +='"COMPANY_NAME":"'+headerlist.Name+'",';
            ADDRESS_DETAILS +='"CITY":"'+headerlist.City_Mailing__c+'"}],';
            
            CIBIL='"CIBIL":';
            CIBIL+='[{"SCORE_DATE":"",';
            CIBIL+='"SCORE_CATEGORY":"",';
            CIBIL+='"SCORE":"",';
            CIBIL+='"SCORE_TYPE":"",';
            CIBIL+='"REMARKS":""}],';
            
            CRIF='"CRIF":';
            CRIF+='[{"SCORE_DATE":"",';
            CRIF+='"SCORE_CATEGORY":"",';
            CRIF+='"SCORE":"",';
            CRIF+='"SCORE_TYPE":"",';
            CRIF+='"REMARKS":""}],';
            
            EQUIFAX='"EQUIFAX":';
            EQUIFAX+='[{"SCORE_DATE":"",';
            EQUIFAX+='"SCORE_CATEGORY":"",';
            EQUIFAX+='"SCORE":"",';
            EQUIFAX+='"SCORE_TYPE":"",';
            EQUIFAX+='"REMARKS":""}],';
            
            
            EXPERIAN='"EXPERIAN":';
            EXPERIAN+='[{"SCORE_DATE":"",';
            EXPERIAN+='"SCORE_CATEGORY":"",';
            EXPERIAN+='"SCORE":"",';
            EXPERIAN+='"SCORE_TYPE":"",';
            EXPERIAN+='"REMARKS":""}]}';
            
            
            
            
            for(contact cograt:coapp_grant){
                //system.debug('pdmap coapplicant->'+pdmap);
                EXPERIAN+=','+Co_applicant_loan_creation.createcoapplicantloan(cograt);
            }
            Finaljson= AUTHENTICATION+LOAN_DETAILS+APPLICANT+AUTHORISED_SIGN+ADDRESS_DETAILS+CIBIL+CRIF+EQUIFAX+EXPERIAN+']}}';  
            
        }
        
        // loan creation request for Individual
        else if(CUSTOMER_ENTITY_TYPE=='Individual'){
            AUTHENTICATION= '{"AUTHENTICATION":';
            AUTHENTICATION+='{"TOKEN":"'+token+'",';
            AUTHENTICATION+='"UNIQUE_REQUEST_ID":"'+UNIQUE_REQUEST_ID+'",';
            AUTHENTICATION+='"DEVICE_ID":"SALES_FORCE"},';
            
            LOAN_DETAILS = '"LOAN_DETAILS":';   
            LOAN_DETAILS +='{"USERID":"'+headerlist.ASSIGNED_TO__c+'",';
            LOAN_DETAILS +='"APPLICATION_DATE":"'+APPLICATION_DATE+'",';
            LOAN_DETAILS +='"ASSIGNED_TO":"'+headerlist.ASSIGNED_TO__c+'",';
            LOAN_DETAILS +='"EXTERNAL_PROSPECT_CODE":"'+headerlist.Id+'",';
            LOAN_DETAILS +='"FORMNO":"'+headerlist.Id+'",';
            LOAN_DETAILS +='"LOAN_TENOR":"'+headerlist.Tenure_In_Months__c+'",';
            LOAN_DETAILS +='"RELATIONSHIP_MGR":"'+headerlist.Relationship_Manager__r.Name+'",';
            LOAN_DETAILS +='"TYPE_OF_LOAN":"'+headerlist.Nature_of_Loan__c+'",';
            LOAN_DETAILS +='"LOAN_AMOUNT":"'+headerlist.Loan_Amount__c+'",';
            LOAN_DETAILS +='"PURPOSE_SUB_SCHEME":"'+headerlist.Purpose__c+'",';
            LOAN_DETAILS +='"PROMO_SCHEME_CUSTOMER_TYPE":"",';
            LOAN_DETAILS +='"SOURCING_CHANNEL_TYPE":"Sales Team",';
            LOAN_DETAILS +='"SOURCING_CHANNEL":"'+headerlist.Sourcing_Channel_1__c+'",';
            LOAN_DETAILS +='"SOURCING_AGENT":"'+headerlist.SOURCING_AGENT_1__c+'",';
            if(headerlist.Channel_Type__c=='Direct Sourcing'){
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL_TYPE":"",';
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL":"",';
                LOAN_DETAILS +='"SEC_SOURCING_AGENT":"",';
            }else{
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL_TYPE":"'+headerlist.Agent__r.DSA_Connector__c+'",';
                LOAN_DETAILS +='"SEC_SOURCING_CHANNEL":"'+headerlist.Agent__r.Sec_Sourcing_Channel__c+'",';
                LOAN_DETAILS +='"SEC_SOURCING_AGENT":"'+headerlist.Agent__r.Sourcing_Channel_2__c+'",';
            }
            LOAN_DETAILS +='"BRANCH":"'+headerlist.Branch__r.Name+'",';
            LOAN_DETAILS +='"PRODUCT":"'+PRODUCT+'",';
            LOAN_DETAILS +='"SCHEME":"'+headerlist.Scheme__c+'",';
            if(headerlist.Document_Type__c=='Driving License'){
                LOAN_DETAILS +='"DRIVING_LICENCE_NO":"'+headerlist.Document_No__c+'",';
            } 
            
            
            APPLICANT='"APPLICANT":[{';
            if(headerlist.Parent_Applicant__c!=null){
                APPLICANT +='"IS_EXISTING":"Y",';
                APPLICANT +='"APPLICANT_CODE":"'+headerlist.Parent_Applicant__r.Applicant_Code__c+'",';
            }else{
                APPLICANT +='"IS_EXISTING":"N",';
            }
            APPLICANT +='"EXTERNAL_CUSTOMER_CODE":"'+headerlist.Id+'",';
            APPLICANT +='"APPLICANT_TYPE":"'+headerlist.Applicant_Type__c+'",';
            APPLICANT +='"CUSTOMER_ENTITY_TYPE":"INDIVIDUAL",';
            if(headerlist.Salutation!=null){
                APPLICANT +='"SALUTATION":"'+headerlist.Salutation+'",'; 
            }else{
                APPLICANT +='"SALUTATION":"",';
            }
            if(headerlist.FirstName!=null){
                APPLICANT +='"FNAME":"'+headerlist.FirstName+'",'; 
            }else{
                APPLICANT +='"FNAME":"",'; 
            }
            if(headerlist.Middlename!=null){
                APPLICANT +='"MNAME":"'+headerlist.Middlename+'",';
            }else{
                APPLICANT +='"MNAME":"",';
            }
            if(headerlist.Lastname!=null){
                APPLICANT +='"LNAME":"'+headerlist.Lastname+'",';
            }else{
                APPLICANT +='"LNAME":"",'; 
            }
            
            APPLICANT +='"MARITAL_STATUS":"'+headerlist.Marital_Status__c+'",';        
            APPLICANT +='"GENDER":"'+headerlist.Gender__c+'",'; 
            APPLICANT +='"DATEOFBIRTH":"'+DATEOFBIRTH+'",';
            APPLICANT +='"FATHER_FNAME":"'+FATHER_FNAME+'",';
            APPLICANT +='"FATHER_LNAME":"'+FATHER_LNAME+'",';
            APPLICANT +='"CONSTITUTION":"'+headerlist.Constitution__c+'",';   
            APPLICANT +='"SEGMENT":"'+headerlist.Segment__c+'",';
            APPLICANT +='"TYPE_OF_BUSINESS":"'+headerlist.Type_of_Business__c+'",';
            APPLICANT +='"CLUSTER":"'+headerlist.Cluster__c+'",';
            APPLICANT +='"EDUCATIONAL_QUALIFICATION":"'+headerlist.Education__c+'",';
            APPLICANT +='"COMPANY_NAME":"'+headerlist.Company_Name__c+'",';
            
            if(headerlist.Pan_Card__c!=null){
                APPLICANT +='"IS_PAN_AVAILABLE":"'+IS_PAN_AVAILABLE+'",';
                APPLICANT +='"PAN_NUMBER":"'+headerlist.Pan_Card__c+'",';
            }else{
                APPLICANT +='"IS_PAN_AVAILABLE":"'+IS_PAN_AVAILABLE+'",';
                APPLICANT +='"PAN_NUMBER":"",';
                if(headerlist.Document_Type__c=='Voter ID'){
                    APPLICANT +='"VOTER_ID":"'+headerlist.Document_No__c+'",';
                }if(headerlist.Document_Type__c=='Passport'){
                    APPLICANT +='"PASSPORTNO":"'+headerlist.Document_No__c+'",';
                }if(headerlist.Document_Type__c=='Aadhar as KYC'){
                    APPLICANT +='"ADHAAR_AS_KYC":"YES",';
                }
            }
            
            
            
            
            APPLICANT +='"FORM_60_NAME":"'+headerlist.Name+'Form60.doc",';
            AUTHORISED_SIGN='"AUTHORISED_SIGN":';
            AUTHORISED_SIGN +='[ {"FIRST_NAME":"'+headerlist.Firstname+'",';
            if(headerlist.MiddleName!=null){
                AUTHORISED_SIGN +='"MIDDLE_NAME":"'+headerlist.MiddleName+'",'; 
            } 
            AUTHORISED_SIGN +='"LAST_NAME":"'+headerlist.Lastname+'",';
            AUTHORISED_SIGN +='"SIGN":"",';
            AUTHORISED_SIGN +='"DINNO":"",';
            AUTHORISED_SIGN +='"EMAIL":"'+headerlist.Email+'",';
            AUTHORISED_SIGN +='"CONTACTNO":"'+headerlist.MobilePhone+'",';
            AUTHORISED_SIGN +='"DELEGATION":""}],';
            
            ADDRESS_DETAILS='"ADDRESS_DETAILS":';
            ADDRESS_DETAILS +='[ {"ADDRESS_TYPE":"OFFICE ADDRESS",';
            if(headerlist.OFFICE_ADDRESS_ID__c!=null){
                ADDRESS_DETAILS +='"ADDRESSID":"'+headerlist.OFFICE_ADDRESS_ID__c+'",';
            }if(headerlist.OFFICE_ADDRESS_ID__c==null){
                ADDRESS_DETAILS +='"ADDRESSID":"",';
            }
            
            ADDRESS_DETAILS +='"ADDRESS1":"'+headerlist.Flat_House_Number_Office__c+'",';
            ADDRESS_DETAILS +='"ADDRESS2":"'+headerlist.Building_Street_Name_Office__c+'",';
            ADDRESS_DETAILS +='"ADDRESS3":"'+headerlist.Area_Office__c+'",';
            ADDRESS_DETAILS +='"EMAIL_AVAILABLE":"'+EMAIL_AVAILABLE+'",';
            ADDRESS_DETAILS +='"EMAIL":"'+headerlist.Email+'",';
            ADDRESS_DETAILS +='"DISTRICT":"'+headerlist.District_Office__c+'",';
            ADDRESS_DETAILS +='"STATE":"'+headerlist.State_Office__c+'",';
            ADDRESS_DETAILS +='"MOBILE1":"'+headerlist.MobilePhone+'",';
            ADDRESS_DETAILS +='"PINCODE":"'+headerlist.Pincode_Office__c+'",';
            if(headerlist.Phone!=null){
                ADDRESS_DETAILS +='"PHONE1":"'+headerlist.Phone+'",';
            }else{
                ADDRESS_DETAILS +='"PHONE1":"",';
            }
            
            ADDRESS_DETAILS +='"OCCUPANCY_STATUS":"'+headerlist.Occupancy_Status__c+'",';
            ADDRESS_DETAILS +='"YEAR_OF_STAY_CURRENT_AREA":"'+YEAR_OF_STAY_CURRENT_AREA+'",';
            ADDRESS_DETAILS +='"MONTHS_OF_STAY_CURRENT_AREA":"'+MONTHS_OF_STAY_CURRENT_AREA+'",';
            if(headerlist.GST_Applicable__c=='Y'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"'+headerlist.GST_Number__c+'",'; 
            }if(headerlist.GST_Applicable__c=='N'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"",';
            } 
            if(headerlist.Destination_Office_Address__c==true){
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"N",';
            }
            if(headerlist.Mailing_Office_Address__c==true){
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"N",';
            }
            
            ADDRESS_DETAILS +='"COMPANY_NAME":"'+headerlist.Company_Name__c+'",';
            ADDRESS_DETAILS +='"CITY":"'+headerlist.City_Office__c+'"},';
            ADDRESS_DETAILS +='{"ADDRESS_TYPE":"RESIDENCE ADDRESS",';
            if(headerlist.RESIDENCE_ADDRESS_ID__c!=null){
                ADDRESS_DETAILS +='"ADDRESSID":"'+headerlist.RESIDENCE_ADDRESS_ID__c+'",';
            }if(headerlist.RESIDENCE_ADDRESS_ID__c==null){
                ADDRESS_DETAILS +='"ADDRESSID":"",';
            }
            ADDRESS_DETAILS +='"ADDRESS1":"'+headerlist.Flat_House_Number_Destination__c+'",';
            ADDRESS_DETAILS +='"ADDRESS2":"'+headerlist.Building_Street_Name_Destination__c+'",';
            ADDRESS_DETAILS +='"ADDRESS3":"'+headerlist.Area_Destination__c+'",';
            ADDRESS_DETAILS +='"EMAIL_AVAILABLE":"'+EMAIL_AVAILABLE+'",';
            ADDRESS_DETAILS +='"EMAIL":"'+headerlist.Email+'",';
            ADDRESS_DETAILS +='"DISTRICT":"'+headerlist.District_Destination__c+'",';
            ADDRESS_DETAILS +='"STATE":"'+headerlist.State_Destination__c+'",';
            ADDRESS_DETAILS +='"MOBILE1":"'+headerlist.MobilePhone+'",';
            ADDRESS_DETAILS +='"PINCODE":"'+headerlist.Pincode_Destination__c+'",';
            if(headerlist.Phone!=null){
                ADDRESS_DETAILS +='"PHONE1":"'+headerlist.Phone+'",';
            }else{
                ADDRESS_DETAILS +='"PHONE1":"",';
            }
            ADDRESS_DETAILS +='"OCCUPANCY_STATUS":"'+headerlist.Occupancy_Status__c+'",';
            ADDRESS_DETAILS +='"YEAR_OF_STAY_CURRENT_AREA":"'+YEAR_OF_STAY_CURRENT_AREA+'",';
            ADDRESS_DETAILS +='"MONTHS_OF_STAY_CURRENT_AREA":"'+MONTHS_OF_STAY_CURRENT_AREA+'",';
            if(headerlist.GST_Applicable__c=='Y'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"'+headerlist.GST_Number__c+'",'; 
            }if(headerlist.GST_Applicable__c=='N'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"",';
            } 
            if(headerlist.Destination_Current_Address__c==true){
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"N",';
            }
            if(headerlist.Mailing_Current_Address__c==true){
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"N",';
            }
            ADDRESS_DETAILS +='"COMPANY_NAME":"'+headerlist.Company_Name__c+'",';
            ADDRESS_DETAILS +='"CITY":"'+headerlist.City_Destination__c+'"},';
            ADDRESS_DETAILS +='{"ADDRESS_TYPE":"PERMANENT ADDRESS",';
            if(headerlist.PERMANENT_ADDRESS_ID__c!=null){
                ADDRESS_DETAILS +='"ADDRESSID":"'+headerlist.PERMANENT_ADDRESS_ID__c+'",';
            }if(headerlist.PERMANENT_ADDRESS_ID__c==null){
                ADDRESS_DETAILS +='"ADDRESSID":"",';
            }
            
            ADDRESS_DETAILS +='"ADDRESS1":"'+headerlist.Flat_House_Number_Mailing__c+'",';
            ADDRESS_DETAILS +='"ADDRESS2":"'+headerlist.Building_Street_Name_Mailing__c+'",';
            ADDRESS_DETAILS +='"ADDRESS3":"'+headerlist.Area_Mailing__c+'",';
            ADDRESS_DETAILS +='"EMAIL_AVAILABLE":"'+EMAIL_AVAILABLE+'",';
            ADDRESS_DETAILS +='"EMAIL":"'+headerlist.Email+'",';
            ADDRESS_DETAILS +='"DISTRICT":"'+headerlist.District_Mailing__c+'",';
            ADDRESS_DETAILS +='"STATE":"'+headerlist.State_Mailing__c+'",';
            ADDRESS_DETAILS +='"MOBILE1":"'+headerlist.MobilePhone+'",';
            ADDRESS_DETAILS +='"PINCODE":"'+headerlist.Pincode_Mailing__c+'",';
            if(headerlist.Phone!=null){
                ADDRESS_DETAILS +='"PHONE1":"'+headerlist.Phone+'",';
            }else{
                ADDRESS_DETAILS +='"PHONE1":"",';
            }
            ADDRESS_DETAILS +='"OCCUPANCY_STATUS":"'+headerlist.Occupancy_Status__c+'",';
            ADDRESS_DETAILS +='"YEAR_OF_STAY_CURRENT_AREA":"'+YEAR_OF_STAY_CURRENT_AREA+'",';
            ADDRESS_DETAILS +='"MONTHS_OF_STAY_CURRENT_AREA":"'+MONTHS_OF_STAY_CURRENT_AREA+'",';
            if(headerlist.GST_Applicable__c=='Y'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"'+headerlist.GST_Number__c+'",'; 
            }if(headerlist.GST_Applicable__c=='N'){
                ADDRESS_DETAILS +='"GST_APPLICABLE":"'+headerlist.GST_Applicable__c+'",';
                ADDRESS_DETAILS +='"GSTIN_NO":"",';
            } 
            
            if(headerlist.Destination_Permanent_Address__c==true){
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"DESTINATION_ADDRESS":"N",';
            }
            if(headerlist.Mailing_Permanent_Address__c==true){
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"Y",';
            }else{
                ADDRESS_DETAILS +='"MAILING_ADDRESS":"N",';
            }
            ADDRESS_DETAILS +='"COMPANY_NAME":"'+headerlist.Company_Name__c+'",';
            ADDRESS_DETAILS +='"CITY":"'+headerlist.City_Mailing__c+'"}],';
            
            CIBIL='"CIBIL":';
            CIBIL+='[{"SCORE_DATE":"'+CIBIL_SCORE_DATE+'",';
            CIBIL+='"SCORE_CATEGORY":"Y",';
            CIBIL+='"SCORE":"'+cibilscore+'",';
            CIBIL+='"SCORE_TYPE":"Y",';
            CIBIL+='"REMARKS":"Y"}],';
            
            CRIF='"CRIF":';
            CRIF+='[{"SCORE_DATE":"",';
            CRIF+='"SCORE_CATEGORY":"",';
            CRIF+='"SCORE":"",';
            CRIF+='"SCORE_TYPE":"",';
            CRIF+='"REMARKS":""}],';
            
            EQUIFAX='"EQUIFAX":';
            EQUIFAX+='[{"SCORE_DATE":"",';
            EQUIFAX+='"SCORE_CATEGORY":"",';
            EQUIFAX+='"SCORE":"",';
            EQUIFAX+='"SCORE_TYPE":"",';
            EQUIFAX+='"REMARKS":""}],';
            
            
            EXPERIAN='"EXPERIAN":';
            EXPERIAN+='[{"SCORE_DATE":"",';
            EXPERIAN+='"SCORE_CATEGORY":"",';
            EXPERIAN+='"SCORE":"",';
            EXPERIAN+='"SCORE_TYPE":"",';
            EXPERIAN+='"REMARKS":""}]}';
            
            for(contact cograt:coapp_grant){
                //system.debug('pd details-'+pdmaps.get(cograt.Id));
                EXPERIAN+=','+Co_applicant_loan_creation.createcoapplicantloan(cograt);
            }
            
            Finaljson= AUTHENTICATION+LOAN_DETAILS+APPLICANT+AUTHORISED_SIGN+ADDRESS_DETAILS+CIBIL+CRIF+EQUIFAX+EXPERIAN+']}}';          
            
        }
        system.debug('Finaljson=>'+Finaljson);
        return Finaljson;
        
    }
    
    // Http request for AUTHENTICATION and passing the token value.
     @AuraEnabled
    global  static string AUTHENTICATION(){
        
        string STATUS;
        string MESSAGE;
        string url='';
        string Auttoken;
        list<LOAN_AUTHENTICATION__mdt> LoanAuth=[select APP_NAME__c,APP_PASS__c,DEVICE_ID__c,USER_ID__c,Authentication__c,Loan_creation__c,Document__c from LOAN_AUTHENTICATION__mdt Limit 1];
        
        string AUTHENTICATION= '{"AUTHENTICATION":';
        String tempJson ='';
        tempJson+='{"APP_NAME":"'+LoanAuth[0].APP_NAME__c+'",';
        tempJson+='"APP_PASS":"'+LoanAuth[0].APP_PASS__c+'",';
        tempJson+='"DEVICE_ID":"'+LoanAuth[0].DEVICE_ID__c+'",';
        tempJson+='"USER_ID":"'+LoanAuth[0].USER_ID__c+'"}}';
        url=LoanAuth[0].Authentication__c;
        
        AUTHENTICATION=AUTHENTICATION+tempJson;
        system.debug('AUTHENTICATION->'+AUTHENTICATION);
        HttpRequest req = new HttpRequest();
        req.setHeader('Accept', '*/*');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setbody(AUTHENTICATION);
        Http http = new Http();
        HTTPResponse response = http.send(req); 
        String responseBody = response.getBody();
        system.debug('responseBody->'+responseBody);
        String jsonResult = responseBody;
        System.debug('jsonResult '+jsonResult);
        JSONParser parser = JSON.createParser(jsonResult);
        // Parsing of string
        while(parser.nextToken()!= null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if(parser.getCurrentName() =='STATUS') {
                    STATUS = parser.getText();
                }  if (parser.getCurrentName() =='MESSAGE') {
                    MESSAGE = parser.getText();
                }
                if (parser.getCurrentName() =='TOKEN') {
                    Auttoken = parser.getText();
                    break;
                }
            }
        }
        system.debug('Auttoken->'+Auttoken);
        if(MESSAGE=='SUCCESS'){
            return Auttoken;
            
        }else{
            return null;
        }
        
    }
    
    // calling the Http request for loan creation.
     @AuraEnabled
    global  static string loanrequest(string finaljson ,string Division){
        list<LOAN_AUTHENTICATION__mdt> LoanAuth=new list<LOAN_AUTHENTICATION__mdt>();
        String endpoint; 
     
        if(Division=='SME'){
            LoanAuth=[select APP_NAME__c,APP_PASS__c,DEVICE_ID__c,USER_ID__c,Authentication__c,Loan_creation__c,Loan_Creation_UCV__c,Document__c from LOAN_AUTHENTICATION__mdt Limit 1];
            endpoint=LoanAuth[0].Loan_creation__c;
        }
        if(Division=='UCV'){
            LoanAuth=[select APP_NAME__c,APP_PASS__c,DEVICE_ID__c,USER_ID__c,Authentication__c,Loan_creation__c,Loan_Creation_UCV__c,Document__c from LOAN_AUTHENTICATION__mdt Limit 1];
            endpoint=LoanAuth[0].Loan_Creation_UCV__c;
        }
        
        HttpRequest req = new HttpRequest();
        req.setHeader('Accept', '*/*');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setbody(finaljson);
        Http http = new Http();
        HTTPResponse response = http.send(req); 
        string responsebody = response.getBody();
        system.debug('loanresponse->'+responsebody);
        return responsebody;
    }
   
    //getting the co-applicant and granture value in map.

    global  static set<id> getcoapplicant(contact coapp){
        set<id> co_aap_id= new set<id>();
        for(integer i=1;i<=15;i++){
            system.debug('coapp->'+coapp.get('Co_Applicant_'+i+'__c'));
            if(coapp.get('Co_Applicant_'+i+'__c')!=null)
                co_aap_id.add(string.valueof(coapp.get('Co_Applicant_'+i+'__c')));
        }
        for(integer i=1;i<=5;i++){
            system.debug('coapp->'+coapp.get('Guarantor_'+i+'__c'));
            if(coapp.get('Guarantor_'+i+'__c')!=null)
                co_aap_id.add(string.valueof(coapp.get('Guarantor_'+i+'__c')));
        }
        return co_aap_id; 
    }
    
    //updating the applicant, co-applicant and loan details.
     @AuraEnabled
    global  static void updateloandetails(string ProspectCode,string ProspectId,map<string,string> Applicantcodemap,map<string,string>Co_gr_appcodemap,map<string,string>Applicantmap,map<string,string>Co_gr_appmap, map<string,list<Loan_Creation_response.ADDRESS_DETAIL>> app_addressmap,map<string,list<Loan_Creation_response.ADDRESS_DETAIL>> coapp_addressmap){
        Map<id,contact> Applicant_Map = new Map<id,contact>();
        Map<id,contact> co_grand_Map = new Map<id,contact>();
        Map<id,Loan_Account__c> loan_Map = new Map<id,Loan_Account__c>();
        string loanappcode;
        string PERMANENT;
        string RESIDENCE;
        string OFFICE;
        system.debug('Applicantmap'+Applicantmap);
        system.debug('Applicantcodemap'+Applicantcodemap);
        system.debug('Co_gr_appcodemap'+Co_gr_appcodemap);
        system.debug('Co_gr_appmap'+Co_gr_appmap);
        if(Applicantmap!=null){
            for(string name:Applicantmap.keyset()){
                contact updateapp = new contact();
                updateapp.Prospect_Code__c=ProspectCode;
                updateapp.Prospect_Id__c=ProspectId;
                if(Applicantcodemap.containskey(name)){
                    updateapp.Applicant_Code__c=Applicantcodemap.get(name);
                    loanappcode=Applicantcodemap.get(name);
                }
                
                if(app_addressmap.containskey(name)){
                    for(Loan_Creation_response.ADDRESS_DETAIL app_adds :app_addressmap.get(name)){
                        if(app_adds.ADDRESSTYPE=='PERMANENT ADDRESS'){
                            PERMANENT=string.valueOf(app_adds.ADDRESSID);
                        }
                        if(app_adds.ADDRESSTYPE=='RESIDENCE ADDRESS'){
                            RESIDENCE=string.valueOf(app_adds.ADDRESSID);
                        }
                        if(app_adds.ADDRESSTYPE=='OFFICE ADDRESS'){
                            OFFICE=string.valueOf(app_adds.ADDRESSID);
                        }
                        
                    }
                }
                updateapp.PERMANENT_ADDRESS_ID__c=PERMANENT;
                updateapp.RESIDENCE_ADDRESS_ID__c=RESIDENCE;
                updateapp.OFFICE_ADDRESS_ID__c=OFFICE;
                updateapp.Id=Applicantmap.get(name);
                Applicant_Map.put(updateapp.id, updateapp);
            }
            
        }
        system.debug('Applicant_Map'+Applicant_Map);
        if(Co_gr_appmap!=null){
            for(string name:Co_gr_appmap.keyset()){
                contact updatecoapp = new contact();
                if(Co_gr_appmap.containskey(name)){
                    updatecoapp.Applicant_Code__c=Co_gr_appcodemap.get(name); 
                }
                if(coapp_addressmap.containskey(name)){
                    for(Loan_Creation_response.ADDRESS_DETAIL app_adds :coapp_addressmap.get(name)){
                        if(app_adds.ADDRESSTYPE=='PERMANENT ADDRESS'){
                            PERMANENT=string.valueOf(app_adds.ADDRESSID);
                        }
                        if(app_adds.ADDRESSTYPE=='RESIDENCE ADDRESS'){
                            RESIDENCE=string.valueOf(app_adds.ADDRESSID);
                        }
                        if(app_adds.ADDRESSTYPE=='OFFICE ADDRESS'){
                            OFFICE=string.valueOf(app_adds.ADDRESSID);
                        }
                        
                    }
                }
                updatecoapp.PERMANENT_ADDRESS_ID__c=PERMANENT;
                updatecoapp.RESIDENCE_ADDRESS_ID__c=RESIDENCE;
                updatecoapp.OFFICE_ADDRESS_ID__c=OFFICE;
                updatecoapp.Id=Co_gr_appmap.get(name);
                updatecoapp.Prospect_Code__c=ProspectCode;
                updatecoapp.Prospect_Id__c=ProspectId;
                co_grand_Map.put(updatecoapp.id, updatecoapp);
            }
            
        }
        system.debug('co_grand_Map'+co_grand_Map);
        
        system.debug('loan_Map'+loan_Map);
        
        if(Applicant_Map != null && Applicant_Map.size()>0){
            try{
                update Applicant_Map.values();
                
            }
            catch(dmlException ex){
                system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
            }
        }
        if(co_grand_Map != null && co_grand_Map.size()>0){
            try{
                update co_grand_Map.values();
                
            }
            catch(dmlException ex){
                system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
            }
        }
        
        
        
    }
    //updating custom setting value.
     @AuraEnabled
    global  static void updateloanAPISetting(string unqiueid, string form_no){
        list<Loan_API__c> Loanunqno=[select UNIQUE_REQUEST_ID__c,FORMNO__c from Loan_API__c ]; 
        list<Loan_API__c> Loanunqupdate= new list<Loan_API__c>();
        
        for(Loan_API__c ls:Loanunqno){
            ls.UNIQUE_REQUEST_ID__c=decimal.valueOf(unqiueid)+1;
            ls.FORMNO__c=decimal.valueOf(form_no)+1;
            Loanunqupdate.add(ls);
            
        }
        system.debug('Loanunqupdate->'+Loanunqupdate);
        update Loanunqupdate;
        
    }
        
}