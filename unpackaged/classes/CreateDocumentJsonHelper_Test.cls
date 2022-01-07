@IsTest
public class CreateDocumentJsonHelper_Test {
	
	static testMethod void testParse() {
		String json = '{'+
		'   \"AUTHENTICATION\": {'+
		'      \"TOKEN\": \"1000000581\",'+
		'      \"UNIQUE_REQUEST_ID\": \"7701099\",'+
		'      \"DEVICE_ID\": \"SALES_FORCE\"'+
		'   },'+
		'   \"BASICINFO\": {'+
		'      \"DOC_STAGE\": \"PRE_SANCTION\",'+
		'      \"PROSPECT_CODE\": \"AHM000000022226\"'+
		'   },'+
		'   \"DOCUMENT_DTL\": {'+
		'      \"DOCUMENT_NAME\": \"AADHAAR CARD\",'+
		'      \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'      \"TARGET_DATE\": \"\",'+
		'      \"REMARKS\": \"ok PRIYA UPDATED\",'+
		'      \"OSV\": \"Y\",'+
		'      \"APPLICANTCODE\": \"CN0000000053843\",'+
		'      \"EXPIRY_DATE\": \"05-AUG-2028\",'+
		'      \"DOCUMENT_STATUS\": \"RECEIVED\",'+
		'      \"DOCUMENT_ID\": \"\",'+
		'      \"DOCUMENT_TYPE\": \"ADDRESS PROOF\",'+
		'      \"DOCUMENT_COPY\": \"ORIGINAL\",'+
		'      \"RECEIVED_DATE\": \"06-MAR-2021\",'+
		'      \"FLAG\": \"I\",'+
		'      \"DOCUMENT_DESC\": \"GARIMA TEST\"'+
		'   },'+
		'   \"OBJECT_INFO\": {'+
		'      \"FILE_EXTN\": \"PNG\",'+
		'      \"OBJECTTYPE\": \"DOCUMENT\"'+
		'   },'+
		'   \"P_FORM60\": \""'+
		'}';
		CreateDocumentJsonHelper obj = CreateDocumentJsonHelper.parse(json);
        
            CreateDocumentJsonHelper CD=new  CreateDocumentJsonHelper();
            
            CreateDocumentJsonHelper.AUTHENTICATION CDA=new CreateDocumentJsonHelper.AUTHENTICATION();
            CreateDocumentJsonHelper.BASICINFO CDBI=new CreateDocumentJsonHelper.BASICINFO();
            CreateDocumentJsonHelper.DOCUMENT_DTL CDDTL=new CreateDocumentJsonHelper.DOCUMENT_DTL();
            CreateDocumentJsonHelper.OBJECT_INFO CDOBI=new CreateDocumentJsonHelper.OBJECT_INFO();
            CDA.TOKEN='';
            CDA.UNIQUE_REQUEST_ID='7701099';
            CDA.DEVICE_ID='SALES_FORCE';
            
            CDBI.DOC_STAGE='';
            CDBI.PROSPECT_CODE='';
            CDDTL.DOCUMENT_NAME= '';
            CDDTL.APPLICANT_TYPE= '';
            CDDTL.TARGET_DATE= '';
            CDDTL.REMARKS= '';
            CDDTL.OSV= '';
            CDDTL.APPLICANTCODE= '';
            CDDTL.EXPIRY_DATE= '';
            CDDTL.DOCUMENT_STATUS= '';
            CDDTL.DOCUMENT_ID= '';
            CDDTL.DOCUMENT_TYPE= '';
            CDDTL.DOCUMENT_COPY= '';
            CDDTL.RECEIVED_DATE= '';
            CDDTL.FLAG= '';
            CDDTL.DOCUMENT_DESC= '';
            
            CDOBI.FILE_EXTN='';
            CDOBI.OBJECTTYPE='';
            
            CD.P_FORM60=blob.valueOf('');
            CD.OBJECT_INFO=CDOBI;
            CD.DOCUMENT_DTL=CDDTL;
            CD.BASICINFO=CDBI;
            CD.AUTHENTICATION=CDA; 
          CreateDocumentJsonHelper.parse(CD);
        
		System.assert(obj != null);
        
        
	}
}