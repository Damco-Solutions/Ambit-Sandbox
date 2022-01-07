public class Branch_Update_Handler {
    
     public static void Branchupdateoninsert(List<contact> newcontact,Id Branchname){
        for(contact con:newcontact){
                  con.Branch__c=Branchname;    
                
            }
        }
     public static void Sourcingupdateoninsert(List<contact> newcontact,Id Sourcingname){
       for(contact con:newcontact){
              con.Sourcing_Location__c=Sourcingname;   
                
            }
        }
 
     public static void Servicingupdateoninsert(List<contact> newcontact,Id Servicingname){
        for(contact con:newcontact){
                con.Service_Location__c=Servicingname;      
                
            }
        }
    
    
    
    }