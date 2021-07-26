public class ConvertForPDf {

	public class ScoreList {
		public String score {get;set;} 
		public String reasonCode1 {get;set;} 
		public String scoreCardVersion {get;set;} 
		public String scoreCardName {get;set;} 
		public String scoreDate {get;set;} 
		public String scoreName {get;set;} 

		public ScoreList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'score') {
							score = parser.getText();
						} else if (text == 'reasonCode1') {
							reasonCode1 = parser.getText();
						} else if (text == 'scoreCardVersion') {
							scoreCardVersion = parser.getText();
						} else if (text == 'scoreCardName') {
							scoreCardName = parser.getText();
						} else if (text == 'scoreDate') {
							scoreDate = parser.getText();
						} else if (text == 'scoreName') {
							scoreName = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'ScoreList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class HEADER {
		public String CUST_ID {get;set;} // in json: CUST-ID
		public String APPLICATION_ID {get;set;} // in json: APPLICATION-ID
		public String RESPONSE_TYPE {get;set;} // in json: RESPONSE-TYPE
		public String REQUEST_RECEIVED_TIME {get;set;} // in json: REQUEST-RECEIVED-TIME

		public HEADER(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'CUST-ID') {
							CUST_ID = parser.getText();
						} else if (text == 'APPLICATION-ID') {
							APPLICATION_ID = parser.getText();
						} else if (text == 'RESPONSE-TYPE') {
							RESPONSE_TYPE = parser.getText();
						} else if (text == 'REQUEST-RECEIVED-TIME') {
							REQUEST_RECEIVED_TIME = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'HEADER consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class EmploymentList {
		public String occupationCode {get;set;} 
		public String accountType {get;set;} 
		public String dateReported {get;set;} 

		public EmploymentList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'occupationCode') {
							occupationCode = parser.getText();
						} else if (text == 'accountType') {
							accountType = parser.getText();
						} else if (text == 'dateReported') {
							dateReported = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'EmploymentList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class FINISHED {
		public Integer TRACKING_ID {get;set;} // in json: TRACKING-ID
		public String BUREAU_STRING {get;set;} // in json: BUREAU-STRING
		public String STATUS {get;set;} 
		public String PRODUCT {get;set;} 
		public JSON_RESPONSE_OBJECT JSON_RESPONSE_OBJECT {get;set;} // in json: JSON-RESPONSE-OBJECT
		public String BUREAU {get;set;} 
		public String HTML_REPORT {get;set;} 
		public List<Integer> PDF_REPORT {get;set;} 

		public FINISHED(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'TRACKING-ID') {
							TRACKING_ID = parser.getIntegerValue();
						} else if (text == 'BUREAU-STRING') {
							BUREAU_STRING = parser.getText();
						} else if (text == 'STATUS') {
							STATUS = parser.getText();
						} else if (text == 'PRODUCT') {
							PRODUCT = parser.getText();
						} else if (text == 'JSON-RESPONSE-OBJECT') {
							JSON_RESPONSE_OBJECT = new JSON_RESPONSE_OBJECT(parser);
						} else if (text == 'BUREAU') {
							BUREAU = parser.getText();
						} else if (text == 'HTML REPORT') {
							HTML_REPORT = parser.getText();
						} else if (text == 'PDF REPORT') {
							PDF_REPORT = arrayOfInteger(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'FINISHED consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class AccountList {
		public String dateReportedAndCertified {get;set;} 
		public String overdueAmount {get;set;} 
		public String dateOpenedOrDisbursed {get;set;} 
		public String accountType {get;set;} 
		public String currentBalance {get;set;} 
		public String paymentHistoryEndDate {get;set;} 
		public String paymentHistoryStartDate {get;set;} 
		public String ownershipIndicator {get;set;} 
		public String paymentHistory1 {get;set;} 
		public String reportingMemberShortName {get;set;} 
		public String dateOfLastPayment {get;set;} 
		public String highCreditOrSanctionedAmount {get;set;} 
		public String paymentHistory2 {get;set;} 
		public String dateClosed {get;set;} 
		public String cashLimit {get;set;} 
		public String rateOfInterest {get;set;} 
		public String actualPaymentAmount {get;set;} 
		public String paymentFrequence {get;set;} 
		public String creditLimit {get;set;} 
		public String repaymentTenure {get;set;} 
		public String emiAmount {get;set;} 
		public String valueOfCollateral {get;set;} 
		public String typeOfCollateral {get;set;} 
		public String errorOrDisputeRemarksCode1 {get;set;} 
		public String errorOrDisputeRemarksCode2 {get;set;} 

		public AccountList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'dateReportedAndCertified') {
							dateReportedAndCertified = parser.getText();
						} else if (text == 'overdueAmount') {
							overdueAmount = parser.getText();
						} else if (text == 'dateOpenedOrDisbursed') {
							dateOpenedOrDisbursed = parser.getText();
						} else if (text == 'accountType') {
							accountType = parser.getText();
						} else if (text == 'currentBalance') {
							currentBalance = parser.getText();
						} else if (text == 'paymentHistoryEndDate') {
							paymentHistoryEndDate = parser.getText();
						} else if (text == 'paymentHistoryStartDate') {
							paymentHistoryStartDate = parser.getText();
						} else if (text == 'ownershipIndicator') {
							ownershipIndicator = parser.getText();
						} else if (text == 'paymentHistory1') {
							paymentHistory1 = parser.getText();
						} else if (text == 'reportingMemberShortName') {
							reportingMemberShortName = parser.getText();
						} else if (text == 'dateOfLastPayment') {
							dateOfLastPayment = parser.getText();
						} else if (text == 'highCreditOrSanctionedAmount') {
							highCreditOrSanctionedAmount = parser.getText();
						} else if (text == 'paymentHistory2') {
							paymentHistory2 = parser.getText();
						} else if (text == 'dateClosed') {
							dateClosed = parser.getText();
						} else if (text == 'cashLimit') {
							cashLimit = parser.getText();
						} else if (text == 'rateOfInterest') {
							rateOfInterest = parser.getText();
						} else if (text == 'actualPaymentAmount') {
							actualPaymentAmount = parser.getText();
						} else if (text == 'paymentFrequence') {
							paymentFrequence = parser.getText();
						} else if (text == 'creditLimit') {
							creditLimit = parser.getText();
						} else if (text == 'repaymentTenure') {
							repaymentTenure = parser.getText();
						} else if (text == 'emiAmount') {
							emiAmount = parser.getText();
						} else if (text == 'valueOfCollateral') {
							valueOfCollateral = parser.getText();
						} else if (text == 'typeOfCollateral') {
							typeOfCollateral = parser.getText();
						} else if (text == 'errorOrDisputeRemarksCode1') {
							errorOrDisputeRemarksCode1 = parser.getText();
						} else if (text == 'errorOrDisputeRemarksCode2') {
							errorOrDisputeRemarksCode2 = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'AccountList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class IdList {
		public String idType {get;set;} 
		public String idValue {get;set;} 
		public String expiryDate {get;set;} 
		public String issueDate {get;set;} 
		public String enrichedThroughtEnquiry {get;set;} 

		public IdList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'idType') {
							idType = parser.getText();
						} else if (text == 'idValue') {
							idValue = parser.getText();
						} else if (text == 'expiryDate') {
							expiryDate = parser.getText();
						} else if (text == 'issueDate') {
							issueDate = parser.getText();
						} else if (text == 'enrichedThroughtEnquiry') {
							enrichedThroughtEnquiry = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'IdList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Name {
		public String name3 {get;set;} 
		public String gender {get;set;} 
		public String dob {get;set;} 
		public String name1 {get;set;} 

		public Name(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'name3') {
							name3 = parser.getText();
						} else if (text == 'gender') {
							gender = parser.getText();
						} else if (text == 'dob') {
							dob = parser.getText();
						} else if (text == 'name1') {
							name1 = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Name consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public String STATUS {get;set;} 
	public Integer ACKNOWLEDGEMENT_ID {get;set;} // in json: ACKNOWLEDGEMENT-ID
	public HEADER HEADER {get;set;} 
	public List<FINISHED> FINISHED {get;set;} 

	public ConvertForPDf(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'STATUS') {
						STATUS = parser.getText();
					} else if (text == 'ACKNOWLEDGEMENT-ID') {
						ACKNOWLEDGEMENT_ID = parser.getIntegerValue();
					} else if (text == 'HEADER') {
						HEADER = new HEADER(parser);
					} else if (text == 'FINISHED') {
						FINISHED = arrayOfFINISHED(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'ConvertForPDf consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Header1 {
		public String memberReferenceNumber {get;set;} 
		public String timeProceed {get;set;} 
		public String enquiryMemberUserID {get;set;} 
		public String dateProceed {get;set;} 
		public String subjectReturnCode {get;set;} 
		public String version {get;set;} 
		public String enquiryControlNumber {get;set;} 

		public Header1(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'memberReferenceNumber') {
							memberReferenceNumber = parser.getText();
						} else if (text == 'timeProceed') {
							timeProceed = parser.getText();
						} else if (text == 'enquiryMemberUserID') {
							enquiryMemberUserID = parser.getText();
						} else if (text == 'dateProceed') {
							dateProceed = parser.getText();
						} else if (text == 'subjectReturnCode') {
							subjectReturnCode = parser.getText();
						} else if (text == 'version') {
							version = parser.getText();
						} else if (text == 'enquiryControlNumber') {
							enquiryControlNumber = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Header consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class EnquiryList {
		public String enquiryPurpose {get;set;} 
		public String dateReported {get;set;} 
		public String reportingMemberShortName {get;set;} 
		public String enquiryAmount {get;set;} 

		public EnquiryList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'enquiryPurpose') {
							enquiryPurpose = parser.getText();
						} else if (text == 'dateReported') {
							dateReported = parser.getText();
						} else if (text == 'reportingMemberShortName') {
							reportingMemberShortName = parser.getText();
						} else if (text == 'enquiryAmount') {
							enquiryAmount = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'EnquiryList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class PhoneList {
		public String enrichEnquiryForPhone {get;set;} 
		public String telephoneNumber {get;set;} 
		public String telephoneType {get;set;} 

		public PhoneList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'enrichEnquiryForPhone') {
							enrichEnquiryForPhone = parser.getText();
						} else if (text == 'telephoneNumber') {
							telephoneNumber = parser.getText();
						} else if (text == 'telephoneType') {
							telephoneType = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'PhoneList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class JSON_RESPONSE_OBJECT {
		public List<ScoreList> scoreList {get;set;} 
		public List<EmploymentList> employmentList {get;set;} 
		public List<AddressList> addressList {get;set;} 
		public List<AccountList> accountList {get;set;} 
		public Name name {get;set;} 
		public Header header {get;set;} 
		public List<PhoneList> phoneList {get;set;} 
		public List<EnquiryList> enquiryList {get;set;} 
		public List<IdList> idList {get;set;} 

		public JSON_RESPONSE_OBJECT(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'scoreList') {
							scoreList = arrayOfScoreList(parser);
						} else if (text == 'employmentList') {
							employmentList = arrayOfEmploymentList(parser);
						} else if (text == 'addressList') {
							addressList = arrayOfAddressList(parser);
						} else if (text == 'accountList') {
							accountList = arrayOfAccountList(parser);
						} else if (text == 'name') {
							name = new Name(parser);
						} else if (text == 'header') {
							header = new Header(parser);
						} else if (text == 'phoneList') {
							phoneList = arrayOfPhoneList(parser);
						} else if (text == 'enquiryList') {
							enquiryList = arrayOfEnquiryList(parser);
						} else if (text == 'idList') {
							idList = arrayOfIdList(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'JSON_RESPONSE_OBJECT consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class AddressList {
		public String addressCategory {get;set;} 
		public String pinCode {get;set;} 
		public String dateReported {get;set;} 
		public String addressLine1 {get;set;} 
		public String stateCode {get;set;} 
		public String enrichedThroughtEnquiry {get;set;} 
		public String addressLine2 {get;set;} 
		public String residenceCode {get;set;} 
		public String addressLine5 {get;set;} 
		public String addressLine3 {get;set;} 

		public AddressList(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'addressCategory') {
							addressCategory = parser.getText();
						} else if (text == 'pinCode') {
							pinCode = parser.getText();
						} else if (text == 'dateReported') {
							dateReported = parser.getText();
						} else if (text == 'addressLine1') {
							addressLine1 = parser.getText();
						} else if (text == 'stateCode') {
							stateCode = parser.getText();
						} else if (text == 'enrichedThroughtEnquiry') {
							enrichedThroughtEnquiry = parser.getText();
						} else if (text == 'addressLine2') {
							addressLine2 = parser.getText();
						} else if (text == 'residenceCode') {
							residenceCode = parser.getText();
						} else if (text == 'addressLine5') {
							addressLine5 = parser.getText();
						} else if (text == 'addressLine3') {
							addressLine3 = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'AddressList consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static ConvertForPDf parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new ConvertForPDf(parser);
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
	

    private static List<PhoneList> arrayOfPhoneList(System.JSONParser p) {
        List<PhoneList> res = new List<PhoneList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new PhoneList(p));
        }
        return res;
    }


    private static List<ScoreList> arrayOfScoreList(System.JSONParser p) {
        List<ScoreList> res = new List<ScoreList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new ScoreList(p));
        }
        return res;
    }






    private static List<Integer> arrayOfInteger(System.JSONParser p) {
        List<Integer> res = new List<Integer>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(p.getIntegerValue());
        }
        return res;
    }


    private static List<AccountList> arrayOfAccountList(System.JSONParser p) {
        List<AccountList> res = new List<AccountList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new AccountList(p));
        }
        return res;
    }








    private static List<FINISHED> arrayOfFINISHED(System.JSONParser p) {
        List<FINISHED> res = new List<FINISHED>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new FINISHED(p));
        }
        return res;
    }



    private static List<IdList> arrayOfIdList(System.JSONParser p) {
        List<IdList> res = new List<IdList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new IdList(p));
        }
        return res;
    }


    private static List<EnquiryList> arrayOfEnquiryList(System.JSONParser p) {
        List<EnquiryList> res = new List<EnquiryList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new EnquiryList(p));
        }
        return res;
    }


    private static List<EmploymentList> arrayOfEmploymentList(System.JSONParser p) {
        List<EmploymentList> res = new List<EmploymentList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new EmploymentList(p));
        }
        return res;
    }
    private static List<AddressList> arrayOfAddressList(System.JSONParser p) {
        List<AddressList> res = new List<AddressList>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new AddressList(p));
        }
        return res;
    }



}