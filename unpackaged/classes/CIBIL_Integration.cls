global  with sharing class CIBIL_Integration {
    
    public static string urlstring {get;set;}
    public static string html_code {get;set;}
 
    @AuraEnabled
    global  static string AcknowledgementRequest(Id AppId){
        system.debug('class called');
        string issuerespone;
        string Validation;
        set<Decimal> score= new set<Decimal>();
        Contact [] con = [SELECT id,Loan_Amount__c,Product__c,Gender__c,Birthdate,Name,CIBIL_ID__c,MobilePhone,Address_Type__c,MailingAddress,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,
                          State_Destination__c,Pincode_Destination__c,CIBIL_ID_Number__c,CIBIL_Score__c,Firstname,Lastname,Middlename FROM Contact WHERE id=:AppId LIMIT 1];
        for( contact c1:con){
             
            if(c1.CIBIL_Score__c!=null){
                score.add(c1.CIBIL_Score__c);
            }
            if(c1.CIBIL_Score__c==null){
                score=null;
            }
            if(c1.Loan_Amount__c==null||c1.Product__c==null||c1.Gender__c==null||c1.Birthdate==null||c1.CIBIL_ID__c==null||c1.CIBIL_ID_Number__c==null||c1.Flat_House_Number_Destination__c==null||c1.Building_Street_Name_Destination__c==null||c1.Area_Destination__c==null|c1.City_Destination__c==null||c1.State_Destination__c==null||c1.Pincode_Destination__c==null||c1.District_Destination__c==null)
               {
                    Validation=System.Label.cibil_Validation;
                }
            
        }
        
        if(Validation!=null){
            issuerespone=Validation;
        }
        if(score!=null){
            issuerespone=System.Label.Cibil_Score_check;
        }
        if(score==null && Validation==null ){
             System.debug('======= Contact List ====='+con);
        
        // Acknowledgement request header creation
        String  header = CIBIL_Integration.HeaderJSON(con[0]);
        system.debug('header'+header);
        // Acknowledgement request request creation
        String  request = CIBIL_Integration.ReqJSON(con[0]);
        system.debug('request'+request);
        //Acknowledgement input json creation
        String  finaljson=CIBIL_Integration.FinalJSON(header,request);
        system.debug('finaljson'+finaljson);
        // geting Http response for Acknowledgement
        string response= CIBIL_Integration.requestack(finaljson);
        if(!string.isBlank(response)){
            // Issues request creation and getting response 
            issuerespone=CIBIL_Integration.getissuesparameter(response);
             CIBIL_Integration.getissuesrespnse(issuerespone);
        }   
      }
         return issuerespone;
       
   }
    
    @AuraEnabled
    global  static String HeaderJSON(Contact headerlist){
        String jsonString = '"HEADER":';
        String tempJson ='';
        string RequestType='REQUEST';
        Datetime dt=system.Datetime.now();
        string REQUESTTIME = string.valueOfGmt(dt);
        if(headerlist!=null){
            tempJson +='{"APPLICATION-ID":"'+headerlist.Id+'",';
            tempJson +='"CUST-ID":"'+headerlist.Id+'",';
            tempJson +='"REQUEST-TYPE":"'+RequestType+'",';
            tempJson +='"REQUEST-TIME":"'+REQUESTTIME+'"},';
            
        }
        
        String headerJson = jsonString+tempJson;
        
        return headerJson;    
    }
    
    @AuraEnabled
    global  static String ReqJSON(Contact Requestlist){
        String jsonString = '"REQUEST":';
        String tempJson ='';
        string brdate;
        string Loanname;
        string AddressType;
        String Name;
        if(Requestlist.Product__c!=null){
            if(Requestlist.Product__c=='Lead - UCV'){
                Loanname=System.Label.UCV_Product;
            }if(Requestlist.Product__c=='Lead - VYAPAR (SECURED LOAN)'){
                Loanname =System.Label.Secured_Product;     
            }
            if(Requestlist.Product__c=='Lead - UDYAM (UNSECURED LOAN)'){
                Loanname =System.Label.Unsecured_Product;     
            }
        }
        
        if(Requestlist.Birthdate!=null){
            Date br=Requestlist.Birthdate;
            system.debug('birthdate'+br );
            Datetime dt1 =(Datetime)br; 
            brdate = dt1.format('ddMMyyyy');
        }
        if(Requestlist.MiddleName==null){
        Name ='"21":{';      
        Name += '"01":"'+Requestlist.FirstName+'",';
        Name += '"03":"'+Requestlist.LastName+'"},';
        }
        else if(Requestlist.MiddleName!=null){
        Name ='"21":{';      
        Name += '"01":"'+Requestlist.FirstName+'",';
        Name += '"02":"'+Requestlist.MiddleName+'",';
        Name += '"03":"'+Requestlist.LastName+'"},';
        }
        if(Requestlist!=null){
            tempJson +='{"03":"'+Loanname+'",';
            tempJson +='"04":'+Requestlist.Loan_Amount__c+',';
            tempJson +='"07":"'+System.Label.SourceSystemName+'",';
            tempJson +='"11":"'+System.Label.Environment+'",';
            tempJson +='"22":"'+Requestlist.Gender__c+'",';
            tempJson +='"27":"'+brdate+'",';
        }
        String ID ='"30":{';
        ID += '"01":"'+Requestlist.CIBIL_ID_Number__c+'",';
        ID += '"13":"",';
        ID += '"04":"",';
        ID += '"07":"",';
        ID += '"10":""},';
        
        String Phone ='"31":[{';
        if(Requestlist.MobilePhone!=null){
            Phone +='"01":"Mobile Phone",';
            Phone +='"02":"'+Requestlist.MobilePhone+'"}]},';   
        }
        if(Requestlist.Address_Type__c=='Residential Address'){
             AddressType='RESIDENCE';
        }
        String Address ='"29":[{';
        Address +='"01":"'+AddressType+'",';
        Address +='"03":"'+Requestlist.Flat_House_Number_Destination__c+' '+Requestlist.Building_Street_Name_Destination__c+' '+Requestlist.Area_Destination__c+'",';
        Address +='"04":"'+Requestlist.City_Destination__c+'",';
        Address +='"05":"'+Requestlist.Pincode_Destination__c+'",';
        Address +='"06":"'+Requestlist.State_Destination__c+'"}],';
        String RequestJson = jsonString+tempJson+Name+ID+Address+Phone;
       
        return RequestJson;    
    }
    
    @AuraEnabled
    global  static String FinalJSON(string header, string request){
        String mainJson = '';
        string head=header;
        string req=request;
        mainJson+=mainJson+head+req.removeEnd(',')+'}';
        return mainJson ;
    }
    
    @AuraEnabled 
    global static string requestack(String inputjson){
        string url='';
        string AGGREGATORID;
        string INSTITUTIONID;
        string MEMBERID;
        string PASSWORD;
        string AcknowledgementRequest;
        
        List<CIBIL_Score__mdt> cs=[select MasterLabel,AGGREGATOR_ID__c,INSTITUTION_ID__c,MEMBER_ID__c,PASSWORD__c,Environment__c,Acknowledgement_Request__c from CIBIL_Score__mdt LIMIT 1];
        AGGREGATORID=cs[0].AGGREGATOR_ID__c;
        INSTITUTIONID=cs[0].INSTITUTION_ID__c;
        MEMBERID=cs[0].MEMBER_ID__c;
        PASSWORD=cs[0].PASSWORD__c;
        AcknowledgementRequest=cs[0].Acknowledgement_Request__c;
        String encodedString = EncodingUtil.urlEncode(inputjson,'UTF-8');
        system.debug('encodedString '+encodedString);
        url='https://'+AcknowledgementRequest+'?INSTITUTION_ID='+INSTITUTIONID+'&AGGREGATOR_ID='+AGGREGATORID+'&MEMBER_ID='+MEMBERID+'&PASSWORD='+PASSWORD+'&inputJson_={'+encodedString;
        url = url.replace ('%3A',':');
        url = url.replace ('%2C',',');
        url = url.replace ('{','%7B');
        url = url.replace ('+','%20');
        url = url.replace ('%2F','/');
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(url);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('response: '+responseBody);
        return responseBody;     
    }
    
    @AuraEnabled 
    global static string getissuesparameter(String responseBody){
        string Acknowledgementid;
        string Status;
        string REQUESTRECEIVEDTIME;
        string CUSTID;
        string APPLICATIONID;
        string issuesresponse;
        String jsonResult = responseBody;
        System.debug('jsonResult '+jsonResult);
        JSONParser parser = JSON.createParser(jsonResult);
        // Parsing of string
        while(parser.nextToken()!= null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if(parser.getCurrentName() =='ACKNOWLEDGEMENT-ID') {
                    Acknowledgementid = parser.getText();
                }  if (parser.getCurrentName() =='STATUS') {
                    Status = parser.getText();
                }
                if (parser.getCurrentName() =='REQUEST-RECEIVED-TIME') {
                    REQUESTRECEIVEDTIME = parser.getText();
                }
                if (parser.getCurrentName() =='CUST-ID') {
                    CUSTID = parser.getText();
                } 
                if (parser.getCurrentName() =='APPLICATION-ID') {
                    APPLICATIONID = parser.getText();
                    break;
                }   
            }
            
            system.debug('Acknowledgementid: '+Acknowledgementid);
            system.debug('Status: '+Status);
            system.debug('REQUESTRECEIVEDTIME: '+REQUESTRECEIVEDTIME);
            
        }
        if(Status!='Success'){
            
            return jsonResult;
        }
        
        // if Acknowledgement status is success ,then Issue input json creation is called
        else if(Status=='Success'){
            issuesresponse=CIBIL_Integration.IssueHeaderJSON(CUSTID,APPLICATIONID,Acknowledgementid,REQUESTRECEIVEDTIME);  
        }
        return issuesresponse;  
    }
    
    // Issue input json creation 
    @AuraEnabled
    global  static String IssueHeaderJSON( string CUSTID,string APPLICATIONID ,string Acknowledgementid,string RequestRecivedtime){
        String jsonString = '"HEADER":';
        String tempJson ='';
        string RequestType='ISSUE';
        string REQUESTTIME =RequestRecivedtime;
        
        tempJson +='{"APPLICATION-ID":"'+APPLICATIONID+'",';
        tempJson +='"CUST-ID":"'+CUSTID+'",';
        tempJson +='"REQUEST-TIME":null,';
        tempJson +='"REQUEST-RECEIVED-TIME":"'+REQUESTTIME+'",';
        tempJson +='"REQUEST-TYPE":"'+RequestType+'",';
        tempJson +='"RESPONSE-TYPE":null,';
        tempJson +='"SOURCE-SYSTEM":"'+System.Label.SourceSystemName+'"},';
        tempJson +='"ACKNOWLEDGEMENT-ID":'+Acknowledgementid.trim()+',';
        
        String ResponseFormat ='"RESPONSE-FORMAT":[';
        ResponseFormat +='"04",';
        ResponseFormat +='"03",';
        ResponseFormat +='"08",';
        ResponseFormat +='"01"]}';   
        
        String IssuesheaderJson = jsonString+tempJson+ResponseFormat;
        system.debug('IssuesheaderJson->'+IssuesheaderJson);
        string issuesresponse=CIBIL_Integration.RequestIssue(IssuesheaderJson);     
        return issuesresponse;    
    }
    
    // Calling Http response for Issues request
    @AuraEnabled 
    global static string RequestIssue(String inputjson){
        string url='';
        string AGGREGATORID;
        string INSTITUTIONID;
        string MEMBERID;
        string PASSWORD;
        string IssueRequest;
        
        List<CIBIL_Score__mdt> cs=[select MasterLabel,AGGREGATOR_ID__c,INSTITUTION_ID__c,MEMBER_ID__c,PASSWORD__c,Environment__c,Issue_Request__c from CIBIL_Score__mdt LIMIT 1];
        AGGREGATORID=cs[0].AGGREGATOR_ID__c;
        INSTITUTIONID=cs[0].INSTITUTION_ID__c;
        MEMBERID=cs[0].MEMBER_ID__c;
        PASSWORD=cs[0].PASSWORD__c;
        IssueRequest=cs[0].Issue_Request__c;
        String encodedString = EncodingUtil.urlEncode(inputjson,'UTF-8');
        system.debug('encodedString '+encodedString);
        url='https://'+IssueRequest+'?INSTITUTION_ID='+INSTITUTIONID+'&AGGREGATOR_ID='+AGGREGATORID+'&MEMBER_ID='+MEMBERID+'&PASSWORD='+PASSWORD+'&inputJson_={'+encodedString;
        system.debug('endpoint->'+url);
        url = url.replace ('%3A',':');
        url = url.replace ('%2C',',');
        url = url.replace ('{','%7B');
        url = url.replace ('+','%20');
        system.debug('final endpoint->'+url);
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(url);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('Status Code: '+res.getStatusCode());
        system.debug('response: '+responseBody);
        urlstring=url;
        return responseBody;   
    }
    @AuraEnabled 
    global static string getissuesrespnse(String responseBody){
        string issuesresponse;
        string MainStatus;
        string instatus;
        string DESCRIPTION;
        String jsonResult = responseBody;
        //string callurl=url;
        System.debug('jsonResult '+jsonResult);
        JSONParser parser = JSON.createParser(jsonResult);
        // Parsing of string
        while(parser.nextToken()!= null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                 if (parser.getCurrentName() =='STATUS') {
                    MainStatus = parser.getText();
                     break;
                }
            }
        }
        
        while(parser.nextToken()!= null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                 if (parser.getCurrentName() =='STATUS') {
                    instatus = parser.getText();   
                } 
             }    
          }
            
            system.debug('Status main: '+MainStatus);
            system.debug('instatus:'+instatus);
           system.debug('DESCRIPTION : '+DESCRIPTION);
            
        if(MainStatus=='IN-PROCESS' && instatus=='WAITING'){
            string url=urlstring;
            CIBIL_Integration.inprogessresponse(url);   
        }
        if(MainStatus=='IN-PROCESS' && instatus==null){
            string url=urlstring;
            CIBIL_Integration.inprogessresponse(url);  
        }
        if(MainStatus=='COMPLETED' && instatus=='WAITING'){
            string url=urlstring;
            CIBIL_Integration.inprogessresponse(url);  
        }
        if(MainStatus=='COMPLETED' && instatus=='WAITING'){
            string url=urlstring;
            CIBIL_Integration.inprogessresponse(url);  
        }
        if(MainStatus=='COMPLETED' && instatus=='ERROR'){
            return jsonResult;  
        }
        if(MainStatus=='COMPLETED' && instatus=='BUREAU-ERROR'){
            return jsonResult; 
        }
        
        // if Issues response status is success ,then Issue input json creation is called
        else if(MainStatus=='COMPLETED' && instatus=='SUCCESS'){
            issuesresponse=CIBIL_Integration.UpdateCibilScore(responseBody);  
        }
        return issuesresponse;  
    }
    
    @AuraEnabled 
    global static string UpdateCibilScore(String responseBody){
        string csscore;
        string score;
        string ENCODED_STRING;
        string APPLICATIONID;
        list<contact> con= new list<contact>();
        list<Attachment> csattach= new list<Attachment>();
        String jsonResult = responseBody;
        System.debug('jsonResult '+jsonResult);
        JSONParser parser = JSON.createParser(jsonResult);
         while(parser.nextToken()!= null) {
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if(parser.getCurrentName() =='APPLICATION-ID') {
                    APPLICATIONID = parser.getText();
                }if (parser.getCurrentName() =='score') {
                    csscore = parser.getText();
                }
                  if(parser.getCurrentName() =='ENCODED STRING') {
                  ENCODED_STRING = parser.getText();
                   break;  
                }
             }
         }
         
               System.debug('========== Heap Size :: ' + Limits.getHeapSize());
        system.debug('ENCODED STRING: '+ENCODED_STRING);
     
        if(csscore=='000-1'){
             score='000';
        }else{
          score=String.valueOf(Integer.valueOf(csscore)); 
        }
            
            Decimal CIBILScore = decimal.valueOf(score);
            
            system.debug('APPLICATIONID: '+APPLICATIONID);
            system.debug('score: '+csscore);
            system.debug('CIBILScore: '+CIBILScore);
            system.debug('ENCODED STRING: '+ENCODED_STRING);
            if(APPLICATIONID!=null){
                for (contact cs:[select id,name,CIBIL_Score__c,OwnerId from contact where id=:APPLICATIONID]){
                    contact app= new contact();
                    app.Id=cs.id;
                    app.CIBIL_Score__c=CIBILScore;
                    con.add(app);
                    
                    if(ENCODED_STRING!=null){
                        blob cibilpdf = EncodingUtil.base64Decode(ENCODED_STRING);
                        ContentVersion conVer = new ContentVersion();
              conVer.ContentLocation = 'S'; // to use S specify this document is in Salesforce, to use E for external files
              conVer.PathOnClient = 'Cibilscore.PDF'; // The files name, extension is very important here which will help the file in preview.
              conVer.Title = 'Cibilscore'; // Display name of the files
              conVer.VersionData =cibilpdf; // converting your binary string to Blog
              conver.OwnerId=cs.OwnerId;         
              insert conVer;    //Insert ContentVersion


         // First get the Content Document Id from ContentVersion Object
       Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
       //create ContentDocumentLink  record 
       ContentDocumentLink conDocLink = New ContentDocumentLink();
       conDocLink.LinkedEntityId =APPLICATIONID ; // Specify RECORD ID here i.e Any Object ID (Standard Object/Custom Object)
       conDocLink.ContentDocumentId = conDoc;  //ContentDocumentId Id from ContentVersion
       conDocLink.shareType = 'I';              
       insert conDocLink;
                        
               system.debug('ContVerFile->'+conVer);
               system.debug('conDocLink->'+conDocLink);
            
        }
                    
      } 
    }
            if(!con.isEmpty()){
                update con;     
            }
        
            return null;  
        }
    
     @AuraEnabled 
    global static string inprogessresponse(String url){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(url);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('Status Code: '+res.getStatusCode());
        system.debug('response: '+responseBody);
        CIBIL_Integration.getissuesrespnse(responseBody);
        return null; 
    }
 }