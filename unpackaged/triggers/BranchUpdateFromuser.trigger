trigger BranchUpdateFromuser on Contact (before insert, Before update) {
    
    Set<id> ownerid=new Set<id>();
    Id Branchid;
    Id Sourcing_locationid;
    Id Service_Locationid;
    set<string>Branchname= new set<string>();
    set<string>Sourcing_location= new set<string>();
    set<string>Service_Location= new set<string>();
    if(trigger.isInsert && trigger.isBefore){
        for(Contact temp : trigger.New){
            if(temp.ownerid!=null){
            ownerid.add(temp.ownerid);
            }   
        }
    }
    if(trigger.isUpdate && trigger.isBefore){
        
        for(Contact temp : trigger.New){
            
            if(temp.OwnerId!=trigger.oldmap.get(temp.Id).ownerId){
                ownerid.add(temp.ownerid);  
            }
        }
    }
        if(ownerid!=null){
            for(user ur :[select id,Branch__c,Sourcing_location__c,Service_Location__c from user where id=:ownerid limit 1]){
                if(string.isNotBlank(ur.Branch__c)){
                    Branchname.add(ur.Branch__c); 
                }
                if(string.isNotBlank(ur.Sourcing_location__c)){
                    Sourcing_location.add(ur.Sourcing_location__c); 
                }
                if(string.isNotBlank(ur.Service_Location__c)){
                    Service_Location.add(ur.Service_Location__c); 
                }
                
                
            }
        }
        
        if(Branchname!=null){
            
            
            for(Account brc :[select id, name From Account where Name=:Branchname limit 1]){
                Branchid=brc.id;
            }
        }
        if(Sourcing_location!=null){
            for(Account brc :[select id, name From Account where Name=:Sourcing_location limit 1]){
                Sourcing_locationid=brc.id;
            }
        }
        if(Service_Location!=null){
            for(Account brc :[select id, name From Account where Name=:Service_Location limit 1]){
                Service_Locationid=brc.id;
            }
        }
        
        if(Branchid!=null){
            Branch_Update_Handler.Branchupdateoninsert(Trigger.New,Branchid);
        }
        if(Sourcing_locationid!=null){
            Branch_Update_Handler.Sourcingupdateoninsert(Trigger.New,Sourcing_locationid);
        }
        if(Service_Locationid!=null){
            Branch_Update_Handler.Servicingupdateoninsert(Trigger.New,Service_Locationid);
        }
    }