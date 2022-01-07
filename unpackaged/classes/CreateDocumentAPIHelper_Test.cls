@isTest
public class CreateDocumentAPIHelper_Test implements HttpCalloutMock {
       public HTTPResponse respond(HTTPRequest req) {
            String fullJson = '{"STATUS":"S","MESSAGE":"FILE OBJECT DETAILS FOR THE CUSTOMER SAVED SUCCESSFULLY","DOCUMENT_INFO":[{"FILEOBJECTID":1000080137,"SAVEDDATE":"2021-08-03 15:08:05.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000163320},{"FILEOBJECTID":1000080121,"SAVEDDATE":"2021-07-20 19:02:17.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000163158},{"FILEOBJECTID":1000022782,"SAVEDDATE":"2019-07-27 14:16:58.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074851},{"FILEOBJECTID":1000022781,"SAVEDDATE":"2019-07-27 14:16:38.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074850},{"FILEOBJECTID":1000022780,"SAVEDDATE":"2019-07-27 14:16:37.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074849},{"FILEOBJECTID":1000022779,"SAVEDDATE":"2019-07-27 14:16:36.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074848},{"FILEOBJECTID":1000022778,"SAVEDDATE":"2019-07-27 14:16:36.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074847},{"FILEOBJECTID":1000022777,"SAVEDDATE":"2019-07-27 14:16:34.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074846},{"FILEOBJECTID":1000022776,"SAVEDDATE":"2019-07-27 14:16:18.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074845},{"FILEOBJECTID":1000022775,"SAVEDDATE":"2019-07-27 14:16:12.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074844},{"FILEOBJECTID":1000022757,"SAVEDDATE":"2019-07-26 11:35:46.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074832},{"FILEOBJECTID":1000022756,"SAVEDDATE":"2019-07-26 11:35:46.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074831},{"FILEOBJECTID":1000022755,"SAVEDDATE":"2019-07-26 11:35:46.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074830},{"FILEOBJECTID":1000022754,"SAVEDDATE":"2019-07-26 11:35:45.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074829},{"FILEOBJECTID":1000022753,"SAVEDDATE":"2019-07-26 11:35:13.0","PROSPECTID":1000022227,"PROSPECTCODE":"AHM000000022226","DOCUMENT_ID":1000074828}]}';

            HTTPResponse res = new HTTPResponse();
            res.setHeader('Content-Type', 'text/json');
            res.setBody(fullJson);
            res.setStatusCode(200);
            return res;
        }
    
    Public static testmethod void test1(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        c.CIBIL_ID__c = 'Passport Number';
        c.CIBIL_ID_Number__c = '123';
        c.status__c = 'Prospect';
        insert c;
        
        Login_Checklist__c LC=new Login_Checklist__c(Applicant__c=c.Id,Type__c='SECURED',Category__c='CAT A - Secured',Login_Checklist__c='Age Proof',Document_Type__c='Driving License');
        insert LC;
        
        Property_Checklist__c PC=new Property_Checklist__c(Applicant__c=c.Id,Type_of_Property__c='dummy',Type_of_Document__c='dummy');
        insert PC;
        CreateCD(C.ID);
        CreateCD(LC.ID);
        CreateCD(PC.ID);
        Test.setMock(HttpCalloutMock.class, new CreateDocumentAPIHelper_Test());
        CreateDocumentAPIHelper.SendDocuments(c.id,'1000000741','HL0000000007336', '',  'APPLICANT','','ok PRIYA',  'Y',  'CN0000000017526', '',  'RECEIVED',  '',  'ADDRESS PROOF',  'ORIGINAL',  '06-MAR-2021',  'I',  'GARIMA TEST', '', 'DOCUMENT', '');
        
        
    }
    public static void CreateCD(string LinkedEntityId)
    {
        ContentVersion contentVersion = new ContentVersion(
            Title = 'Penguins',
            PathOnClient = 'Penguins.jpg',
            VersionData = Blob.valueOf('Test Content'),
            IsMajorVersion = true
        );
        insert contentVersion;    
        List<ContentDocument> documents = [
            SELECT Id, Title, LatestPublishedVersionId 
            FROM ContentDocument
        ];
        
        //create ContentDocumentLink  record 
        ContentDocumentLink cdl = New ContentDocumentLink();
        cdl.LinkedEntityId = LinkedEntityId;
        cdl.ContentDocumentId = documents[0].Id;
        cdl.shareType = 'V';
        insert cdl;
    }
    
}