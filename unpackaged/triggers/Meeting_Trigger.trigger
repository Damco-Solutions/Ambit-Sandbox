trigger Meeting_Trigger on Meeting__c (after insert, before Update, Before insert) {
    if(trigger.isInsert && trigger.isAfter){
        Map<id,id> RecId_OwnerId_Map = new Map<id,id>();
        for(Meeting__c ct:trigger.new){
            RecId_OwnerId_Map.put(ct.id,ct.Salesperson__c);
        }
        if(RecId_OwnerId_Map != null){
            system.debug('call sharing method');
            ShareRecordsToManagers.shareRecords(RecId_OwnerId_Map,'Meeting__c');
        }
        
        }
    if(trigger.isUpdate && trigger.isbefore){       
        for(Meeting__c ma:trigger.new){
            if(true){ 
                MeetingTriggerHandler.validationcheckonReScheduled(Trigger.OldMap,Trigger.NewMap);
                MeetingTriggerHandler.Ownerupdate(Trigger.New,Trigger.OldMap);
            }
        }
            
    }
    
    if(trigger.isInsert && trigger.isbefore){
   
        for(Meeting__c Mt:trigger.new){
               MeetingTriggerHandler.Ownerupdateoninsert(Trigger.New);
              
          }               
    }
    
    }