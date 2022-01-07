public class MeetingTriggerHandler {
    public static void validationcheckonReScheduled(Map<Id,Meeting__c> OldMap,Map<Id,Meeting__c> NewMap){
        for(Meeting__c ma:newMap.values()){
            datetime da=system.now();
            if(ma.Status__c=='Re-Scheduled' && Oldmap.get(ma.Id).Status__c!='Re-Scheduled' && Oldmap.get(ma.Id).Scheduled_Start_Time__c==ma.Scheduled_Start_Time__c){
                ma.addError('Please enter a new Scheduled Start Time');
            }
            if(ma.Status__c!='Completed' && Oldmap.get(ma.Id).Status__c=='Completed'){
                ma.addError('Status of completed meetings cannot be changed');
            }
            
            if(ma.Status__c=='Scheduled' && Oldmap.get(ma.Id).Status__c=='Scheduled'){
                if(da>=ma.Scheduled_Start_Time__c){
                    ma.addError('Scheduled Meeting can not be added in back date');
                }  
            }
            if(ma.Status__c=='Completed'){
                
                if(ma.Type__c!=Oldmap.get(ma.Id).Type__c || ma.Category__c!=Oldmap.get(ma.Id).Category__c
                   || ma.Salesperson__c!=Oldmap.get(ma.Id).Salesperson__c || ma.OwnerId!=Oldmap.get(ma.Id).OwnerId||ma.Scheduled_Start_Time__c!=Oldmap.get(ma.Id).Scheduled_Start_Time__c
                   || ma.Scheduled_End_Time__c!=Oldmap.get(ma.Id).Scheduled_End_Time__c || ma.Scheduled_End_Time__c!=Oldmap.get(ma.Id).Scheduled_End_Time__c
                   || ma.Applicant__c!=Oldmap.get(ma.Id).Applicant__c || ma.Loan_Account__c!=Oldmap.get(ma.Id).Loan_Account__c || ma.Collection_Task__c!=Oldmap.get(ma.Id).Collection_Task__c ||
                   ma.DSA_Connector__c!=Oldmap.get(ma.Id).DSA_Connector__c) 
                {
                    
                    
                    ma.addError('On Completed Stage We Can Not Update Type,Category,Salesperson,Owner,Scheduled Start Time,Scheduled End Time,Applicant,Collection Task,Loan Account,DSA/Connector');
                }
                
            }
        }
        
        
    }
    
    public static void Ownerupdateoninsert(List<Meeting__c> newmeeting){
        for(Meeting__c ma:newmeeting){
            if(ma.Salesperson__c!=null){              
                ma.OwnerId=ma.Salesperson__c;           
                
            }
        }
    }
    
    public static void Ownerupdate(List<Meeting__c> newmeeting,Map<Id,Meeting__c> OldMap){
        for(Meeting__c ma:newmeeting){
            if(ma.Salesperson__c!=null && Oldmap.get(ma.Id).Salesperson__c!=ma.Salesperson__c){              
                ma.OwnerId=ma.Salesperson__c;           
                
            }
        }
    }
    
    public static void validationcheckonCompleted(Map<Id,Meeting__c> OldMap,Map<Id,Meeting__c> NewMap){
        
        for(Meeting__c ma:newMap.values()){
            
            if(ma.Status__c=='Completed' && ma.Meeting_Details__c==null && ma.Check_Out_Location__c!=null){
                ma.addError('Meeting Outcome is required to Complete the meeting');  
            }
            if(ma.Status__c=='Completed'&& ma.Status__c!=Oldmap.get(ma.Id).Status__c && ma.Applicant__c!=null){
                string phone_no;
                string customer_name;
                string salesperson_name=ma.owner_name__c;
                contact con=[select id,Name,MobilePhone from contact where id=:ma.Applicant__c limit 1];
                
                 phone_no = (String)con.get('MobilePhone');
                 customer_name = (String)con.get('Name');
                system.debug('phone_no--'+phone_no);
                system.debug('customer_name--'+customer_name);
                system.debug('salesperson_name--'+salesperson_name);
                if(customer_name!=null && salesperson_name!=null && phone_no!=null){
                    SendSmsFeedback(ma.Id,phone_no,salesperson_name,customer_name);
                }

                
            }
              
        }
        
    }
    
   
   /* public static void checkonrelatedmetting(List<Meeting__c> newmeeting){
        for(Meeting__c ma:newmeeting){
            
            if(ma.Category__c!='Other Referral Source'|| ma.Category__c!='Others'){
                if(ma.Applicant__c==null||ma.Loan_Account__c==null||ma.Collection_Task__c==null||ma.DSA_Connector__c==null){
                     ma.addError('Please select the record related to meeting');  
                }
            }
                //if(ma.Category__c=='Other Referral Source'|| ma.Category__c=='Others')
                system.debug('inside other'+ma.Category__c);
                if(ma.Category__c=='Others'){
                    system.debug('inside other'+ma.Category__c);
                    if(ma.Referral_Source__c==null){
                        
                        ma.addError('Please Enter the Referral Source'); 
                    }
                   
                
            }
            
            
            
        }
    }*/
        
        
    @future(callout=true)
    public static void SendSmsFeedback(id meetingid,string Phoneno,string salesperson_name,string customer_name ){
         string SMS_LOGIN_ID;
         string SMS_PASSWORD;
         string SMS_SENDER;
         string SMS_URL;
         string text;
         string dlr_mask;
         string to;
        string endpoint;
        
        List<SMS_Credential__mdt> sms=[select MasterLabel,SMS_LOGIN_ID__c,SMS_PASSWORD__c,SMS_SENDER__c,SMS_URL__c,dlr_mask__c from SMS_Credential__mdt LIMIT 1];
        SMS_LOGIN_ID=sms[0].SMS_LOGIN_ID__c;
        SMS_PASSWORD=sms[0].SMS_PASSWORD__c;
        SMS_SENDER=sms[0].SMS_SENDER__c;
        SMS_URL=sms[0].SMS_URL__c;
        dlr_mask=sms[0].dlr_mask__c;
        to=Phoneno;
        string AcknowledgementRequest=system.label.site_Url;
         string var1=customer_name;
        //string var2='<a href="https://dev-ambitportal.cs76.force.com/MeetingFeedback/Meeting_Feedback?id={!meetingid}">Click here to rate </a>';
       string var2=salesperson_name;
        string var3='https://dev-ambitportal.cs76.force.com/MeetingFeedback/Meeting_Feedback?id='+meetingid+'';
         string url= 'https://'+AcknowledgementRequest+'?id='+meetingid+'';
        system.debug('customer_name'+var1);
        system.debug('salesperson_name'+var2);
       system.debug('url'+url);
        string  testtext='Thanks '+var1+' for spending your valuable time with the sales executive of Ambit Finvest,'+var2+'. Kindly provide your feedback through the link below.'+url+'';
         system.debug('testtext->'+testtext);
        String encodedString = EncodingUtil.urlEncode(testtext,'UTF-8');
        encodedString = encodedString.replace ('+','%20');
        encodedString = encodedString.replace ('%3A',':');
        system.debug('encodedString->'+encodedString);
        
         endpoint='https://'+SMS_URL+'?username='+SMS_LOGIN_ID+'&password='+SMS_PASSWORD+'&to='+Phoneno+'&from='+SMS_SENDER+'&text='+encodedString+'&dlr-mask='+dlr_mask+'&dlr-url';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('response: '+responseBody);
    }
    
    
    
}