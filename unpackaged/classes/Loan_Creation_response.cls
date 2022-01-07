public class Loan_Creation_response {

	public class ADDRESS_DETAIL {
		public String ADDRESSTYPE;
		public Integer ADDRESSID;
	}

	public class CUSTOMER_DETAILS {
		public LOAN_DETAIL LOAN_DETAIL;
	}

	public class LOAN_DETAIL {
		public String EXT_PROSPECTCODE;
		public Integer PROSPECTID;
		public String PROSPECTCODE;
		public List<CUSTOMER_DETAIL> CUSTOMER_DETAIL;
	}

	public RECEIVE RECEIVE;
    public CUSTOMER_DETAIL CUSTOMER_DETAIL;
    public ADDRESS_DETAIL ADDRESS_DETAILs;
	public class CUSTOMER_DETAIL {
		public Integer EMPLOYMENTDETAILSID;
		public String APPLICANTCODE;
		public String CUSTOMER_ENTITYTYPE;
		public String APPLICANT_NAME;
		public List<ADDRESS_DETAIL> ADDRESS_DETAIL;
		public Integer APPLICANTID;
		public String APPLICANTTYPE;
		public String EXTERNAL_CUSTOMER_CODE;
	}

	public class RECEIVE {
		public String STATUS;
		public String MESSAGE;
		public String ERR_DTLS;
		public CUSTOMER_DETAILS CUSTOMER_DETAILS;
	}

	
	public static Loan_Creation_response parse(String json) {
		return (Loan_Creation_response) System.JSON.deserialize(json, Loan_Creation_response.class);
	}
   
    
}