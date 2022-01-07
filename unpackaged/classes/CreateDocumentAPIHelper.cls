public class CreateDocumentAPIHelper {
   // @Future(callout=true)
    public  static void loanrequest(String AppilcantID,string Token,string PROSPECT_CODE,String DOCUMENT_NAME , String APPLICANT_TYPE, String TARGET_DATE, String REMARKS, String OSV, String APPLICANTCODE, String EXPIRY_DATE, String DOCUMENT_STATUS, String DOCUMENT_ID, String DOCUMENT_TYPE, String DOCUMENT_COPY, String RECEIVED_DATE, String FLAG, String DOCUMENT_DESC,string FILE_EXTN,string OBJECTTYPE,blob P_FORM60 ){
        try{
            String endpoint = 'https://mifinuat1.ambit.co/miFinServices/api/newSaveDocFileSF.do';
            HttpRequest req = new HttpRequest();
            req.setHeader('Accept', '*/*');
            req.setHeader('Content-Type', 'application/json;charset=UTF-8');
            req.setEndpoint(endpoint);
            req.setMethod('POST');
            System.debug('DOCUMENT_ID '+DOCUMENT_ID);
            string reqbody=GenerateJson(AppilcantID,Token, PROSPECT_CODE, DOCUMENT_NAME ,  APPLICANT_TYPE,  TARGET_DATE,  REMARKS,  OSV,  APPLICANTCODE,  EXPIRY_DATE,  DOCUMENT_STATUS,  DOCUMENT_ID,  DOCUMENT_TYPE,  DOCUMENT_COPY,  RECEIVED_DATE,  FLAG,  DOCUMENT_DESC, FILE_EXTN, OBJECTTYPE, P_FORM60 );
            System.debug('reqbody '+reqbody);
            if(reqbody ==null)
            {
                
                CreateTask(AppilcantID,DOCUMENT_NAME +' - Document could not Uploaded',DOCUMENT_NAME +' : This Document could not be uploaded in system. File Size is Larger than 7 MB');
                
            }
            else
            {
                req.setbody(reqbody);
                Http http = new Http();
                HTTPResponse response = http.send(req); 
                String responseBody = response.getBody();
                CreateDocumentResponse CDR=new CreateDocumentResponse();
                system.debug('responseBody '+responseBody);
                CDR=CreateDocumentResponse.parse(responseBody);
                system.Debug('CDR '+CDR);
                if(CDR.STATUS!='S')
                {
                    CreateTask(AppilcantID,DOCUMENT_NAME +' - Document Could not Uploaded',DOCUMENT_NAME +' : This Document could not be uploaded in system, Due to --' +responseBody);
                }
            }
            
        }
        catch(Exception ex)
        {  
            
            CreateTask(AppilcantID,DOCUMENT_NAME +' - Document Could not Uploaded',DOCUMENT_NAME +' : This Document could not be uploaded in system.'+ex.getMessage());
            
        }
       
        
    }
    public static string GenerateJson(String AppilcantID,string Token,string PROSPECT_CODE,String DOCUMENT_NAME , String APPLICANT_TYPE, String TARGET_DATE, String REMARKS, String OSV, String APPLICANTCODE, String EXPIRY_DATE, String DOCUMENT_STATUS, String DOCUMENT_ID, String DOCUMENT_TYPE, String DOCUMENT_COPY, String RECEIVED_DATE, String FLAG, String DOCUMENT_DESC,string FILE_EXTN,string OBJECTTYPE,blob P_FORM60)
    {
        try{
            string Request='';
            
            CreateDocumentJsonHelper CD=new  CreateDocumentJsonHelper();
            
            CreateDocumentJsonHelper.AUTHENTICATION CDA=new CreateDocumentJsonHelper.AUTHENTICATION();
            CreateDocumentJsonHelper.BASICINFO CDBI=new CreateDocumentJsonHelper.BASICINFO();
            CreateDocumentJsonHelper.DOCUMENT_DTL CDDTL=new CreateDocumentJsonHelper.DOCUMENT_DTL();
            CreateDocumentJsonHelper.OBJECT_INFO CDOBI=new CreateDocumentJsonHelper.OBJECT_INFO();
            CDA.TOKEN=Token;
            CDA.UNIQUE_REQUEST_ID='7701099';
            CDA.DEVICE_ID='SALES_FORCE';
            
            CDBI.DOC_STAGE='';
            CDBI.PROSPECT_CODE=PROSPECT_CODE;
            CDDTL.DOCUMENT_NAME= DOCUMENT_NAME;
            CDDTL.APPLICANT_TYPE= APPLICANT_TYPE;
            CDDTL.TARGET_DATE= TARGET_DATE;
            CDDTL.REMARKS= REMARKS;
            CDDTL.OSV= OSV;
            CDDTL.APPLICANTCODE= APPLICANTCODE;
            CDDTL.EXPIRY_DATE= EXPIRY_DATE;
            CDDTL.DOCUMENT_STATUS= DOCUMENT_STATUS;
            CDDTL.DOCUMENT_ID= DOCUMENT_ID;
            CDDTL.DOCUMENT_TYPE= DOCUMENT_TYPE;
            CDDTL.DOCUMENT_COPY= DOCUMENT_COPY;
            CDDTL.RECEIVED_DATE= RECEIVED_DATE;
            CDDTL.FLAG= FLAG;
            CDDTL.DOCUMENT_DESC= DOCUMENT_DESC;
            
            CDOBI.FILE_EXTN=FILE_EXTN;
            CDOBI.OBJECTTYPE=OBJECTTYPE;
            
            CD.P_FORM60=P_FORM60;
            CD.OBJECT_INFO=CDOBI;
            CD.DOCUMENT_DTL=CDDTL;
            CD.BASICINFO=CDBI;
            CD.AUTHENTICATION=CDA;
            
            
            
            return CreateDocumentJsonHelper.parse(CD);
        }
        catch(Exception ex)
        {  
            system.debug('Error '+ex.getMessage());
            CreateTask(AppilcantID,'Document Could not Upload',DOCUMENT_ID +': This Document could not be uploaded in system.'+ex.getMessage());
            
            return null;
        }
        
        
    }
    //   CreateDocumentAPIHelper.SendDocuments(c.id,'1000000741','HL0000000007336', '',  'APPLICANT','','ok PRIYA',  'Y',  'CN0000000017526', '',  'RECEIVED',  '',  'ADDRESS PROOF',  'ORIGINAL',  '06-MAR-2021',  'I',  'GARIMA TEST', '', 'DOCUMENT', '');
    public static void SendDocuments(String AppilcantID,string Token,string PROSPECT_CODE,String DOCUMENT_NAME , String APPLICANT_TYPE, String TARGET_DATE, String REMARKS, String OSV, String APPLICANTCODE, String EXPIRY_DATE, String DOCUMENT_STATUS, String DOCUMENT_ID, String DOCUMENT_TYPE, String DOCUMENT_COPY, String RECEIVED_DATE, String FLAG, String DOCUMENT_DESC,string FILE_EXTN,string OBJECTTYPE,String P_FORM60)
    {
        
        Contact a= [SELECT Name, (SELECT ContentDocumentId, ContentDocument.Title, ContentDocument.ContentSize FROM ContentDocumentLinks) FROM Contact where id=:AppilcantID limit 1];
        Map <id,Login_Checklist__c> LC = new map<id,Login_Checklist__c>([SELECT id,Name,Login_Checklist__c, (SELECT ContentDocumentId, ContentDocument.Title, ContentDocument.ContentSize FROM ContentDocumentLinks) FROM Login_Checklist__c where Applicant__c=:AppilcantID ]);
        Map <id,Property_Checklist__c> PC = new map<id,Property_Checklist__c>([SELECT id,Name,Type_of_Document__c, (SELECT ContentDocumentId, ContentDocument.Title, ContentDocument.ContentSize FROM ContentDocumentLinks) FROM Property_Checklist__c  where Applicant__c=:AppilcantID ]);
        Map <string,string> documentTypeMap = new map<string,string>();
        
        set<ID> ContentDocumentIds=new set<ID>();  
        for (ContentDocumentLink cdl: a.ContentDocumentLinks) {
            ContentDocumentIds.add(cdl.ContentDocumentId);
            
            documentTypeMap.put(cdl.ContentDocumentId,'CIBIL');
        }
        for (string lcl:Lc.keyset()) {
            // ContentDocumentIds.addAll(lcl.ContentDocumentId);
            for (ContentDocumentLink cdl: lc.get(lcl).ContentDocumentLinks) {
                ContentDocumentIds.add(cdl.ContentDocumentId);
                documentTypeMap.put(cdl.ContentDocumentId,lc.get(lcl).Login_Checklist__c);
            }
        }
        for (string pcl:Pc.keyset()) {
            // ContentDocumentIds.addAll(lcl.ContentDocumentId);
            for (ContentDocumentLink cdl: PC.get(pcl).ContentDocumentLinks) {
                ContentDocumentIds.add(cdl.ContentDocumentId);
                documentTypeMap.put(cdl.ContentDocumentId,PC.get(pcl).Type_of_Document__c);
            }
        }
        for (ContentVersion cdl: [SELECT Id,ContentDocumentId, Title, FileType, VersionData,Description, FileExtension FROM ContentVersion where ContentDocumentId in :ContentDocumentIds ]) {
            
            loanrequest(AppilcantID,Token, PROSPECT_CODE, cdl.Title ,  APPLICANT_TYPE,  TARGET_DATE,  REMARKS,  OSV,  APPLICANTCODE,  EXPIRY_DATE,  DOCUMENT_STATUS,  cdl.ContentDocumentId,  documentTypeMap.get(cdl.ContentDocumentId),  DOCUMENT_COPY,  RECEIVED_DATE,  FLAG, cdl.Description, cdl.FileExtension, OBJECTTYPE, cdl.VersionData);
        }
        
    }
    
    public static void CreateTask(string AppilcantID,String Subject, String Descroption)
    {
        Task t = new Task();
        
        t.Subject = Subject;
        t.Status = 'Open';
        t.Priority = 'Normal';
        t.Whoid =AppilcantID;
        t.Description =Descroption;
        insert t;
        
    }
}