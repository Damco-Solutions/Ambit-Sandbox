public class CreateDocumentJsonHelper {

	public class AUTHENTICATION {
		public String TOKEN;
		public String UNIQUE_REQUEST_ID;
		public String DEVICE_ID;
	}

	public class BASICINFO {
		public String DOC_STAGE;
		public String PROSPECT_CODE;
	}

	public AUTHENTICATION AUTHENTICATION;
	public BASICINFO BASICINFO;
	public DOCUMENT_DTL DOCUMENT_DTL;
	public OBJECT_INFO OBJECT_INFO;
	public Blob P_FORM60;

	public class DOCUMENT_DTL {
		public String DOCUMENT_NAME;
		public String APPLICANT_TYPE;
		public String TARGET_DATE;
		public String REMARKS;
		public String OSV;
		public String APPLICANTCODE;
		public String EXPIRY_DATE;
		public String DOCUMENT_STATUS;
		public String DOCUMENT_ID;
		public String DOCUMENT_TYPE;
		public String DOCUMENT_COPY;
		public String RECEIVED_DATE;
		public String FLAG;
		public String DOCUMENT_DESC;
	}

	public class OBJECT_INFO {
		public String FILE_EXTN;
		public String OBJECTTYPE;
	}

	
	public static CreateDocumentJsonHelper parse(String json) {
		return (CreateDocumentJsonHelper) System.JSON.deserialize(json, CreateDocumentJsonHelper.class);
	}
    public static string parse(CreateDocumentJsonHelper CD) {
      System.debug('CD.P_FORM60.size '+CD.P_FORM60.size());
            if(CD.P_FORM60.size()>7826826)
            {
                
      			return  null;
            }
            else
            {
                	return  System.JSON.serialize(CD);
            }
            
		
	}
}