public class Co_applicant_loan_creation {
    
    public static string createcoapplicantloan(contact con){
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
        String MONTHS_OF_STAY_CURRENT_AREA;
        String DATEOFBIRTH;
        String YEAR_OF_STAY_CURRENT_AREA;
        string SALUTATION;
        string PRODUCT;
        string CIBIL_SCORE_DATE;
        string cibilscore;
        String EMAIL_AVAILABLE;
        String CIN;
        string APPLICANT_TYPE;   
        string NONINDIVIDUAL='NON-INDIVIDUAL';
        string INDIVIDUAL='INDIVIDUAL';
        string DATE_OF_INCORPORATION;
        string FirstName;
        string MiddleName;
        string LastName;
        string Non_COMPANY_NAME;
        string Ind_COMPANY_NAME;
            createloanjsonhelper.APPLICANT CoApplicant=new createloanjsonhelper.APPLICANT();
            createloanjsonhelper.AUTHORISED_SIGN sign=new createloanjsonhelper.AUTHORISED_SIGN();
            createloanjsonhelper.ADDRESS_DETAILS Adds_Offdetails=new createloanjsonhelper.ADDRESS_DETAILS();
            createloanjsonhelper.ADDRESS_DETAILS Adds_Resdetails=new createloanjsonhelper.ADDRESS_DETAILS();
            createloanjsonhelper.ADDRESS_DETAILS Adds_Perdetails=new createloanjsonhelper.ADDRESS_DETAILS();
            createloanjsonhelper.CIBIL cibil=new createloanjsonhelper.CIBIL();
            createloanjsonhelper.EQUIFAX EQUIFAX=new createloanjsonhelper.EQUIFAX();
            createloanjsonhelper.CRIF CRIF=new createloanjsonhelper.CRIF();
            createloanjsonhelper.EXPERIAN EXPERIAN=new createloanjsonhelper.EXPERIAN();
       list<createloanjsonhelper.AUTHORISED_SIGN> sign1=new  list<createloanjsonhelper.AUTHORISED_SIGN>();
       list<createloanjsonhelper.ADDRESS_DETAILS> Adds_detail=new list<createloanjsonhelper.ADDRESS_DETAILS>();
       list<createloanjsonhelper.CIBIL>Cibil_detail=new list<createloanjsonhelper.CIBIL>();
       list<createloanjsonhelper.EQUIFAX>EQUIFAX_detail=new list<createloanjsonhelper.EQUIFAX>();
       list<createloanjsonhelper.CRIF>CRIF_detail=new list<createloanjsonhelper.CRIF>();
       list<createloanjsonhelper.EXPERIAN>EXPERIAN_detail=new list<createloanjsonhelper.EXPERIAN>();
       
        if(con.Created_date__c!=null){
            Date cr=con.Created_date__c;
            Datetime dt1 =(Datetime)cr; 
            APPLICATION_DATE = dt1.format('dd-MMM-yyyy');
            system.debug('APPLICATION_DATE->'+APPLICATION_DATE);
        }
        if(con.RecordTypeId!=null){
            String recordTypeDevName=con.RecordTypeId; 
            CUSTOMER_ENTITY_TYPE= Schema.getGlobalDescribe().get('contact').getDescribe().getRecordTypeInfosById().get(recordTypeDevName).getName();
            CUSTOMER_ENTITY_TYPE=CUSTOMER_ENTITY_TYPE.toUpperCase();
            system.debug('CUSTOMER_ENTITY_TYPE->'+CUSTOMER_ENTITY_TYPE);
        }
        if(con.Applicant_Father_Name__c!=null){
            
            string fullname=con.Applicant_Father_Name__c;
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
        if(con.Pan_Card__c!=null){
            
            IS_PAN_AVAILABLE='Y';
        }else{
            IS_PAN_AVAILABLE='N';
        }
        
        
        if(con.Time_at_Current_Address__c!=null){
            Decimal months=con.Time_at_Current_Address__c;
            integer Monthstay= integer.valueOf(months);
            MONTHS_OF_STAY_CURRENT_AREA= string.valueOf(Monthstay);
            system.debug('MONTHS_OF_STAY_CURRENT_AREA->'+MONTHS_OF_STAY_CURRENT_AREA);        }
        
        if(con.Time_At_Address_In_Years__c!=null){
            integer yearstay= integer.valueOf(con.Time_At_Address_In_Years__c);
            YEAR_OF_STAY_CURRENT_AREA=string.valueOf(yearstay);
            system.debug('YEAR_OF_STAY_CURRENT_AREA->'+YEAR_OF_STAY_CURRENT_AREA);
        }
        if(con.Birthdate!=null){
             Date cr=con.Birthdate;
            Datetime dt1 =(Datetime)cr; 
            DATEOFBIRTH = dt1.format('dd-MMM-yyyy');
            system.debug('DATEOFBIRTH->'+DATEOFBIRTH);
            
        }
        if(con.Date_of_Incorporation__c!=null){
             Date cr=con.Date_of_Incorporation__c;
            Datetime dt1 =(Datetime)cr; 
            DATE_OF_INCORPORATION = dt1.format('dd-MMM-yyyy');
            system.debug('DATE_OF_INCORPORATION->'+DATE_OF_INCORPORATION);
        }
        /*if(con.Salutation!=null){
            SALUTATION=con.Salutation;
            SALUTATION=SALUTATION.replace('.','');
            SALUTATION=SALUTATION.toUpperCase();
        }*/
         if(con.Product__c!=null){
            if(con.Product__c=='Lead - VYAPAR (SECURED LOAN)'){
                PRODUCT='AMBIT_VYAPAR';
            } if(con.Product__c=='Lead - UDYAM (UNSECURED LOAN)'){
                PRODUCT='AMBIT-Udyam';
            } if(con.Product__c=='Lead - UCV'){
                PRODUCT='Used Commercial Vehicle';
            }
            if(con.Product__c=='Lead - Rural Vyapar'){
                PRODUCT='Ambit-Rural Vyapar';
            }  
            if(con.Product__c=='Lead - Rural Udyam'){
                PRODUCT='Ambit-Rural Udyam';
            }  
        }
        if(con.Email!=null){
             EMAIL_AVAILABLE='Y';
        }else{
              EMAIL_AVAILABLE='N';
        }
        
        if(con.CIBIL_Score__c!=null){
            if(con.CIBIL_Score__c!=0){
                integer cibilsc= integer.valueOf(con.CIBIL_Score__c);
            cibilscore=string.valueOf(cibilsc);
            system.debug('cibilscore->'+cibilscore);   
            }
            else{
                cibilscore='-001';
            }
            
        }
        
        if(con.CIBIL_SCORE_DATE__c!=null){
             Date cb=con.CIBIL_SCORE_DATE__c;
            Datetime dt1 =(Datetime)cb; 
            CIBIL_SCORE_DATE = dt1.format('dd-MMM-yyyy');
            system.debug('CIBIL_SCORE_DATE->'+CIBIL_SCORE_DATE);   
        }else
        {
             CIBIL_SCORE_DATE ='';
        }
        
        if(con.CIN_Number__c!=null){
            CIN=con.CIN_Number__c;
        }else{
            CIN='';
        }
      
                
             if(CUSTOMER_ENTITY_TYPE=='Non Individual'){
        CoApplicant.IS_EXISTING='N';
         if(con.Applicant_Code__c!=null){
           CoApplicant.APPLICANT_CODE=con.Applicant_Code__c;  
         }else{
             CoApplicant.APPLICANT_CODE='';
         }
        
        CoApplicant.EXTERNAL_CUSTOMER_CODE=con.Id;
        CoApplicant.APPLICANT_TYPE=con.Applicant_Type__c;
        CoApplicant.CUSTOMER_ENTITY_TYPE=NONINDIVIDUAL;
        CoApplicant.ALIAS='';
                 if(con.Salutation!=null){
                   CoApplicant.SALUTATION=con.Salutation;  
                 }else{
                     CoApplicant.SALUTATION='';
                 }
        
                 if(con.FirstName!=null){
                     CoApplicant.FNAME=con.FirstName; 
                 }else{
                     CoApplicant.FNAME=''; 
                 }
                  if(con.Middlename!=null){
                     CoApplicant.MNAME=con.Middlename; 
                 }else{
                     CoApplicant.MNAME=''; 
                 } 
                  if(con.Lastname!=null){
                     CoApplicant.LNAME=con.Lastname; 
                 }else{
                     CoApplicant.LNAME='';
                 } 
           

        CoApplicant.MARITAL_STATUS='';
        CoApplicant.CONSTITUTION=con.Constitution__c;
        CoApplicant.DATEOFBIRTH='';
        CoApplicant.GENDER='';
        CoApplicant.DEPENDENTS='';
        CoApplicant.NO_OF_DEPENDENTS='';
        CoApplicant.FATHER_FNAME='';
        CoApplicant.FATHER_MNAME='';
        CoApplicant.FATHER_LNAME='';
        CoApplicant.SPOUSE_FNAME='';
        CoApplicant.SPOUSE_MNAME='';
        CoApplicant.SPOUSE_LNAME='';
        CoApplicant.ADHAAR_AS_KYC='';
        CoApplicant.SEGMENT=con.Segment__c;
        CoApplicant.TYPE_OF_BUSINESS=con.Type_of_Business__c;
        CoApplicant.CLUSTER=con.Cluster__c;
        CoApplicant.CLUSTER_DESCRIPTION='';
        CoApplicant.CKYC_ID='';
        CoApplicant.CUSTOMER_CREDIT_INFO='';
        CoApplicant.EDUCATIONAL_QUALIFICATION='';  
        CoApplicant.RELIGION='';
        CoApplicant.PSL='';
        CoApplicant.SOCIAL_CATEGORY='';
        CoApplicant.PREF_TIME_TO_CALL='';
        CoApplicant.PREF_COMMUNICATION_MODE='';
        CoApplicant.RELATION='';
        CoApplicant.NAME_AS_PER_AADHAR='';
        CoApplicant.DNS_REQUIRED='';
        CoApplicant.DNS_REASON='';
        CoApplicant.COMPANY_NAME=con.Name;  
        CoApplicant.CUST_CATEGORY=con.Customer_Type__c;
        CoApplicant.DATE_OF_INCORPORATION=DATE_OF_INCORPORATION;
        CoApplicant.REGISTRATION_NO='';
        CoApplicant.KEY_CONTACT_PERSON='';
        CoApplicant.AUTHORIZED_CAPITAL='';
        CoApplicant.TINNO='';
        CoApplicant.CIN=CIN;
        CoApplicant.GROUP_NAME='';
        CoApplicant.VOTER_ID='';
        CoApplicant.PASSPORTNO='';
        CoApplicant.OTHER_NAME='';
        CoApplicant.OTHERS_ID_NUMBER='';
        CoApplicant.IS_PAN_AVAILABLE=IS_PAN_AVAILABLE;
                 if(con.Pan_Card__c!=null){
                    CoApplicant.PAN_NUMBER=con.Pan_Card__c; 
                 }else{
                    CoApplicant.PAN_NUMBER=''; 
                 }
        
        CoApplicant.FORM_60_NAME='';
        CoApplicant.P_FORM60='';
        CoApplicant.UDYAM_REG_NO='';
        //creating AUTHORISED_SIGN
        sign.FIRST_NAME='';
        sign.MIDDLE_NAME='';
        sign.LAST_NAME='';
        sign.SIGN='';
        sign.DINNO='';
        sign.EMAIL='';
        sign.CONTACTNO='';
        sign.DELEGATION='';
        
        //creating Address details
        
        Adds_Offdetails.ADDRESS_TYPE='OFFICE ADDRESS';
                  if(con.OFFICE_ADDRESS_ID__c!=null){
                 Adds_Offdetails.ADDRESSID=con.OFFICE_ADDRESS_ID__c;
            }if(con.OFFICE_ADDRESS_ID__c==null){
                 Adds_Offdetails.ADDRESSID='';
            }
        Adds_Offdetails.ADDRESS1=con.Flat_House_Number_Office__c;
        Adds_Offdetails.ADDRESS2=con.Building_Street_Name_Office__c;
        Adds_Offdetails.ADDRESS3=con.Area_Office__c;
        Adds_Offdetails.LANDMARK='';
        Adds_Offdetails.EMAIL=con.Email;
        Adds_Offdetails.EMAIL_AVAILABLE=EMAIL_AVAILABLE;
        Adds_Offdetails.DISTRICT=con.District_Office__c;
        Adds_Offdetails.STATE=con.State_Office__c;
        Adds_Offdetails.MOBILE1=con.MobilePhone;
        Adds_Offdetails.PINCODE=con.Pincode_Office__c;
        Adds_Offdetails.MOBILE2='';
        if(con.Phone!=null){
                     Adds_Offdetails.PHONE1=con.Phone; 
                 }else{
                      Adds_Offdetails.PHONE1='';
                 }
        Adds_Offdetails.PHONE2='';
        Adds_Offdetails.FAX='';
        Adds_Offdetails.EXTENSION='';
        Adds_Offdetails.OCCUPANCY_STATUS=con.Occupancy_Status__c;
        Adds_Offdetails.YEAR_OF_STAY_CURRENT_AREA=YEAR_OF_STAY_CURRENT_AREA;
        Adds_Offdetails.MONTHS_OF_STAY_CURRENT_AREA=MONTHS_OF_STAY_CURRENT_AREA;
         if(con.GST_Applicable__c=='Y'){
               Adds_Offdetails.GST_APPLICABLE=con.GST_Applicable__c;
               Adds_Offdetails.GSTIN_NO=con.GST_Number__c;   
                }if(con.GST_Applicable__c=='N'){
                   Adds_Offdetails.GST_APPLICABLE=con.GST_Applicable__c;
                     Adds_Offdetails.GSTIN_NO=''; 
              }
                  if(con.Destination_Office_Address__c==true){
                Adds_Offdetails.DESTINATION_ADDRESS='Y';
            }else{
                 Adds_Offdetails.DESTINATION_ADDRESS='N';
            }
            if(con.Mailing_Office_Address__c==true){
                Adds_Offdetails.MAILING_ADDRESS='Y';
            }else{
                 Adds_Offdetails.MAILING_ADDRESS='N';
            }
             
            Adds_Offdetails.COMPANY_NAME=con.Name;           
            Adds_Offdetails.CITY=con.City_Office__c;
        
        Adds_Perdetails.ADDRESS_TYPE='PERMANENT ADDRESS';
                  if(con.PERMANENT_ADDRESS_ID__c!=null){
                 Adds_Perdetails.ADDRESSID=con.PERMANENT_ADDRESS_ID__c;
            }if(con.PERMANENT_ADDRESS_ID__c==null){
                 Adds_Perdetails.ADDRESSID='';
            }
        
        Adds_Perdetails.ADDRESS1=con.Flat_House_Number_Mailing__c;
        Adds_Perdetails.ADDRESS2=con.Building_Street_Name_Mailing__c;
        Adds_Perdetails.ADDRESS3=con.Area_Mailing__c;
        Adds_Perdetails.LANDMARK='';
        Adds_Perdetails.EMAIL=con.Email;
        Adds_Perdetails.EMAIL_AVAILABLE=EMAIL_AVAILABLE;
        Adds_Perdetails.DISTRICT=con.District_Mailing__c;
        Adds_Perdetails.STATE=con.State_Mailing__c;
        Adds_Perdetails.MOBILE1=con.MobilePhone;
        Adds_Perdetails.PINCODE=con.Pincode_Mailing__c;
        Adds_Perdetails.MOBILE2='';
                 if(con.Phone!=null){
                     Adds_Perdetails.PHONE1=con.Phone; 
                 }else{
                      Adds_Perdetails.PHONE1='';
                 }
       
        Adds_Perdetails.PHONE2='';
        Adds_Perdetails.FAX='';
        Adds_Perdetails.EXTENSION='';
        Adds_Perdetails.OCCUPANCY_STATUS=con.Occupancy_Status__c;
        Adds_Perdetails.YEAR_OF_STAY_CURRENT_AREA=YEAR_OF_STAY_CURRENT_AREA;
        Adds_Perdetails.MONTHS_OF_STAY_CURRENT_AREA=MONTHS_OF_STAY_CURRENT_AREA;
         if(con.GST_Applicable__c=='Y'){
               Adds_Perdetails.GST_APPLICABLE=con.GST_Applicable__c;
               Adds_Perdetails.GSTIN_NO=con.GST_Number__c;   
                }if(con.GST_Applicable__c=='N'){
                   Adds_Perdetails.GST_APPLICABLE=con.GST_Applicable__c;
                    Adds_Perdetails.GSTIN_NO='';
                   
              }
         if(con.Destination_Permanent_Address__c==true){
                Adds_Perdetails.DESTINATION_ADDRESS='Y';
            }
            else{
                 Adds_Perdetails.DESTINATION_ADDRESS='N';
            }
        if(con.Mailing_Permanent_Address__c==true){
                Adds_Perdetails.MAILING_ADDRESS='Y';
            }
            else{
                 Adds_Perdetails.MAILING_ADDRESS='N';
            }
        Adds_Perdetails.COMPANY_NAME=con.Name;  
        Adds_Perdetails.CITY=con.City_Mailing__c;
                 
                 //creating cibil
            
                 cibil.SCORE_DATE='';
                 cibil.SCORE_CATEGORY='';
                 cibil.SCORE='';
                 cibil.SCORE_TYPE='';
                 cibil.REMARKS='';
                 
                 
                  // Creating CRIF
                 CRIF.SCORE_DATE='';
                 CRIF.SCORE_CATEGORY='';
                 CRIF.SCORE='';
                 CRIF.SCORE_TYPE='';
                 CRIF.REMARKS='';
                 
                // Creating EXPERIAN
                EXPERIAN.SCORE_DATE='';
                 EXPERIAN.SCORE_CATEGORY='';
                 EXPERIAN.SCORE='';
                 EXPERIAN.SCORE_TYPE='';
                 EXPERIAN.REMARKS='';
               
                 // Creating EQUIFAX
                 EQUIFAX.SCORE_DATE='';
                 EQUIFAX.SCORE_CATEGORY='';
                 EQUIFAX.SCORE='';
                 EQUIFAX.SCORE_TYPE='';
                 EQUIFAX.REMARKS='';             
             }
        
             if(CUSTOMER_ENTITY_TYPE=='Individual'){
        
         if(con.Applicant_Code__c!=null){
             CoApplicant.IS_EXISTING='Y';
           CoApplicant.APPLICANT_CODE=con.Applicant_Code__c;  
         }else{
             CoApplicant.APPLICANT_CODE='';
             CoApplicant.IS_EXISTING='N';
         }
        CoApplicant.EXTERNAL_CUSTOMER_CODE=con.Id;
        CoApplicant.APPLICANT_TYPE=con.Applicant_Type__c;
        CoApplicant.CUSTOMER_ENTITY_TYPE=INDIVIDUAL;
        CoApplicant.ALIAS='';
                  if(con.Salutation!=null){
                   CoApplicant.SALUTATION=con.Salutation;  
                 }else{
                     CoApplicant.SALUTATION='';
                 }
                if(con.FirstName!=null){
                     CoApplicant.FNAME=con.FirstName; 
                 }else{
                     CoApplicant.FNAME=''; 
                 }
                  if(con.Middlename!=null){
                     CoApplicant.MNAME=con.Middlename; 
                 }else{
                     CoApplicant.MNAME=''; 
                 } 
                  if(con.Lastname!=null){
                     CoApplicant.LNAME=con.Lastname; 
                 }else{
                     CoApplicant.LNAME='';
                 } 
           
        CoApplicant.MARITAL_STATUS=con.Marital_Status__c;
        CoApplicant.DATEOFBIRTH=DATEOFBIRTH;
        CoApplicant.GENDER=con.Gender__c;
        CoApplicant.DEPENDENTS='';
        CoApplicant.NO_OF_DEPENDENTS='';
        CoApplicant.FATHER_FNAME=FATHER_FNAME;
        CoApplicant.FATHER_MNAME='';
        CoApplicant.FATHER_LNAME=FATHER_LNAME;
        CoApplicant.SPOUSE_FNAME='';
        CoApplicant.SPOUSE_MNAME='';
        CoApplicant.SPOUSE_LNAME='';
      
        CoApplicant.SEGMENT=con.Segment__c;
        CoApplicant.TYPE_OF_BUSINESS=con.Type_of_Business__c;
        CoApplicant.CLUSTER=con.Cluster__c;
        CoApplicant.CLUSTER_DESCRIPTION='';
        CoApplicant.CKYC_ID='';
        CoApplicant.CUSTOMER_CREDIT_INFO='';
        CoApplicant.EDUCATIONAL_QUALIFICATION=con.Education__c;
        CoApplicant.RELIGION='';
        CoApplicant.PSL='';
        CoApplicant.SOCIAL_CATEGORY='';
        CoApplicant.PREF_TIME_TO_CALL='';
        CoApplicant.PREF_COMMUNICATION_MODE='';
        CoApplicant.RELATION='';
        CoApplicant.NAME_AS_PER_AADHAR='';
        CoApplicant.DNS_REQUIRED='';
        CoApplicant.DNS_REASON='';
        CoApplicant.COMPANY_NAME=con.Company_Name__c;
        CoApplicant.CUST_CATEGORY=con.Customer_Type__c;
        CoApplicant.DATE_OF_INCORPORATION='';
        CoApplicant.REGISTRATION_NO='';
        CoApplicant.KEY_CONTACT_PERSON='';
        CoApplicant.AUTHORIZED_CAPITAL='';
        CoApplicant.TINNO='';
        CoApplicant.CIN='';
        CoApplicant.GROUP_NAME='';
        CoApplicant.OTHER_NAME='';
        CoApplicant.OTHERS_ID_NUMBER='';
        CoApplicant.IS_PAN_AVAILABLE=IS_PAN_AVAILABLE;
                   if(con.Pan_Card__c!=null){
                    CoApplicant.PAN_NUMBER=con.Pan_Card__c;
                        CoApplicant.VOTER_ID='';
                        CoApplicant.PASSPORTNO='';
                        CoApplicant.ADHAAR_AS_KYC='';
                 }else{
                    CoApplicant.PAN_NUMBER='';
                     if(con.Document_Type__c=='Voter ID'){
                         CoApplicant.VOTER_ID=con.Document_No__c;
                     }else{
                          CoApplicant.VOTER_ID='';
                     }
                     if(con.Document_Type__c=='Passport'){
                         CoApplicant.PASSPORTNO=con.Document_No__c; 
                     }else{
                          CoApplicant.PASSPORTNO='';
                     }
                     if(con.Document_Type__c=='Aadhar as KYC'){
                          CoApplicant.ADHAAR_AS_KYC='YES'; 
                     }else{
                            CoApplicant.ADHAAR_AS_KYC='';
                     }
                 }
        
        CoApplicant.FORM_60_NAME='';
        CoApplicant.P_FORM60='';
        CoApplicant.UDYAM_REG_NO='';
        CoApplicant.CONSTITUTION=con.Constitution__c;
               
        //creating AUTHORISED_SIGN
        sign.FIRST_NAME=con.Firstname;
                  if(con.Middlename!=null){
                  sign.MIDDLE_NAME=con.Middlename;   
                 }else {
                      sign.MIDDLE_NAME='';
                 }
        sign.MIDDLE_NAME='';
        sign.LAST_NAME=con.LastName;
        sign.SIGN='';
        sign.DINNO='';
        sign.EMAIL=con.Email;
        sign.CONTACTNO='';
        sign.DELEGATION='';
        
        //creating Address details
         
        Adds_Offdetails.ADDRESS_TYPE='OFFICE ADDRESS';
              if(con.OFFICE_ADDRESS_ID__c!=null){
                 Adds_Offdetails.ADDRESSID=con.OFFICE_ADDRESS_ID__c;
            }if(con.OFFICE_ADDRESS_ID__c==null){
                 Adds_Offdetails.ADDRESSID='';
            }
        Adds_Offdetails.ADDRESS1=con.Flat_House_Number_Office__c;
        Adds_Offdetails.ADDRESS2=con.Building_Street_Name_Office__c;
        Adds_Offdetails.ADDRESS3=con.Area_Office__c;
        Adds_Offdetails.LANDMARK='';
        Adds_Offdetails.EMAIL=con.Email;
        Adds_Offdetails.EMAIL_AVAILABLE=EMAIL_AVAILABLE;
        Adds_Offdetails.DISTRICT=con.District_Office__c;
        Adds_Offdetails.STATE=con.State_Office__c;
        Adds_Offdetails.MOBILE1=con.MobilePhone;
        Adds_Offdetails.PINCODE=con.Pincode_Office__c;
        Adds_Offdetails.MOBILE2='';
                 if(con.Phone!=null){
                  Adds_Offdetails.PHONE1=con.Phone;   
                 }else{
                     Adds_Offdetails.PHONE1='';
                 }
        
        Adds_Offdetails.PHONE2='';
        Adds_Offdetails.FAX='';
        Adds_Offdetails.EXTENSION='';
        Adds_Offdetails.OCCUPANCY_STATUS=con.Occupancy_Status__c;
        Adds_Offdetails.YEAR_OF_STAY_CURRENT_AREA=YEAR_OF_STAY_CURRENT_AREA;
        Adds_Offdetails.MONTHS_OF_STAY_CURRENT_AREA=MONTHS_OF_STAY_CURRENT_AREA;
             if(con.GST_Applicable__c=='Y'){
               Adds_Offdetails.GST_APPLICABLE=con.GST_Applicable__c;
               Adds_Offdetails.GSTIN_NO=con.GST_Number__c;   
                }if(con.GST_Applicable__c=='N'){
                   Adds_Offdetails.GST_APPLICABLE=con.GST_Applicable__c;
                    Adds_Offdetails.GSTIN_NO='';  
              }
             if(con.Destination_Office_Address__c==true){
                Adds_Offdetails.DESTINATION_ADDRESS='Y';
            }else{
                Adds_Offdetails.DESTINATION_ADDRESS='N';
            }
            if(con.Mailing_Office_Address__c==true){
               Adds_Offdetails.MAILING_ADDRESS='Y';
            }else{
                Adds_Offdetails.MAILING_ADDRESS='N';
            }
        
        Adds_Offdetails.COMPANY_NAME=con.Company_Name__c;
        Adds_Offdetails.CITY=con.City_Office__c;
        
        Adds_Resdetails.ADDRESS_TYPE='RESIDENCE ADDRESS';
             if(con.RESIDENCE_ADDRESS_ID__c!=null){
                 Adds_Resdetails.ADDRESSID=con.RESIDENCE_ADDRESS_ID__c;
            }if(con.RESIDENCE_ADDRESS_ID__c==null){
                 Adds_Resdetails.ADDRESSID='';
            }
        
        Adds_Resdetails.ADDRESS1=con.Flat_House_Number_Destination__c;
        Adds_Resdetails.ADDRESS2=con.Building_Street_Name_Destination__c;
        Adds_Resdetails.ADDRESS3=con.Area_Destination__c;
        Adds_Resdetails.LANDMARK='';
        Adds_Resdetails.EMAIL=con.Email;
        Adds_Resdetails.EMAIL_AVAILABLE=EMAIL_AVAILABLE;
        Adds_Resdetails.DISTRICT=con.District_Destination__c;
        Adds_Resdetails.STATE=con.State_Destination__c;
        Adds_Resdetails.MOBILE1=con.MobilePhone;
        Adds_Resdetails.PINCODE=con.Pincode_Destination__c;
        Adds_Resdetails.MOBILE2='';
                 if(con.Phone!=null){
                  Adds_Resdetails.PHONE1=con.Phone;   
                 }else{
                     Adds_Resdetails.PHONE1='';
                 }
        
        Adds_Resdetails.PHONE2='';
        Adds_Resdetails.FAX='';
        Adds_Resdetails.EXTENSION='';
        Adds_Resdetails.OCCUPANCY_STATUS=con.Occupancy_Status__c;
        Adds_Resdetails.YEAR_OF_STAY_CURRENT_AREA=YEAR_OF_STAY_CURRENT_AREA;
        Adds_Resdetails.MONTHS_OF_STAY_CURRENT_AREA=MONTHS_OF_STAY_CURRENT_AREA;
         if(con.GST_Applicable__c=='Y'){
               Adds_Resdetails.GST_APPLICABLE=con.GST_Applicable__c;
               Adds_Resdetails.GSTIN_NO=con.GST_Number__c;   
                }if(con.GST_Applicable__c=='N'){
                   Adds_Resdetails.GST_APPLICABLE=con.GST_Applicable__c;
                    Adds_Resdetails.GSTIN_NO='';  
              }
              if(con.Destination_Current_Address__c==true){
                Adds_Resdetails.DESTINATION_ADDRESS='Y';
            }else{
                Adds_Resdetails.DESTINATION_ADDRESS='N';
            }
            if(con.Mailing_Current_Address__c==true){
               Adds_Resdetails.MAILING_ADDRESS='Y';
            }else{
                Adds_Resdetails.MAILING_ADDRESS='N';
            }
        
        Adds_Resdetails.COMPANY_NAME=con.Company_Name__c;
        Adds_Resdetails.CITY=con.City_Destination__c;
               
        Adds_Perdetails.ADDRESS_TYPE='PERMANENT ADDRESS';
              if(con.PERMANENT_ADDRESS_ID__c!=null){
                 Adds_Perdetails.ADDRESSID=con.PERMANENT_ADDRESS_ID__c;
            }if(con.PERMANENT_ADDRESS_ID__c==null){
                 Adds_Perdetails.ADDRESSID='';
            }
        
        Adds_Perdetails.ADDRESS1=con.Flat_House_Number_Mailing__c;
        Adds_Perdetails.ADDRESS2=con.Building_Street_Name_Mailing__c;
        Adds_Perdetails.ADDRESS3=con.Area_Mailing__c;
        Adds_Perdetails.LANDMARK='';
        Adds_Perdetails.EMAIL=con.Email;
        Adds_Perdetails.EMAIL_AVAILABLE=EMAIL_AVAILABLE;
        Adds_Perdetails.DISTRICT=con.District_Mailing__c;
        Adds_Perdetails.STATE=con.State_Mailing__c;
        Adds_Perdetails.MOBILE1=con.MobilePhone;
        Adds_Perdetails.PINCODE=con.Pincode_Mailing__c;
        Adds_Perdetails.MOBILE2='';
         if(con.Phone!=null){
                  Adds_Perdetails.PHONE1=con.Phone;   
                 }else{
                     Adds_Perdetails.PHONE1='';
                 }
        Adds_Perdetails.PHONE2='';
        Adds_Perdetails.FAX='';
        Adds_Perdetails.EXTENSION='';
        Adds_Perdetails.OCCUPANCY_STATUS=con.Occupancy_Status__c;
        Adds_Perdetails.YEAR_OF_STAY_CURRENT_AREA=YEAR_OF_STAY_CURRENT_AREA;
        Adds_Perdetails.MONTHS_OF_STAY_CURRENT_AREA=MONTHS_OF_STAY_CURRENT_AREA;
         if(con.GST_Applicable__c=='Y'){
               Adds_Perdetails.GST_APPLICABLE=con.GST_Applicable__c;
               Adds_Perdetails.GSTIN_NO=con.GST_Number__c;   
                }if(con.GST_Applicable__c=='N'){
                   Adds_Perdetails.GST_APPLICABLE=con.GST_Applicable__c;
                    Adds_Perdetails.GSTIN_NO=''; 
              }
                if(con.Destination_Permanent_Address__c==true){
                Adds_Perdetails.DESTINATION_ADDRESS='Y';
            }else{
                Adds_Perdetails.DESTINATION_ADDRESS='N';
            }
            if(con.Mailing_Permanent_Address__c==true){
               Adds_Perdetails.MAILING_ADDRESS='Y';
            }else{
                Adds_Perdetails.MAILING_ADDRESS='N';
            }
       
        Adds_Perdetails.COMPANY_NAME=con.Company_Name__c;
        Adds_Perdetails.CITY=con.City_Mailing__c;
          
              //creating cibil
              
                 cibil.SCORE_DATE=CIBIL_SCORE_DATE;
                 cibil.SCORE_CATEGORY='Y';
                 cibil.SCORE=cibilscore;
                 cibil.SCORE_TYPE='Y';
                 cibil.REMARKS='Y';
                    
                 
                  // Creating CRIF
                 CRIF.SCORE_DATE='';
                 CRIF.SCORE_CATEGORY='';
                 CRIF.SCORE='';
                 CRIF.SCORE_TYPE='';
                 CRIF.REMARKS='';
                 
                // Creating EXPERIAN
                EXPERIAN.SCORE_DATE='';
                 EXPERIAN.SCORE_CATEGORY='';
                 EXPERIAN.SCORE='';
                 EXPERIAN.SCORE_TYPE='';
                 EXPERIAN.REMARKS='';
               
                 // Creating EQUIFAX
                 EQUIFAX.SCORE_DATE='';
                 EQUIFAX.SCORE_CATEGORY='';
                 EQUIFAX.SCORE='';
                 EQUIFAX.SCORE_TYPE='';
                 EQUIFAX.REMARKS=''; 
        
        } 

  system.debug('off address->>'+Adds_Offdetails);
system.debug('res address->'+Adds_Resdetails);
system.debug('res address ADDRESS_TYPE->'+Adds_Resdetails.ADDRESS_TYPE);
system.debug('per address->'+Adds_Perdetails);  
         
         createloanjsonhelper Cl=new  createloanjsonhelper();
        sign1.add(sign);
        if(Adds_Offdetails!=null){
            Adds_detail.add(Adds_Offdetails);
        }if(Adds_Resdetails.ADDRESS_TYPE!=null){
            Adds_detail.add(Adds_Resdetails);
        }if(Adds_Perdetails!=null){
            Adds_detail.add(Adds_Perdetails);
        }
        Cibil_detail.add(cibil);
        EQUIFAX_detail.add(EQUIFAX);
        CRIF_detail.add(CRIF);
        EXPERIAN_detail.add(EXPERIAN);
        
        Cl.APPLICANT=CoApplicant;
        Cl.APPLICANT.AUTHORISED_SIGN=sign1;
        Cl.APPLICANT.ADDRESS_DETAILS=Adds_detail;
        cl.APPLICANT.CIBIL=Cibil_detail;
        cl.APPLICANT.EQUIFAX=EQUIFAX_detail;
        cl.APPLICANT.CRIF=CRIF_detail;
        cl.APPLICANT.EXPERIAN=EXPERIAN_detail;
         return System.JSON.serialize(Cl.APPLICANT);
        
    }
    

}