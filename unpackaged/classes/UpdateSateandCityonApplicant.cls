public class UpdateSateandCityonApplicant {
    Map<Id,String> ApplicantRegisteredAddress=new Map<Id,String>();
    Map<Id,String> ApplicantMailingAddress=new Map<Id,String>();
    static  Map<Id,String> ApplicantResidentialAddress=new Map<Id,String>();
    static  Map<Id,String> ApplicantPermanentAddress=new Map<Id,String>();
    static  Map<Id,String> ApplicantOfficialAddress=new Map<Id,String>();
    static  Map<string,State_Code_Mapping__c> PincodeDetails=new Map<string,State_Code_Mapping__c>();
    static  Set<string> PinCodes=new Set<string>();
    static  List<Contact> Conlist=new List<Contact>();
    public static void UpdateStateandCity(Map<id,contact> IdContactMap)
    {
        for(Id ids: IdContactMap.keyset())
        {
            //ApplicantResidentialAddress.put(ids,IdContactMap.get(ids).Pincode_Mailing__c);
            //ApplicantPermanentAddress.put(ids,IdContactMap.get(ids).Pincode_Office__c);
            //ApplicantOfficialAddress.put(ids,IdContactMap.get(ids).Pincode_Destination__c	);
            
            PinCodes.add(IdContactMap.get(ids).Pincode_Mailing__c);
            PinCodes.add(IdContactMap.get(ids).Pincode_Office__c);
            PinCodes.add(IdContactMap.get(ids).Pincode_Destination__c);
        }
        List<State_Code_Mapping__c> SCMList=[SELECT Id, Name, State__c, District__c, City__c, Pin_Code__c, State_GST_CODE__c FROM State_Code_Mapping__c where Pin_Code__c in :PinCodes order by name desc];
        for(State_Code_Mapping__c ids: SCMList)
        {
            PincodeDetails.put(ids.pin_Code__C,ids);
            
        }
        for(Contact con: IdContactMap.values())
        {
            /*
            System.debug('con.Pincode_Mailing__c '+con.Pincode_Mailing__c);
             System.debug('con.Pincode_Office__c '+con.Pincode_Office__c);
             System.debug('con.Pincode_Destination__c '+con.Pincode_Destination__c);
              System.debug(' PincodeDetails.get(con.Pincode_Mailing__c).State__c'+ PincodeDetails.get(con.Pincode_Mailing__c).State__c);
            System.debug('PincodeDetails.get(con.Pincode_Office__c).State__c '+PincodeDetails.get(con.Pincode_Office__c).State__c);
            System.debug('PincodeDetails.get(con.Pincode_Destination__c).State__c '+PincodeDetails.get(con.Pincode_Destination__c));
            System.debug('PincodeDetails.get(con.Pincode_Office__c).State__c '+PincodeDetails.get(con.Pincode_Office__c));
            */
            if(con.RecordTypeid==Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId())
            {
                Contact objcon=new Contact(Id=Con.Id,
                                       State_Mailing__c= PincodeDetails.get(con.Pincode_Mailing__c)==null ? Con.State_Mailing__c:PincodeDetails.get(con.Pincode_Mailing__c).State__c,
                                       City_Mailing__c=PincodeDetails.get(con.Pincode_Mailing__c)==null ? Con.City_Mailing__c:PincodeDetails.get(con.Pincode_Mailing__c).City__c,
                                      // District_Mailing__c=PincodeDetails.get(con.Pincode_Mailing__c)==null ? Con.District_Mailing__c:PincodeDetails.get(con.Pincode_Mailing__c).District__c,
                                       
                                       
                                       State_Office__c=PincodeDetails.get(con.Pincode_Office__c)==null ? Con.State_Office__c:PincodeDetails.get(con.Pincode_Office__c).State__c,
                                       City_Office__c=PincodeDetails.get(con.Pincode_Office__c)==null ? Con.City_Office__c:PincodeDetails.get(con.Pincode_Office__c).City__c,
                                           
                                       State_Destination__c=PincodeDetails.get(con.Pincode_Destination__c)==null ? Con.State_Destination__c:PincodeDetails.get(con.Pincode_Destination__c).State__c,
                                       City_Destination__c=PincodeDetails.get(con.Pincode_Destination__c)==null ? con.City_Destination__c:PincodeDetails.get(con.Pincode_Destination__c).City__c);
            
            
            Conlist.add(objcon);
            }
            else
            {
                if(Con.Same_As_Current_Address__c==true)
                {
                     Contact objcon=new Contact(Id=Con.Id,
                                      
                                       State_Office__c=PincodeDetails.get(con.Pincode_Office__c)==null ? Con.State_Office__c:PincodeDetails.get(con.Pincode_Office__c).State__c,
                                       City_Office__c=PincodeDetails.get(con.Pincode_Office__c)==null ? Con.City_Office__c:PincodeDetails.get(con.Pincode_Office__c).City__c);
                                       
            Conlist.add(objcon);
                }
                else
                {
                     Contact objcon=new Contact(Id=Con.Id,
                                       State_Mailing__c= PincodeDetails.get(con.Pincode_Mailing__c)==null ? Con.State_Mailing__c:PincodeDetails.get(con.Pincode_Mailing__c).State__c,
                                       City_Mailing__c=PincodeDetails.get(con.Pincode_Mailing__c)==null ? Con.City_Mailing__c:PincodeDetails.get(con.Pincode_Mailing__c).City__c,
                                       
                                       State_Office__c=PincodeDetails.get(con.Pincode_Office__c)==null ? Con.State_Office__c:PincodeDetails.get(con.Pincode_Office__c).State__c,
                                       City_Office__c=PincodeDetails.get(con.Pincode_Office__c)==null ? Con.City_Office__c:PincodeDetails.get(con.Pincode_Office__c).City__c);
                                       
            Conlist.add(objcon);
                }
                 
            }

        }
        if(!Conlist.isEmpty())
        {
          //  system.debug('Conlist '+Conlist);
            try{
            update Conlist;
            }
            catch (Exception ex)
            {
                System.debug('An Error Occord '+Ex.getMessage()+ ' on Line No. '+ex.getLineNumber());
            }
        }
        
    }
    
}