public class Validation_on_Co_Applicant {
    
    public static void validationcheckonCo_Applicant(List<contact> newcontact){
        string recordtypeid1 =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        string recordtypeid2 =Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Non Individual').getRecordTypeId();
        
        for(contact con:newcontact){
            
            if((con.Applicant_Type__c=='CO-APPLICANT' || con.Applicant_Type__c=='GUARANTOR') && (con.RecordTypeId==Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Non Individual').getRecordTypeId()) && con.Status__c=='CIBIL Updated'){
                
                
                if(con.Company_Type__c==null){
                    
                    con.addError('Please Enter the Company Type');
                    
                }
                if(con.Constitution__c==null){
                    
                    con.addError('Please Enter the Constitution');
                    
                }
                if(con.Date_of_Incorporation__c==null){
                    
                    con.addError('Please Enter the Date of Incorporation');
                    
                }
                if(con.No_of_Years_in_Business__c==null){
                    
                    con.addError('Please Enter the No of Years in Business');
                    
                }
                if(con.GST_Applicable__c==null){
                    
                    con.addError('Please Enter the GST Applicable');
                    
                }
                if(con.Segment__c==null){
                    
                    con.addError('Please Enter the Segment');
                    
                }
                if(con.Type_of_Business__c==null){
                    
                    con.addError('Please Enter the Type of Business');
                    
                }
                if(con.Cluster__c==null){
                    
                    con.addError('Please Enter the Cluster');
                    
                }
                if(con.Customer_Type__c==null){
                    
                    con.addError('Please Enter the Customer Type');
                    
                }
                if(con.Relationship_with_Applicant__c==null){
                    
                    con.addError('Please Enter the Relationship with Applicant');
                    
                }
                if(con.Time_At_Address_In_Years__c==null){
                    
                    con.addError('Please Enter the Time At Address In Years ');
                    
                }
                if(con.Nature_of_Loan__c==null){
                    
                    con.addError('Please Enter the Nature of Loan ');
                    
                }
                if(con.Occupancy_Status__c==null){
                    
                    con.addError('Please Enter the Occupancy Status');
                    
                }
                if(con.Email==null){
                    
                    con.addError('Please Enter the Email');
                    
                }
                if(con.Stage__c==null){
                    
                    con.addError('Please Enter the Stage');
                    
                }
                if(con.Authorised_Person__c==null){
                    
                    con.addError('Please Enter the Authorised Person');
                    
                }
                if(con.Flat_House_Number_Office__c==null){
                    
                    con.addError('Please Enter the Office Flat House Number');
                    
                }
                if(con.Building_Street_Name_Office__c==null){
                    
                    con.addError('Please Enter the Office Building Street Name');
                    
                }
                if(con.Area_Office__c==null){
                    
                    con.addError('Please Enter the Office Area');
                    
                }
                if(con.District_Office__c==null){
                    
                    con.addError('Please Enter the Office District');
                    
                }
                
                if(con.Pincode_Office__c==null){
                    
                    con.addError('Please Enter the Office Pincode');
                    
                }
                if(con.Same_As_Current_Address__c!=true){
                    
                    if(con.Flat_House_Number_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Flat House Number');
                        
                    }
                    if(con.Building_Street_Name_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Building Street Name');
                        
                    }
                    if(con.Area_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Area');
                        
                    }
                    if(con.District_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT District');
                        
                    }
                    
                    if(con.Pincode_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Pincode');
                        
                    }
                    
                }
                
                if(con.Status__c=='Prospect'){
                    
                    con.addError('CO-APPLICANT/GUARANTOR Status Should be CIBIL Updated ');
                    
                }
            }
            
            if((con.Applicant_Type__c=='CO-APPLICANT' || con.Applicant_Type__c=='GUARANTOR') && (con.RecordTypeId==Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId()) && con.Status__c=='CIBIL Updated'){
                
                
                
                if(con.Birthdate==null){
                    
                    con.addError('Please Enter the Birthdate');
                    
                }
                if(con.Gender__c==null){
                    
                    con.addError('Please Enter the Gender');
                    
                }
                if(con.Education__c==null){
                    
                    con.addError('Please Enter the Education');
                    
                }
                if(con.Marital_Status__c==null){
                    
                    con.addError('Please Enter the Marital Status');
                    
                }
                if(con.GST_Applicable__c==null){
                    
                    con.addError('Please Enter the GST Applicable');
                    
                }
                if(con.Segment__c==null){
                    
                    con.addError('Please Enter the Segment');
                    
                }
                if(con.Type_of_Business__c==null){
                    
                    con.addError('Please Enter the Type of Business');
                    
                }
                if(con.Cluster__c==null){
                    
                    con.addError('Please Enter the Cluster');
                    
                }
                if(con.Customer_Type__c==null){
                    
                    con.addError('Please Enter the Customer Type');
                    
                }
                if(con.Relationship_with_Applicant__c==null){
                    
                    con.addError('Please Enter the Relationship with Applicant');
                    
                }
                if(con.Time_At_Address_In_Years__c==null){
                    
                    con.addError('Please Enter the Time At Address In Years ');
                    
                }
                if(con.Nature_of_Loan__c==null){
                    
                    con.addError('Please Enter the Nature of Loan ');
                    
                }
                if(con.Occupancy_Status__c==null){
                    
                    con.addError('Please Enter the Occupancy Status');
                    
                }
                if(con.Email==null){
                    
                    con.addError('Please Enter the Email');
                    
                }
                if(con.Stage__c==null){
                    
                    con.addError('Please Enter the Stage');
                    
                }
                if(con.Authorised_Person__c==null){
                    
                    con.addError('Please Enter the Authorised Person');
                    
                }
                if(con.Company_Name__c==null){
                    
                    con.addError('Please Enter the Company Name');
                    
                }
                if(con.Applicant_Father_Name__c==null){
                    
                    con.addError('Please Enter the Applicant Father Name');
                    
                }
                if(con.Form_60_Uploaded__c==false){
                    
                    con.addError('Please Enter the Physical Application form uploaded');
                    
                }
                if(con.Flat_House_Number_Office__c==null){
                    
                    con.addError('Please Enter the Office Flat House Number');
                    
                }
                if(con.Building_Street_Name_Office__c==null){
                    
                    con.addError('Please Enter the Office Building Street Name');
                    
                }
                if(con.Area_Office__c==null){
                    
                    con.addError('Please Enter the Office Area');
                    
                }
                if(con.District_Office__c==null){
                    
                    con.addError('Please Enter the Office District');
                    
                }
                
                if(con.Pincode_Office__c==null){
                    
                    con.addError('Please Enter the Office Pincode');
                    
                }
                if(con.Same_As_Current_Address__c!=true){
                    
                    if(con.Flat_House_Number_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Flat House Number');
                        
                    }
                    if(con.Building_Street_Name_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Building Street Name');
                        
                    }
                    if(con.Area_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Area');
                        
                    }
                    if(con.District_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT District');
                        
                    }
                    
                    if(con.Pincode_Mailing__c==null){
                        
                        con.addError('Please Enter the PERMANENT Pincode');
                        
                    }
                    
                }
                if(con.Same_As_Destination_Address__c!=true){
                    
                    if(con.Flat_House_Number_Destination__c==null){
                        
                        con.addError('Please Enter the Residence Flat House Number');
                        
                    }
                    if(con.Building_Street_Name_Destination__c==null){
                        
                        con.addError('Please Enter the Residence Building Street Name');
                        
                    }
                    if(con.Area_Destination__c==null){
                        
                        con.addError('Please Enter the Residence Area');
                        
                    }
                    if(con.District_Destination__c==null){
                        
                        con.addError('Please Enter the Residence District');
                        
                    }
                    
                    if(con.Pincode_Destination__c==null){
                        
                        con.addError('Please Enter the Residence Pincode');
                        
                    }
                    
                }
                if(con.Application_Form_Type__c==null){
                    
                    con.addError('Please Enter the Application Form Type');
                    
                }
                
                if(con.Consent_Received_From_Applicant__c==null){
                    
                    con.addError('Please Enter the Signed Consent Received');
                    
                }
                if(con.CIBIL_ID__c==null){
                    
                    con.addError('Please Enter the CIBIL ID');
                    
                }
                if(con.CIBIL_ID_Number__c==null){
                    
                    con.addError('Please Enter the CIBIL ID Number');
                    
                }
                if(con.CIBIL_Score__c==null){
                    
                    con.addError('Please Enter the CIBIL Score');
                    
                }
                if(con.CIBIL_SCORE_DATE__c==null){
                    
                    con.addError('Please Enter the CIBIL Score Date');
                    
                }
                 if(con.CIBIL_ID_Upload__c!=True){
                    
                    con.addError('Please Enter the CIBIL Document Uploaded');
                    
                }
                if(con.Product__c==Null){
                    
                    con.addError('Please Enter the Product');
                    
                }
                if(con.Loan_Amount__c==Null){
                    
                    con.addError('Please Enter the Loan Amount');
                    
                }
                 if(con.Status__c=='Prospect'){
                    
                    con.addError('CO-APPLICANT/GUARANTOR Status Should be CIBIL Updated ');
                    
                }
                
            }
            
        }
    }
    
}