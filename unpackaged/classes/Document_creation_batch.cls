global class Document_creation_batch implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts { 
    set<id>conid= new set<id>();
    global Document_creation_batch(set<id> docappid){
        conid=docappid;
    }
    
    string token;
    string PROSPECTCODE='';
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        return Database.getQueryLocator([SELECT id,Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Address_Type__c,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                                         State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                                         RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Created_date__c,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                                         Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                                         Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                                         Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Applicant_Code__c,FORMNO__c,Prospect_Code__c,Prospect_Id__c FROM Contact WHERE id=:conid]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope) {
        if(scope != null && scope.size()>0){
            system.debug('scope->'+scope);
            string DOCUMENT_NAME='';
            string APPLICANT_TYPE='';
            string TARGET_DATE='';
            string REMARKS='';
            string OSV='';
            string APPLICANTCODE='';
            string EXPIRY_DATE='';
            string DOCUMENT_STATUS='';
            string DOCUMENT_ID='';
            string DOCUMENT_TYPE='';
            string DOCUMENT_COPY='';
            string RECEIVED_DATE='';
            string DOCUMENT_DESC='';
            string FLAG='';
            string FILE_EXTN='';
            string OBJECTTYPE='';
            string P_FORM60='';
            
            Map<id,List<Contact>> applicantList_Map = new Map<id,List<Contact>>();
            map<id,string>Applicanttypemap= new map<id,string>();
            map<id,string>Co_gr_apptypemap= new map<id,string>();
            map<id,string>Applicantcodemap= new map<id,string>();
            map<id,string>Co_gr_appcodemap= new map<id,string>();
            map<id,string>Prospectcodemap= new map<id,string>();
            list<contact> con_app= new list<contact>();
            set<id>co_gran_appid= new set<id>();
            for(Contact con:scope){
                co_gran_appid=Loan_Creation.getcoapplicant(con);
                if(applicantList_Map.get(con.id)==null){
                    applicantList_Map.put(con.id,new List<Contact>{con});
                    Applicanttypemap.put(con.Id,con.Applicant_Type__c);
                    Applicantcodemap.put(con.Id,con.Applicant_Code__c);
                    Prospectcodemap.put(con.id,con.Prospect_Id__c);
                }else{
                    applicantList_Map.get(con.id).add(con);
                }            
            }
            system.debug('applicantList_Map->'+applicantList_Map);
            system.debug('co_gran_appid->'+co_gran_appid);
            // Loan_Creation.Error_Success_Details objbatchstatus= new Loan_Creation.Error_Success_Details();
            if(applicantList_Map!=null && !applicantList_Map.isEmpty()){
                
                for(id AppId:applicantList_Map.keyset()){
                    token=Loan_Creation.AUTHENTICATION();
                    
                    if(Applicanttypemap.containsKey(AppId)){
                        APPLICANT_TYPE=Applicanttypemap.get(AppId);
                        system.debug('APPLICANT_TYPE->'+APPLICANT_TYPE);
                    }
                    if(Applicantcodemap.containsKey(AppId)){
                        APPLICANTCODE=Applicantcodemap.get(AppId);
                        system.debug('APPLICANTCODE->'+APPLICANTCODE);
                    }
                    if(Prospectcodemap.containsKey(AppId)){
                        PROSPECTCODE=Applicantcodemap.get(AppId);
                        system.debug('PROSPECTCODE->'+PROSPECTCODE);
                    }
                    CreateDocumentAPIHelper.SendDocuments(AppId,token,PROSPECTCODE,DOCUMENT_NAME,APPLICANT_TYPE,TARGET_DATE,REMARKS,OSV,APPLICANTCODE,EXPIRY_DATE,DOCUMENT_STATUS,DOCUMENT_ID,DOCUMENT_TYPE,DOCUMENT_COPY,RECEIVED_DATE,FLAG,DOCUMENT_DESC,FILE_EXTN,OBJECTTYPE,P_FORM60);
                }
                if(co_gran_appid!=null){
                   system.debug('checking co-applicant->'+co_gran_appid);
                    for(id co_app_gr_id :co_gran_appid){
                        con_app = [SELECT id,Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Address_Type__c,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                                   State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename,Branch__r.Name,Scheme__c,Nature_of_Loan__c,Branch_Manager__r.name,Purpose__c,Promo_Scheme__c,Channel_Type__c,Sourcing_Channel__c,Agent__r.Name,Applicant_Type__c,
                                   RecordTypeId,Salutation,Marital_Status__c,Business_Type__c,Education__c,OwnerId,owner.Name,Tenure_In_Months__c,Company_Name__c,Occupancy_Status__c,Time_At_Address_In_Years__c,Email,Phone,Created_date__c,Applicant_Father_Name__c,Constitution__c,Flat_House_Number_Mailing__c,
                                   Building_Street_Name_Mailing__c,Area_Mailing__c,District_Mailing__c,City_Mailing__c,State_Mailing__c,Pincode_Mailing__c,Division__c,Customer_Type__c,Co_Applicant_1__c,Co_Applicant_2__c,Co_Applicant_3__c,Co_Applicant_4__c,
                                   Co_Applicant_5__c,Co_Applicant_6__c,Co_Applicant_7__c,Co_Applicant_8__c,Co_Applicant_9__c,Co_Applicant_10__c,Co_Applicant_11__c,Co_Applicant_12__c,Co_Applicant_13__c,Co_Applicant_14__c,Co_Applicant_15__c,
                                   Guarantor_1__c,Guarantor_2__c,Guarantor_3__c,Guarantor_4__c,Guarantor_5__c,Parent_Applicant__c,Applicant_Code__c,FORMNO__c,Prospect_Code__c,Prospect_Id__c FROM Contact WHERE id=:co_app_gr_id];
                        
                    }
                    if(!con_app.isEmpty() && con_app!=null ){
                        for(contact co_gr :con_app){
                            APPLICANT_TYPE=co_gr.Applicant_Type__c;
                            APPLICANTCODE=co_gr.Applicant_Code__c;
                            
                            CreateDocumentAPIHelper.SendDocuments(co_gr.Id,token,PROSPECTCODE,DOCUMENT_NAME,APPLICANT_TYPE,TARGET_DATE,REMARKS,OSV,APPLICANTCODE,EXPIRY_DATE,DOCUMENT_STATUS,DOCUMENT_ID,DOCUMENT_TYPE,DOCUMENT_COPY,RECEIVED_DATE,FLAG,DOCUMENT_DESC,FILE_EXTN,OBJECTTYPE,P_FORM60);
                        }
                        
                    }
                }
                
            }
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
}