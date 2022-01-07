// Created by Ashwini kumar(Damco-6/1/2022)

public class Loan_TAT_Response_sync_parse {

	public class DEDUPEDETAIL {
		public String APPLICANT_CODE {get;set;} 
		public String APPLICANT_TYPE {get;set;} 
		public String START_DATE_TIME {get;set;} 
		public String END_DATE_TIME {get;set;} 

		public DEDUPEDETAIL(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'APPLICANT_CODE') {
							APPLICANT_CODE = parser.getText();
						} else if (text == 'APPLICANT_TYPE') {
							APPLICANT_TYPE = parser.getText();
						} else if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'DEDUPEDETAIL consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class LOAN_DETAIL_Z {
		public LOAN_DETAIL LOAN_DETAIL {get;set;} 

		public LOAN_DETAIL_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'LOAN_DETAIL') {
							LOAN_DETAIL = new LOAN_DETAIL(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'LOAN_DETAIL_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class DEVIATION_ROLE {
		public String START_DATE_TIME {get;set;} 
		public String END_DATE_TIME {get;set;} 
		public String RAISED_TO {get;set;} 

		public DEVIATION_ROLE(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else if (text == 'RAISED_TO') {
							RAISED_TO = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'DEVIATION_ROLE consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class CREDIT_DECISION_USER {
		public String START_DATE_TIME {get;set;} 
		public String ASSIGNED_TO {get;set;} 
		public String END_DATE_TIME {get;set;} 

		public CREDIT_DECISION_USER(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'ASSIGNED_TO') {
							ASSIGNED_TO = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'CREDIT_DECISION_USER consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class CREDIT_DECISION {
		public String ASSIGNED_DATE {get;set;} 
		public String ACTION_DATE {get;set;} 
		public String START_DATE_TIME {get;set;} 
		public String AGING {get;set;} 
		public String ASSIGNED_TO {get;set;} 
		public String ASSIGNED_ACTION_TYPE {get;set;} 
		public String END_DATE_TIME {get;set;} 
		public String ASSIGNED_BY {get;set;} 
		public String ASSIGNED_ACTION_CODE {get;set;} 
		public String ASSIGNED_TO_DECISION_ROLE {get;set;} 
		public String ACTION {get;set;} 
		public String ASSIGNMENT_REMARKS {get;set;} 
		public String ASSIGNED_TO_LEVEL {get;set;} 

		public CREDIT_DECISION(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'ASSIGNED_DATE') {
							ASSIGNED_DATE = parser.getText();
						} else if (text == 'ACTION_DATE') {
							ACTION_DATE = parser.getText();
						} else if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'AGING') {
							AGING = parser.getText();
						} else if (text == 'ASSIGNED_TO') {
							ASSIGNED_TO = parser.getText();
						} else if (text == 'ASSIGNED_ACTION_TYPE') {
							ASSIGNED_ACTION_TYPE = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else if (text == 'ASSIGNED_BY') {
							ASSIGNED_BY = parser.getText();
						} else if (text == 'ASSIGNED_ACTION_CODE') {
							ASSIGNED_ACTION_CODE = parser.getText();
						} else if (text == 'ASSIGNED_TO_DECISION_ROLE') {
							ASSIGNED_TO_DECISION_ROLE = parser.getText();
						} else if (text == 'ACTION') {
							ACTION = parser.getText();
						} else if (text == 'ASSIGNMENT_REMARKS') {
							ASSIGNMENT_REMARKS = parser.getText();
						} else if (text == 'ASSIGNED_TO_LEVEL') {
							ASSIGNED_TO_LEVEL = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'CREDIT_DECISION consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class IMDDETAIL {
		public String STATUS {get;set;} 
		public String START_DATE_TIME {get;set;} 
		public String END_DATE_TIME {get;set;} 
		public String RECEIPT_NO {get;set;} 

		public IMDDETAIL(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'STATUS') {
							STATUS = parser.getText();
						} else if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else if (text == 'RECEIPT_NO') {
							RECEIPT_NO = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'IMDDETAIL consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public String STATUS {get;set;} 
	public String MESSAGE {get;set;} 
	public LOAN_DETAIL_Z LOAN_DETAIL {get;set;} 
    public LOAN_DETAIL LOAN_DETAILs{get;set;}
    public Loan_TAT_Response_sync_parse Loan_TAT_Response_sync_parse{get;set;}

	public Loan_TAT_Response_sync_parse(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'STATUS') {
						STATUS = parser.getText();
					} else if (text == 'MESSAGE') {
						MESSAGE = parser.getText();
					} else if (text == 'LOAN_DETAIL') {
						LOAN_DETAIL = new LOAN_DETAIL_Z(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'Loan_TAT_Response_sync_parse consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class LEGAL_VALUATION {
		public String LEGAL_STATUS {get;set;} 
		public String START_DATE_TIME {get;set;} 
		public String AGENT_NAME {get;set;} 
		public String AGENCY_NAME {get;set;} 
		public String END_DATE_TIME {get;set;} 

		public LEGAL_VALUATION(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'LEGAL_STATUS') {
							LEGAL_STATUS = parser.getText();
						} else if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'AGENT_NAME') {
							AGENT_NAME = parser.getText();
						} else if (text == 'AGENCY_NAME') {
							AGENCY_NAME = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'LEGAL_VALUATION consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class LOAN_DETAIL {
		public String INC_METHOD {get;set;} 
		public String INTTYPE {get;set;} 
		public String ADV_INST {get;set;} 
		public String CURRENT_AGING {get;set;} 
		public Integer FORM_NUMBER {get;set;} 
		public String MAX_FOIR_PERCENTAGE {get;set;} 
		public String DISB_MK_SEND_BACK_END_DATE_TIME {get;set;} 
		public Integer MORATORIUM_PERIOD_MON {get;set;} 
		public String PRE_EMI_DATE {get;set;} 
		public Integer INSTL_NO {get;set;} 
		public List<DEDUPEDETAIL> DEDUPEDETAIL {get;set;} 
		public String EFFEECTIVE_RATE {get;set;} 
		public String INSTTYPEID {get;set;} 
		public String N0_OF_ADV_EMI {get;set;} 
		public List<CREDIT_DECISION_USER> CREDIT_DECISION_USER {get;set;} 
		public String DISB_MK_END_DATE_TIME {get;set;} 
		public String POS {get;set;} 
		public String LOGIN_TO_FINAL_SANCTION {get;set;} 
		public String REJECT_DATE {get;set;} 
		public String FIRST_DISB_START_DATE_TIME {get;set;} 
		public LOGINDETAIL LOGINDETAIL {get;set;} 
		public String DPD {get;set;} 
		public String TOTAL_HOLIDAYS_PERIOD {get;set;} 
		public String ELIGIBLE_LOAN_AMT_LTV {get;set;} 
		public String DISB_AUTH_SEND_BACK_END_DATE_TIME {get;set;} 
		public String INT_RATE {get;set;} 
		public String TOTAL_HOLD_PERIOD {get;set;} 
		public String REJECT_ACTION_TYPE {get;set;} 
		public String SCHEME_NAME {get;set;} 
		public String MATURITY_DATE {get;set;} 
		public String DBR_PERCENTAGE {get;set;} 
		public String PROPERTY_ADDRESS {get;set;} 
		public Integer SANCTIONED_AMOUNT {get;set;} 
		public String DISB_AUTH_START_DATE_TIME {get;set;} 
		public String REJECT_REMARKS {get;set;} 
		public Integer TENOR {get;set;} 
		public List<DEVIATION_ROLE> DEVIATION_ROLE {get;set;} 
		public String DISBURSAL_DATE {get;set;} 
		public String TARGET_IRR {get;set;} 
		public String ASSET_VALUE {get;set;} 
		public List<CREDIT_DECISION> CREDIT_DECISION {get;set;} 
		public String LOGIN_DATE_QUALITY_TO_START_DATE {get;set;} 
		public String INSURANCE_AMT_TOTAL {get;set;} 
		public String LAST_DISB_END_DATE_TIME {get;set;} 
		public String PF_AMOUNT {get;set;} 
		public String DPD_STRING {get;set;} 
		public List<LEGAL_VALUATION> LEGAL_VALUATION {get;set;} 
		public String LOAN_STATUS {get;set;} 
		public String FIRST_RECOMMENDATION_DATE {get;set;} 
		public String SANCTION_DATE {get;set;} 
		public String EMI_START_DATE {get;set;} 
		public String APPLICATION_DATE {get;set;} 
		public String PROSPECT_CODE {get;set;} 
		public String DISB_MK_SEND_BACK_START_DATE_TIME {get;set;} 
		public String CASH_FLOW_END_DATE_TIME {get;set;} 
		public String REJECT_ACTION_CODE {get;set;} 
		public String DISB_AUTH_SEND_BACK_START_DATE_TIME {get;set;} 
		public Integer TENOR_MONTHS {get;set;} 
		public List<IMDDETAIL> IMDDETAIL {get;set;} 
		public String REPAYMENT_MODE {get;set;} 
		public String UNBILLED_PRINCIPAL {get;set;} 
		public String ADV_EMI_AMT {get;set;} 
		public String DISB_AMT {get;set;} 
		public String DATA_QUALITY_COMPLETION_TO_SANCTION {get;set;} 
		public String EMI {get;set;} 
		public String APPLICANT_CODE {get;set;} 
		public String ELIGIBLELOANAMT {get;set;} 
		public String PRODUCT_NAME {get;set;} 
		public List<DEDUPEDETAIL> CUSTOMER_DETAIL {get;set;} 
		public String AFFORDABLE_EMI {get;set;} 
		public String CURRENT_ACTION {get;set;} 
		public String CUSTOMER_GROUP {get;set;} 
		public String FIRST_RECOMMENDATION_TO_SANCTION_REJECT {get;set;} 
		public String CURRENTLY_ASSIGNED_TO {get;set;} 
		public String CASE_OVERALL_TAT {get;set;} 
		public List<VERIFICATION> VERIFICATION {get;set;} 
		public String LAST_TRANCHE_DISBURSED {get;set;} 
		public String CUST_ENTITYTYP_ENAME {get;set;} 
		public List<DEDUPEDETAIL> FINANCIALDETAIL {get;set;} 
		public String BUSINESS_DATE {get;set;} 
		public String DISB_AUTH_END_DATE_TIME {get;set;} 
		public Integer LOAN_AMOUNT {get;set;} 
		public Integer SCHEME {get;set;} 
		public Integer LOANSUBSTATUSID {get;set;} 
		public String NPA_STAGE {get;set;} 
		public String ASSIGNED_DATE_TIME {get;set;} 
		public String SANCTION_TO_FIRST_DISBURSAL {get;set;} 
		public String BRANCH {get;set;} 
		public String CASH_FLOW_START_DATE_TIME {get;set;} 
		public String MAX_LTV_PERCENTAGE {get;set;} 
		public String DISB_MK_START_DATE_TIME {get;set;} 
		public Integer TENOR_DAYS {get;set;} 
		public String PRE_EMI_AMT {get;set;} 
		public String INST_TYPE {get;set;} 
		public String LTV_PERCENTAGE {get;set;} 
		public String CUSTOMER_NAME {get;set;} 
		public String LOGIN_TO_FIRST_DISBURSAL {get;set;} 
		public String LAST_DISB_START_DATE_TIME {get;set;} 
		public String REPAYMENT_FREQUENCY {get;set;} 
		public String FIRST_DISB_END_DATE_TIME {get;set;} 
		public List<TECHNICAL_VALUATION> TECHNICAL_VALUATION {get;set;} 
		public Integer DISBAMT {get;set;} 
		public List<LOAN_ACTIVITY> LOAN_ACTIVITY {get;set;} 

		public LOAN_DETAIL(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'INC_METHOD') {
							INC_METHOD = parser.getText();
						} else if (text == 'INTTYPE') {
							INTTYPE = parser.getText();
						} else if (text == 'ADV_INST') {
							ADV_INST = parser.getText();
						} else if (text == 'CURRENT_AGING') {
							CURRENT_AGING = parser.getText();
						} else if (text == 'FORM_NUMBER') {
							FORM_NUMBER = parser.getIntegerValue();
						} else if (text == 'MAX_FOIR_PERCENTAGE') {
							MAX_FOIR_PERCENTAGE = parser.getText();
						} else if (text == 'DISB_MK_SEND_BACK_END_DATE_TIME') {
							DISB_MK_SEND_BACK_END_DATE_TIME = parser.getText();
						} else if (text == 'MORATORIUM_PERIOD_MON') {
							MORATORIUM_PERIOD_MON = parser.getIntegerValue();
						} else if (text == 'PRE_EMI_DATE') {
							PRE_EMI_DATE = parser.getText();
						} else if (text == 'INSTL_NO') {
							INSTL_NO = parser.getIntegerValue();
						} else if (text == 'DEDUPEDETAIL') {
							DEDUPEDETAIL = arrayOfDEDUPEDETAIL(parser);
						} else if (text == 'EFFEECTIVE_RATE') {
							EFFEECTIVE_RATE = parser.getText();
						} else if (text == 'INSTTYPEID') {
							INSTTYPEID = parser.getText();
						} else if (text == 'N0_OF_ADV_EMI') {
							N0_OF_ADV_EMI = parser.getText();
						} else if (text == 'CREDIT_DECISION_USER') {
							CREDIT_DECISION_USER = arrayOfCREDIT_DECISION_USER(parser);
						} else if (text == 'DISB_MK_END_DATE_TIME') {
							DISB_MK_END_DATE_TIME = parser.getText();
						} else if (text == 'POS') {
							POS = parser.getText();
						} else if (text == 'LOGIN_TO_FINAL_SANCTION') {
							LOGIN_TO_FINAL_SANCTION = parser.getText();
						} else if (text == 'REJECT_DATE') {
							REJECT_DATE = parser.getText();
						} else if (text == 'FIRST_DISB_START_DATE_TIME') {
							FIRST_DISB_START_DATE_TIME = parser.getText();
						} else if (text == 'LOGINDETAIL') {
							LOGINDETAIL = new LOGINDETAIL(parser);
						} else if (text == 'DPD') {
							DPD = parser.getText();
						} else if (text == 'TOTAL_HOLIDAYS_PERIOD') {
							TOTAL_HOLIDAYS_PERIOD = parser.getText();
						} else if (text == 'ELIGIBLE_LOAN_AMT_LTV') {
							ELIGIBLE_LOAN_AMT_LTV = parser.getText();
						} else if (text == 'DISB_AUTH_SEND_BACK_END_DATE_TIME') {
							DISB_AUTH_SEND_BACK_END_DATE_TIME = parser.getText();
						} else if (text == 'INT_RATE') {
							INT_RATE = parser.getText();
						} else if (text == 'TOTAL_HOLD_PERIOD') {
							TOTAL_HOLD_PERIOD = parser.getText();
						} else if (text == 'REJECT_ACTION_TYPE') {
							REJECT_ACTION_TYPE = parser.getText();
						} else if (text == 'SCHEME_NAME') {
							SCHEME_NAME = parser.getText();
						} else if (text == 'MATURITY_DATE') {
							MATURITY_DATE = parser.getText();
						} else if (text == 'DBR_PERCENTAGE') {
							DBR_PERCENTAGE = parser.getText();
						} else if (text == 'PROPERTY_ADDRESS') {
							PROPERTY_ADDRESS = parser.getText();
						} else if (text == 'SANCTIONED_AMOUNT') {
							SANCTIONED_AMOUNT = parser.getIntegerValue();
						} else if (text == 'DISB_AUTH_START_DATE_TIME') {
							DISB_AUTH_START_DATE_TIME = parser.getText();
						} else if (text == 'REJECT_REMARKS') {
							REJECT_REMARKS = parser.getText();
						} else if (text == 'TENOR') {
							TENOR = parser.getIntegerValue();
						} else if (text == 'DEVIATION_ROLE') {
							DEVIATION_ROLE = arrayOfDEVIATION_ROLE(parser);
						} else if (text == 'DISBURSAL_DATE') {
							DISBURSAL_DATE = parser.getText();
						} else if (text == 'TARGET_IRR') {
							TARGET_IRR = parser.getText();
						} else if (text == 'ASSET_VALUE') {
							ASSET_VALUE = parser.getText();
						} else if (text == 'CREDIT_DECISION') {
							CREDIT_DECISION = arrayOfCREDIT_DECISION(parser);
						} else if (text == 'LOGIN_DATE_QUALITY_TO_START_DATE') {
							LOGIN_DATE_QUALITY_TO_START_DATE = parser.getText();
						} else if (text == 'INSURANCE_AMT_TOTAL') {
							INSURANCE_AMT_TOTAL = parser.getText();
						} else if (text == 'LAST_DISB_END_DATE_TIME') {
							LAST_DISB_END_DATE_TIME = parser.getText();
						} else if (text == 'PF_AMOUNT') {
							PF_AMOUNT = parser.getText();
						} else if (text == 'DPD_STRING') {
							DPD_STRING = parser.getText();
						} else if (text == 'LEGAL_VALUATION') {
							LEGAL_VALUATION = arrayOfLEGAL_VALUATION(parser);
						} else if (text == 'LOAN_STATUS') {
							LOAN_STATUS = parser.getText();
						} else if (text == 'FIRST_RECOMMENDATION_DATE') {
							FIRST_RECOMMENDATION_DATE = parser.getText();
						} else if (text == 'SANCTION_DATE') {
							SANCTION_DATE = parser.getText();
						} else if (text == 'EMI_START_DATE') {
							EMI_START_DATE = parser.getText();
						} else if (text == 'APPLICATION_DATE') {
							APPLICATION_DATE = parser.getText();
						} else if (text == 'PROSPECT_CODE') {
							PROSPECT_CODE = parser.getText();
						} else if (text == 'DISB_MK_SEND_BACK_START_DATE_TIME') {
							DISB_MK_SEND_BACK_START_DATE_TIME = parser.getText();
						} else if (text == 'CASH_FLOW_END_DATE_TIME') {
							CASH_FLOW_END_DATE_TIME = parser.getText();
						} else if (text == 'REJECT_ACTION_CODE') {
							REJECT_ACTION_CODE = parser.getText();
						} else if (text == 'DISB_AUTH_SEND_BACK_START_DATE_TIME') {
							DISB_AUTH_SEND_BACK_START_DATE_TIME = parser.getText();
						} else if (text == 'TENOR_MONTHS') {
							TENOR_MONTHS = parser.getIntegerValue();
						} else if (text == 'IMDDETAIL') {
							IMDDETAIL = arrayOfIMDDETAIL(parser);
						} else if (text == 'REPAYMENT_MODE') {
							REPAYMENT_MODE = parser.getText();
						} else if (text == 'UNBILLED_PRINCIPAL') {
							UNBILLED_PRINCIPAL = parser.getText();
						} else if (text == 'ADV_EMI_AMT') {
							ADV_EMI_AMT = parser.getText();
						} else if (text == 'DISB_AMT') {
							DISB_AMT = parser.getText();
						} else if (text == 'DATA_QUALITY_COMPLETION_TO_SANCTION') {
							DATA_QUALITY_COMPLETION_TO_SANCTION = parser.getText();
						} else if (text == 'EMI') {
							EMI = parser.getText();
						} else if (text == 'APPLICANT_CODE') {
							APPLICANT_CODE = parser.getText();
						} else if (text == 'ELIGIBLELOANAMT') {
							ELIGIBLELOANAMT = parser.getText();
						} else if (text == 'PRODUCT_NAME') {
							PRODUCT_NAME = parser.getText();
						} else if (text == 'CUSTOMER_DETAIL') {
							CUSTOMER_DETAIL = arrayOfDEDUPEDETAIL(parser);
						} else if (text == 'AFFORDABLE_EMI') {
							AFFORDABLE_EMI = parser.getText();
						} else if (text == 'CURRENT_ACTION') {
							CURRENT_ACTION = parser.getText();
						} else if (text == 'CUSTOMER_GROUP') {
							CUSTOMER_GROUP = parser.getText();
						} else if (text == 'FIRST_RECOMMENDATION_TO_SANCTION_REJECT') {
							FIRST_RECOMMENDATION_TO_SANCTION_REJECT = parser.getText();
						} else if (text == 'CURRENTLY_ASSIGNED_TO') {
							CURRENTLY_ASSIGNED_TO = parser.getText();
						} else if (text == 'CASE_OVERALL_TAT') {
							CASE_OVERALL_TAT = parser.getText();
						} else if (text == 'VERIFICATION') {
							VERIFICATION = arrayOfVERIFICATION(parser);
						} else if (text == 'LAST_TRANCHE_DISBURSED') {
							LAST_TRANCHE_DISBURSED = parser.getText();
						} else if (text == 'CUST_ENTITYTYP_ENAME') {
							CUST_ENTITYTYP_ENAME = parser.getText();
						} else if (text == 'FINANCIALDETAIL') {
							FINANCIALDETAIL = arrayOfDEDUPEDETAIL(parser);
						} else if (text == 'BUSINESS_DATE') {
							BUSINESS_DATE = parser.getText();
						} else if (text == 'DISB_AUTH_END_DATE_TIME') {
							DISB_AUTH_END_DATE_TIME = parser.getText();
						} else if (text == 'LOAN_AMOUNT') {
							LOAN_AMOUNT = parser.getIntegerValue();
						} else if (text == 'SCHEME') {
							SCHEME = parser.getIntegerValue();
						} else if (text == 'LOANSUBSTATUSID') {
							LOANSUBSTATUSID = parser.getIntegerValue();
						} else if (text == 'NPA_STAGE') {
							NPA_STAGE = parser.getText();
						} else if (text == 'ASSIGNED_DATE_TIME') {
							ASSIGNED_DATE_TIME = parser.getText();
						} else if (text == 'SANCTION_TO_FIRST_DISBURSAL') {
							SANCTION_TO_FIRST_DISBURSAL = parser.getText();
						} else if (text == 'BRANCH') {
							BRANCH = parser.getText();
						} else if (text == 'CASH_FLOW_START_DATE_TIME') {
							CASH_FLOW_START_DATE_TIME = parser.getText();
						} else if (text == 'MAX_LTV_PERCENTAGE') {
							MAX_LTV_PERCENTAGE = parser.getText();
						} else if (text == 'DISB_MK_START_DATE_TIME') {
							DISB_MK_START_DATE_TIME = parser.getText();
						} else if (text == 'TENOR_DAYS') {
							TENOR_DAYS = parser.getIntegerValue();
						} else if (text == 'PRE_EMI_AMT') {
							PRE_EMI_AMT = parser.getText();
						} else if (text == 'INST_TYPE') {
							INST_TYPE = parser.getText();
						} else if (text == 'LTV_PERCENTAGE') {
							LTV_PERCENTAGE = parser.getText();
						} else if (text == 'CUSTOMER_NAME') {
							CUSTOMER_NAME = parser.getText();
						} else if (text == 'LOGIN_TO_FIRST_DISBURSAL') {
							LOGIN_TO_FIRST_DISBURSAL = parser.getText();
						} else if (text == 'LAST_DISB_START_DATE_TIME') {
							LAST_DISB_START_DATE_TIME = parser.getText();
						} else if (text == 'REPAYMENT_FREQUENCY') {
							REPAYMENT_FREQUENCY = parser.getText();
						} else if (text == 'FIRST_DISB_END_DATE_TIME') {
							FIRST_DISB_END_DATE_TIME = parser.getText();
						} else if (text == 'TECHNICAL_VALUATION') {
							TECHNICAL_VALUATION = arrayOfTECHNICAL_VALUATION(parser);
						} else if (text == 'DISBAMT') {
							DISBAMT = parser.getIntegerValue();
						} else if (text == 'LOAN_ACTIVITY') {
							LOAN_ACTIVITY = arrayOfLOAN_ACTIVITY(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'LOAN_DETAIL consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class LOGINDETAIL {
		public String START_DATE_TIME {get;set;} 
		public String END_DATE_TIME {get;set;} 

		public LOGINDETAIL(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'LOGINDETAIL consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class TECHNICAL_VALUATION {
		public String TECHNICAL_STATUS {get;set;} 
		public String START_DATE_TIME {get;set;} 
		public String AGENT_NAME {get;set;} 
		public String AGENCY_NAME {get;set;} 
		public String VALUATION_AMOUNT {get;set;} 
		public String END_DATE_TIME {get;set;} 

		public TECHNICAL_VALUATION(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'TECHNICAL_STATUS') {
							TECHNICAL_STATUS = parser.getText();
						} else if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'AGENT_NAME') {
							AGENT_NAME = parser.getText();
						} else if (text == 'AGENCY_NAME') {
							AGENCY_NAME = parser.getText();
						} else if (text == 'VALUATION_AMOUNT') {
							VALUATION_AMOUNT = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'TECHNICAL_VALUATION consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class LOAN_ACTIVITY {
		public String ACTIVITY_NAME {get;set;} 
		public Integer SEQ_NO {get;set;} 
		public String UPDATED_BY {get;set;} 
		public String UPDATED_DATE {get;set;} 
		public String UPDATED_DATETIME {get;set;} 
		public Integer ACTIVITY_ID {get;set;} 
		public String STATUS_NAME {get;set;} 
		public Integer ACTION_ID {get;set;} 

		public LOAN_ACTIVITY(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'ACTIVITY_NAME') {
							ACTIVITY_NAME = parser.getText();
						} else if (text == 'SEQ_NO') {
							SEQ_NO = parser.getIntegerValue();
						} else if (text == 'UPDATED_BY') {
							UPDATED_BY = parser.getText();
						} else if (text == 'UPDATED_DATE') {
							UPDATED_DATE = parser.getText();
						} else if (text == 'UPDATED_DATETIME') {
							UPDATED_DATETIME = parser.getText();
						} else if (text == 'ACTIVITY_ID') {
							ACTIVITY_ID = parser.getIntegerValue();
						} else if (text == 'STATUS_NAME') {
							STATUS_NAME = parser.getText();
						} else if (text == 'ACTION_ID') {
							ACTION_ID = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'LOAN_ACTIVITY consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class VERIFICATION {
		public String AGENCY_ID {get;set;} 
		public String START_DATE_TIME {get;set;} 
		public String AGENCY_NAME {get;set;} 
		public String VERIFICATION_TYPE {get;set;} 
		public String END_DATE_TIME {get;set;} 
		public String VERIFICATION_STATUS {get;set;} 

		public VERIFICATION(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'AGENCY_ID') {
							AGENCY_ID = parser.getText();
						} else if (text == 'START_DATE_TIME') {
							START_DATE_TIME = parser.getText();
						} else if (text == 'AGENCY_NAME') {
							AGENCY_NAME = parser.getText();
						} else if (text == 'VERIFICATION_TYPE') {
							VERIFICATION_TYPE = parser.getText();
						} else if (text == 'END_DATE_TIME') {
							END_DATE_TIME = parser.getText();
						} else if (text == 'VERIFICATION_STATUS') {
							VERIFICATION_STATUS = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'VERIFICATION consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static Loan_TAT_Response_sync_parse parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new Loan_TAT_Response_sync_parse(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
    private static List<CREDIT_DECISION> arrayOfCREDIT_DECISION(System.JSONParser p) {
        List<CREDIT_DECISION> res = new List<CREDIT_DECISION>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CREDIT_DECISION(p));
        }
        return res;
    }


    private static List<LEGAL_VALUATION> arrayOfLEGAL_VALUATION(System.JSONParser p) {
        List<LEGAL_VALUATION> res = new List<LEGAL_VALUATION>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new LEGAL_VALUATION(p));
        }
        return res;
    }


    private static List<IMDDETAIL> arrayOfIMDDETAIL(System.JSONParser p) {
        List<IMDDETAIL> res = new List<IMDDETAIL>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new IMDDETAIL(p));
        }
        return res;
    }


    private static List<TECHNICAL_VALUATION> arrayOfTECHNICAL_VALUATION(System.JSONParser p) {
        List<TECHNICAL_VALUATION> res = new List<TECHNICAL_VALUATION>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new TECHNICAL_VALUATION(p));
        }
        return res;
    }


    private static List<LOAN_ACTIVITY> arrayOfLOAN_ACTIVITY(System.JSONParser p) {
        List<LOAN_ACTIVITY> res = new List<LOAN_ACTIVITY>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new LOAN_ACTIVITY(p));
        }
        return res;
    }


    private static List<DEDUPEDETAIL> arrayOfDEDUPEDETAIL(System.JSONParser p) {
        List<DEDUPEDETAIL> res = new List<DEDUPEDETAIL>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DEDUPEDETAIL(p));
        }
        return res;
    }


    private static List<VERIFICATION> arrayOfVERIFICATION(System.JSONParser p) {
        List<VERIFICATION> res = new List<VERIFICATION>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new VERIFICATION(p));
        }
        return res;
    }




    private static List<DEVIATION_ROLE> arrayOfDEVIATION_ROLE(System.JSONParser p) {
        List<DEVIATION_ROLE> res = new List<DEVIATION_ROLE>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new DEVIATION_ROLE(p));
        }
        return res;
    }


    private static List<CREDIT_DECISION_USER> arrayOfCREDIT_DECISION_USER(System.JSONParser p) {
        List<CREDIT_DECISION_USER> res = new List<CREDIT_DECISION_USER>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new CREDIT_DECISION_USER(p));
        }
        return res;
    }
    public Loan_TAT_Response_sync_parse(){
        
        }


}