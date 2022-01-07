public class ValidateApplicantsHandler {
    public static  void validateCoApp(List<Contact> newMap){
        // Insert case 
        List<Contact> newmapCon=[SELECT Id,RecordType.Name,Status__c, Co_Applicant_1__c,Co_Applicant_2__c, Co_Applicant_3__c, Co_Applicant_4__c, Co_Applicant_5__c, Co_Applicant_6__c,
                                 Co_Applicant_7__c, Co_Applicant_8__c, Co_Applicant_9__c, Co_Applicant_10__c, Co_Applicant_11__c, Co_Applicant_12__c,
                                 Co_Applicant_13__c, Co_Applicant_14__c, Co_Applicant_15__c, Guarantor_1__c, Guarantor_2__c, Guarantor_3__c, Guarantor_4__c,
                                 Guarantor_5__c,Co_Applicant_1__r.Pan_Card__c,
                                 Co_Applicant_2__r.Pan_Card__c, Co_Applicant_3__r.Pan_Card__c, Co_Applicant_4__r.Pan_Card__c, 
                                 Co_Applicant_5__r.Pan_Card__c, Co_Applicant_6__r.Pan_Card__c, Co_Applicant_7__r.Pan_Card__c, Co_Applicant_8__r.Pan_Card__c, 
                                 Co_Applicant_9__r.Pan_Card__c, Co_Applicant_10__r.Pan_Card__c, Co_Applicant_11__r.Pan_Card__c, Co_Applicant_12__r.Pan_Card__c,
                                 Co_Applicant_13__r.Pan_Card__c, Co_Applicant_14__r.Pan_Card__c, Co_Applicant_15__r.Pan_Card__c, Guarantor_1__r.Pan_Card__c,
                                 Guarantor_2__r.Pan_Card__c, Guarantor_3__r.Pan_Card__c, Guarantor_4__r.Pan_Card__c, Guarantor_5__r.Pan_Card__c FROM Contact where id in :newMap ];
        for(Contact temp : newmapCon){
            
            if(Schema.SObjectType.Contact.getRecordTypeInfosById().get(temp.RecordTypeid).getname()=='Non Individual' && temp.Status__c=='BM Queue'){
                if(temp.Co_Applicant_1__c !=null){
                    if(temp.Co_Applicant_1__r.Pan_Card__c ==null){
                     
                        temp.Co_Applicant_1__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_2__c !=null){
                    if(temp.Co_Applicant_2__r.Pan_Card__c ==null){
                        system.debug('Error '+temp.Co_Applicant_1__r.Pan_Card__c);
                        temp.Co_Applicant_2__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
            }
        }
    }
    
    
    
}