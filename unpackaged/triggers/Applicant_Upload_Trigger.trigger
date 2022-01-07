trigger Applicant_Upload_Trigger on Contact (after insert, after update, Before Update) {
    Map<id,contact> IdContactMap=new Map<Id,contact>();
    set<id> appid= new set<id>();
    set<id> docappid= new set<id>();
    static Boolean isFirstTime = true;
    
    if(trigger.isInsert){
        for(Contact con:trigger.new){
            if(con.Applicant_upload__c==True){
                IdContactMap.put(con.id,con);
            }
        }
        
        if(IdContactMap.size() > 0){
            database.executeBatch(new Lead_Assignment(IdContactMap)); // Calling batch class.
        }
        
    }
    if(trigger.isupdate && Trigger.isAfter){
        if(RecursionHelper.disableRecursion==false){
            // if(isFirstTime){
            RecursionHelper.disableRecursion = true;
            for(Contact con:trigger.new){
               // Contact oldContact = Trigger.oldMap.get(con.ID);
                //system.debug('oldContact.Applicant_Code__c->'+oldContact.Applicant_Code__c);
                system.debug('con.Applicant_Code__c->'+con.Applicant_Code__c);
                /*if(con.Status__c=='Prospect' && (con.Applicant_Code__c==null && oldContact.Applicant_Code__c==null)&& con.Applicant_Type__c=='APPLICANT' ){
                    system.debug('inside if conditon');
                    appid.add(con.Id);
                    
                }*/
                if(con.Status__c=='Prospect' && con.Applicant_Code__c!=null){
                    docappid.add(con.Id);
                }
                if(docappid!=null && !system.isBatch() && docappid.size()> 0){
                    database.executeBatch(new Document_creation_batch(docappid));
                }
                
                /*if(appid!=null && !system.isBatch() && appid.size()> 0){
                    database.executeBatch(new loan_creation_batch(appid));
                }*/
                
                
            }
        }
        
    }
    
    if(trigger.isupdate && Trigger.isBefore){
        for(Contact con:trigger.new){
            if(true){ 
                Validation_on_Co_Applicant.validationcheckonCo_Applicant(Trigger.New);
                
            }
        }
    }
    
    
    
    
    
    
}