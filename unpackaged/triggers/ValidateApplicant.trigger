trigger ValidateApplicant on Contact (before insert,before update) {
  MAP<ID,Contact> newmapCon= new MAP<ID,Contact>([SELECT Id,Pan_Card__c FROM Contact ]);
    Set<string> PinCodes=new Set<string>();
    Map<string,decimal> PincodeDetails=new Map<string,decimal>();
  for(Contact temp : trigger.New){
    PinCodes.add(temp.Pincode_Mailing__c);
    PinCodes.add(temp.Pincode_Office__c);
    PinCodes.add(temp.Pincode_Destination__c);
  }

  List<State_Code_Mapping__c> SCMList=[SELECT Id, Name, State__c, District__c, City__c, Pin_Code__c, State_GST_CODE__c FROM State_Code_Mapping__c where Pin_Code__c in :PinCodes order by name desc];
  for(State_Code_Mapping__c ids: SCMList)
  {
      PincodeDetails.put(ids.pin_Code__C,ids.State_GST_CODE__c);
      
  }
   for(Contact temp : trigger.New){
            system.debug('temp.RecordType.Name '+Schema.SObjectType.Contact.getRecordTypeInfosById().get(temp.RecordTypeid).getname()+'--- '+temp.Status__c);
       
    
       
            if(Schema.SObjectType.Contact.getRecordTypeInfosById().get(temp.RecordTypeid).getname()=='Non Individual' && temp.Status__c=='Prospect'){
                system.debug('Error '+temp.Co_Applicant_1__c);
                if(temp.Co_Applicant_1__c !=null){
                    if(newmapCon.get(temp.Co_Applicant_1__c).Pan_Card__c ==null){
                        
                        temp.Co_Applicant_1__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_2__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_2__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_2__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_2__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_3__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_3__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_3__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_3__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_4__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_4__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_4__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_4__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_5__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_5__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_5__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_5__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_6__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_6__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_6__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_6__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_7__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_7__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_2__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_7__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_8__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_8__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_8__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_8__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_9__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_9__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_9__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_9__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_10__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_10__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_10__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_10__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_11__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_11__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_11__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_11__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_12__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_12__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_12__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_12__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_13__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_13__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_13__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_13__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_14__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_14__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_14__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_14__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Co_Applicant_15__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Co_Applicant_15__c).Pan_Card__c);
                    if(newmapCon.get(temp.Co_Applicant_15__c).Pan_Card__c ==null){
                     
                        temp.Co_Applicant_15__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Guarantor_1__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Guarantor_1__c).Pan_Card__c);
                    if(newmapCon.get(temp.Guarantor_1__c).Pan_Card__c ==null){
                     
                        temp.Guarantor_1__c.addError('Please Update Co-Applicant Pan Card.');
                    }
                }
                if(temp.Guarantor_2__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Guarantor_2__c).Pan_Card__c);
                    if(newmapCon.get(temp.Guarantor_2__c).Pan_Card__c ==null){
                     
                        temp.Guarantor_2__c.addError('Please Update Guarantor Pan Card.');
                    }
                }
                if(temp.Guarantor_2__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Guarantor_2__c).Pan_Card__c);
                    if(newmapCon.get(temp.Guarantor_2__c).Pan_Card__c ==null){
                     
                        temp.Guarantor_2__c.addError('Please Update Guarantor Pan Card.');
                    }
                }
                if(temp.Guarantor_3__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Guarantor_3__c).Pan_Card__c);
                    if(newmapCon.get(temp.Guarantor_3__c).Pan_Card__c ==null){
                     
                        temp.Guarantor_3__c.addError('Please Update Guarantor Pan Card.');
                    }
                }if(temp.Guarantor_4__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Guarantor_4__c).Pan_Card__c);
                    if(newmapCon.get(temp.Guarantor_4__c).Pan_Card__c ==null){
                     
                        temp.Guarantor_4__c.addError('Please Update Guarantor Pan Card.');
                    }
                }
                if(temp.Guarantor_5__c !=null){
                    system.debug('Error '+newmapCon.get(temp.Guarantor_5__c).Pan_Card__c);
                    if(newmapCon.get(temp.Guarantor_5__c).Pan_Card__c ==null){
                     
                        temp.Guarantor_5__c.addError('Please Update Guarantor Pan Card.');
                    }
                }
               
            }
            if(temp.GST_Number__c!=null &&  temp.GST_Number__c!='' )
            {
 // For Permanent Adress-Mailing-----Designation Permanent address
            if(temp.Destination_Permanent_Address__c==true && Decimal.valueof(temp.GST_Number__c.substring(0,2))!=PincodeDetails.get(temp.Pincode_Mailing__c))
            {
                temp.GST_Number__c.addError('State GST Code does not match with desination address please check.');
            }
             // For Office Adress-Office-----Designation Office address
            if(temp.Destination_Office_Address__c==true && Decimal.valueof(temp.GST_Number__c.substring(0,2))!=  PincodeDetails.get(temp.Pincode_Office__c))
            {
                temp.GST_Number__c.addError('State GST Code does not match with desination address please check.');

            }
            // For Recidence Adress-Pincode Destination----Designation current address
            if(temp.Destination_Current_Address__c==true && Decimal.valueof(temp.GST_Number__c.substring(0,2))!=  PincodeDetails.get(temp.Pincode_Destination__c))
            {
                temp.GST_Number__c.addError('State GST Code does not match with desination address please check.'); 

            }
            }
          
        }
}