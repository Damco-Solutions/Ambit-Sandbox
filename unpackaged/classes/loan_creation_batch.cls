global class  loan_creation_batch implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts {
    set<id>conid= new set<id>();
    global loan_creation_batch(set<id> appid){
        conid=appid;
    }
    list< Batch_Log__c> objbatchdetail = new list<Batch_Log__c>();
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        return Database.getQueryLocator([SELECT id,Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Address_Type__c,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                                         State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                                         RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Created_date__c,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                                         Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                                         Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                                         Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Applicant_Code__c,FORMNO__c,OFFICE_ADDRESS_ID__c,PERMANENT_ADDRESS_ID__c,RESIDENCE_ADDRESS_ID__c,Pan_Card__c,
                                         Flat_House_Number_Office__c,Building_Street_Name_Office__c,Area_Office__c,District_Office__c,City_Office__c,State_Office__c,Pincode_Office__c,GST_Applicable__c,GST_Number__c,Segment__c,Cluster__c,Type_of_Business__c,
                                         Time_at_Current_Address__c,Mailing_Current_Address__c,Mailing_Permanent_Address__c,Mailing_Office_Address__c,Destination_Permanent_Address__c,Destination_Office_Address__c,Destination_Current_Address__c,Pan_Card_Form_60__c,Document_No__c,Document_Type__c,
                                         Sourcing_Channel_1__c,SOURCING_AGENT_1__c,Channel__c,Agent__r.Sec_Sourcing_Channel__c,Agent__r.DSA_Connector__c,Agent__r.Agent_Code__pc,Agent__r.Sourcing_Channel_2__c,CIBIL_SCORE_DATE__c,Date_of_Incorporation__c,CIN_Number__c,Company_Name_NON_ind__c FROM Contact WHERE id=:conid]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope) {
        if(scope != null && scope.size()>0){
            system.debug('scope->'+scope);
            Map<id,List<Contact>> applicantList_Map = new Map<id,List<Contact>>();
            for(Contact con:scope){
                if(applicantList_Map.get(con.id)==null){
                    applicantList_Map.put(con.id,new List<Contact>{con});
                }else{
                    applicantList_Map.get(con.id).add(con);
                }            
            }
            system.debug('applicantList_Map->'+applicantList_Map);
          // Loan_Creation.Error_Success_Details objbatchstatus= new Loan_Creation.Error_Success_Details();
            if(applicantList_Map!=null && !applicantList_Map.isEmpty()){
                
               
                
                  
               
                
            }
        }
    }
        global void finish(Database.BatchableContext BC) {
        }
    }