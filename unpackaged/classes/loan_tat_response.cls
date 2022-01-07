public class loan_tat_response {

	public class DEDUPEDETAIL {
		public String APPLICANT_CODE;
		public String APPLICANT_TYPE;
		public String START_DATE_TIME;
		public String END_DATE_TIME;
	}

	public class LOAN_DETAIL_Z {
		public List<LOAN_DETAIL> LOAN_DETAIL;
	}

	public class DEVIATION_ROLE {
		public String START_DATE_TIME;
		public String END_DATE_TIME;
		public String RAISED_TO;
	}

	public class CREDIT_DECISION_USER {
		public String START_DATE_TIME;
		public String ASSIGNED_TO;
		public String END_DATE_TIME;
	}

	public class CREDIT_DECISION {
		public String ACTION;
		public String START_DATE_TIME;
		public String END_DATE_TIME;
	}

	public class IMDDETAIL {
		public String STATUS;
		public String START_DATE_TIME;
		public String END_DATE_TIME;
		public String RECEIPT_NO;
	}

	public String STATUS;
	public String MESSAGE;
	public LOAN_DETAIL_Z LOAN_DETAIL;
    public List<LOAN_DETAIL> LOAN_DETAILs;
    public Loan_tat_response Loan_tat_response;
    public LOAN_DETAIL_Z LOAN_DETAIL_Z;    
	public class LEGAL_VALUATION {
		public String LEGAL_STATUS;
		public String START_DATE_TIME;
		public String AGENT_NAME;
		public String AGENCY_NAME;
		public String END_DATE_TIME;
	}

	public class LOAN_DETAIL {
		public String INC_METHOD;
		public String INTTYPE;
		public Integer ADV_INST;
		public Integer FORM_NUMBER;
		public String MAX_FOIR_PERCENTAGE;
		public String DISB_MK_SEND_BACK_END_DATE_TIME;
		public Integer MORATORIUM_PERIOD_MON;
		public String PRE_EMI_DATE;
		public Integer INSTL_NO;
		public List<DEDUPEDETAIL> DEDUPEDETAIL;
		public String EFFEECTIVE_RATE;
		public Integer INSTTYPEID;
		public String N0_OF_ADV_EMI;
		public CREDIT_DECISION_USER CREDIT_DECISION_USER;
		public String DISB_MK_END_DATE_TIME;
		public String POS;
		public String LOGIN_TO_FINAL_SANCTION;
		public String REJECT_DATE;
		public String FIRST_DISB_START_DATE_TIME;
		public LOGINDETAIL LOGINDETAIL;
		public String DPD;
		public String TOTAL_HOLIDAYS_PERIOD;
		public Integer ELIGIBLE_LOAN_AMT_LTV;
		public String DISB_AUTH_SEND_BACK_END_DATE_TIME;
		public Integer INT_RATE;
		public String TOTAL_HOLD_PERIOD;
		public String REJECT_ACTION_TYPE;
		public String SCHEME_NAME;
		public String MATURITY_DATE;
		public Integer DBR_PERCENTAGE;
		public String PROPERTY_ADDRESS;
		public Integer SANCTIONED_AMOUNT;
		public String DISB_AUTH_START_DATE_TIME;
		public String REJECT_REMARKS;
		public Integer TENOR;
		public List<DEVIATION_ROLE> DEVIATION_ROLE;
		public String DISBURSAL_DATE;
		public String TARGET_IRR;
		public String ASSET_VALUE;
		public List<CREDIT_DECISION> CREDIT_DECISION;
		public String LOGIN_DATE_QUALITY_TO_START_DATE;
		public String INSURANCE_AMT_TOTAL;
		public String LAST_DISB_END_DATE_TIME;
		public String PF_AMOUNT;
		public String DPD_STRING;
		public List<LEGAL_VALUATION> LEGAL_VALUATION;
		public String LOAN_STATUS;
		public String FIRST_RECOMMENDATION_DATE;
		public String SANCTION_DATE;
		public String EMI_START_DATE;
		public String APPLICATION_DATE;
		public String PROSPECT_CODE;
		public String DISB_MK_SEND_BACK_START_DATE_TIME;
		public String CASH_FLOW_END_DATE_TIME;
		public String REJECT_ACTION_CODE;
		public String DISB_AUTH_SEND_BACK_START_DATE_TIME;
		public Integer TENOR_MONTHS;
		public IMDDETAIL IMDDETAIL;
		public Integer REPAYMENT_MODE;
		public String UNBILLED_PRINCIPAL;
		public String ADV_EMI_AMT;
		public Integer DISB_AMT;
		public String DATA_QUALITY_COMPLETION_TO_SANCTION;
		public String EMI;
		public String APPLICANT_CODE;
		public Integer ELIGIBLELOANAMT;
		public String PRODUCT_NAME;
		public List<DEDUPEDETAIL> CUSTOMER_DETAIL;
		public String AFFORDABLE_EMI;
		public String CUSTOMER_GROUP;
		public String FIRST_RECOMMENDATION_TO_SANCTION_REJECT;
		public String CURRENTLY_ASSIGNED_TO;
		public String CASE_OVERALL_TAT;
		public List<VERIFICATION> VERIFICATION;
		public String LAST_TRANCHE_DISBURSED;
		public String CUST_ENTITYTYP_ENAME;
		public List<DEDUPEDETAIL> FINANCIALDETAIL;
		public String BUSINESS_DATE;
		public String DISB_AUTH_END_DATE_TIME;
		public Integer LOAN_AMOUNT;
		public Integer SCHEME;
		public Integer LOANSUBSTATUSID;
		public String NPA_STAGE;
		public String ASSIGNED_DATE_TIME;
		public String SANCTION_TO_FIRST_DISBURSAL;
		public String BRANCH;
		public String CASH_FLOW_START_DATE_TIME;
		public Integer MAX_LTV_PERCENTAGE;
		public String DISB_MK_START_DATE_TIME;
		public Integer TENOR_DAYS;
		public String PRE_EMI_AMT;
		public String INST_TYPE;
		public Double LTV_PERCENTAGE;
		public String CUSTOMER_NAME;
		public String LOGIN_TO_FIRST_DISBURSAL;
		public String LAST_DISB_START_DATE_TIME;
		public String REPAYMENT_FREQUENCY;
		public String FIRST_DISB_END_DATE_TIME;
		public List<TECHNICAL_VALUATION> TECHNICAL_VALUATION;
		public Integer DISBAMT;
		public List<LOAN_ACTIVITY> LOAN_ACTIVITY;
	}

	public class LOGINDETAIL {
		public String START_DATE_TIME;
		public String END_DATE_TIME;
	}

	public class TECHNICAL_VALUATION {
		public String TECHNICAL_STATUS;
		public String START_DATE_TIME;
		public String AGENT_NAME;
		public String AGENCY_NAME;
		public String VALUATION_AMOUNT;
		public String END_DATE_TIME;
	}

	public class LOAN_ACTIVITY {
		public String ACTIVITY_NAME;
		public Integer SEQ_NO;
		public Integer UPDATED_BY;
		public String UPDATED_DATE;
		public String UPDATED_DATETIME;
		public Integer ACTIVITY_ID;
		public String STATUS_NAME;
		public Integer ACTION_ID;
	}

	public class VERIFICATION {
		public Integer AGENCY_ID;
		public String START_DATE_TIME;
		public Integer AGENCY_NAME;
		public String VERIFICATION_TYPE;
		public String END_DATE_TIME;
		public String VERIFICATION_STATUS;
	}
	public static Loan_tat_response parse(String json) {
		return (Loan_tat_response) System.JSON.deserialize(json, loan_tat_response.class);
	}
}