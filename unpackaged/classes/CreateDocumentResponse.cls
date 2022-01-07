public class CreateDocumentResponse {

	public String STATUS;
	public String MESSAGE;
	public List<DOCUMENT_INFO> DOCUMENT_INFO;

	public class DOCUMENT_INFO {
		public Integer FILEOBJECTID;
		public String SAVEDDATE;
		public Integer PROSPECTID;
		public String PROSPECTCODE;
		public Integer DOCUMENT_ID;
	}

	
	public static CreateDocumentResponse parse(String json) {
		return (CreateDocumentResponse) System.JSON.deserialize(json, CreateDocumentResponse.class);
	}
}