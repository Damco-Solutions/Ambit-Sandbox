public class createloanjsonhelper {

	public class LOAN_DETAILS {
		public String USERID;
		public String APPLICATION_DATE;
		public String ASSIGNED_TO;
		public String EXTERNAL_PROSPECT_CODE;
		public String FORMNO;
		public String TYPE_OF_LOAN;
		public String LOAN_TENOR;
		public String RELATIONSHIP_MGR;
		public String LOAN_AMOUNT;
		public String PURPOSE_SUB_SCHEME;
		public String PROMO_SCHEME_CUSTOMER_TYPE;
		public String SOURCING_CHANNEL_TYPE;
		public String SOURCING_CHANNEL;
		public String SOURCING_AGENT;
		public String SEC_SOURCING_CHANNEL_TYPE;
		public String SEC_SOURCING_CHANNEL;
		public String SEC_SOURCING_AGENT;
		public String BRANCH;
		public String PRODUCT;
		public String SCHEME;
		public String AFFORD_EMI;
		public String DRIVING_LICENCE_NO;
		public List<APPLICANT> APPLICANT;
        
        
	}
    public APPLICANT APPLICANT;
	

	public class CRIF {
		public String SCORE_DATE;
		public String SCORE_CATEGORY;
        public String SCORE;
        public String SCORE_TYPE;
        public String REMARKS;
	}

	public class AUTHENTICATION {
		public String TOKEN;
		public String UNIQUE_REQUEST_ID;
		public String DEVICE_ID;
	}

	public class EXPERIAN {
		public String SCORE_DATE;
		public String SCORE_CATEGORY;
        public String SCORE;
        public String SCORE_TYPE;
        public String REMARKS;
	}

	public class APPLICANT {
		public String IS_EXISTING;
		public String APPLICANT_CODE;
		public String EXTERNAL_CUSTOMER_CODE;
		public String APPLICANT_TYPE;
		public String CUSTOMER_ENTITY_TYPE;
		public String ALIAS;
		public String SALUTATION;
		public String FNAME;
		public String MNAME;
		public String LNAME;
		public String MARITAL_STATUS;
		public String CONSTITUTION;
		public String DATEOFBIRTH;
		public String GENDER;
		public String DEPENDENTS;
		public String NO_OF_DEPENDENTS;
		public String FATHER_FNAME;
		public String FATHER_MNAME;
		public String FATHER_LNAME;
		public String SPOUSE_FNAME;
		public String SPOUSE_MNAME;
		public String SPOUSE_LNAME;
		public String ADHAAR_AS_KYC;
		public String SEGMENT;
		public String TYPE_OF_BUSINESS;
		public String CLUSTER;
		public String CLUSTER_DESCRIPTION;
		public String CKYC_ID;
		public String CUSTOMER_CREDIT_INFO;
		public String EDUCATIONAL_QUALIFICATION;
		public String RELIGION;
		public String PSL;
		public String SOCIAL_CATEGORY;
		public String PREF_TIME_TO_CALL;
		public String PREF_COMMUNICATION_MODE;
		public String RELATION;
		public String NAME_AS_PER_AADHAR;
		public String DNS_REQUIRED;
		public String DNS_REASON;
		public String COMPANY_NAME;
		public String CUST_CATEGORY;
		public String DATE_OF_INCORPORATION;
		public String REGISTRATION_NO;
		public String KEY_CONTACT_PERSON;
		public String AUTHORIZED_CAPITAL;
		public String TINNO;
		public String CIN;
		public String GROUP_NAME;
		public String VOTER_ID;
		public String PASSPORTNO;
		public String OTHER_NAME;
		public String OTHERS_ID_NUMBER;
		public String IS_PAN_AVAILABLE;
		public String PAN_NUMBER;
		public String FORM_60_NAME;
		public String P_FORM60;
		public String UDYAM_REG_NO;
		public List<AUTHORISED_SIGN> AUTHORISED_SIGN;
		public List<ADDRESS_DETAILS> ADDRESS_DETAILS;
		public List<CIBIL> CIBIL;
		public List<CRIF> CRIF;
		public List<EQUIFAX> EQUIFAX;
		public List<EXPERIAN> EXPERIAN;
	}

	public class loanjsonhelper {
		public AUTHENTICATION AUTHENTICATION;
		public LOAN_DETAILS LOAN_DETAILS;
	}

	public class ADDRESS_DETAILS {
		public String ADDRESS_TYPE;
		public String ADDRESSID;
		public String ADDRESS1;
		public String ADDRESS2;
		public String ADDRESS3;
		public String LANDMARK;
		public String EMAIL;
		public String DISTRICT;
		public String STATE;
		public String MOBILE1;
		public String PINCODE;
		public String MOBILE2;
		public String PHONE1;
		public String PHONE2;
		public String FAX;
		public String EXTENSION;
		public String OCCUPANCY_STATUS;
		public String YEAR_OF_STAY_CURRENT_AREA;
		public String MONTHS_OF_STAY_CURRENT_AREA;
		public String GST_APPLICABLE;
		public String GSTIN_NO;
		public String DESTINATION_ADDRESS;
		public String MAILING_ADDRESS;
		public String COMPANY_NAME;
		public String CITY;
        public String EMAIL_AVAILABLE;
	}

	public class EQUIFAX {
		public String SCORE_DATE;
		public String SCORE_CATEGORY;
        public String SCORE;
        public String SCORE_TYPE;
        public String REMARKS;
	}

	public class CIBIL {
		public String SCORE_DATE;
		public String SCORE_CATEGORY;
        public String SCORE;
        public String SCORE_TYPE;
        public String REMARKS;
	}

	public class AUTHORISED_SIGN {
		public String FIRST_NAME;
		public String MIDDLE_NAME;
		public String LAST_NAME;
		public String SIGN;
		public String DINNO;
		public String EMAIL;
		public String CONTACTNO;
		public String DELEGATION;
	}

	
	public static Createloanjsonhelper parse(String json) {
		return (Createloanjsonhelper) System.JSON.deserialize(json, Createloanjsonhelper.class);
	}
     public static string parse(Createloanjsonhelper CD) {
             
                	return  System.JSON.serialize(CD);
            
            
		
	}
}