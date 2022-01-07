public class LoanCreationResponse {

	public class ADDRESS_DETAIL {
		public String ADDRESSTYPE;
		public Integer ADDRESSID;
	}

	public class CUSTOMER_DETAILS {
		public LOAN_DETAIL LOAN_DETAIL;
	}

	public RECEIVE RECEIVE;

	public class LOAN_DETAIL {
		public String EXT_PROSPECTCODE;
		public Integer PROSPECTID;
		public String PROSPECTCODE;
		public List<CUSTOMER_DETAIL> CUSTOMER_DETAIL;
	}

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

	
	public static LoanCreationResponse parse(String json) {
		return (LoanCreationResponse) System.JSON.deserialize(json, LoanCreationResponse.class);
	}
}