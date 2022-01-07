@IsTest
public class loan_detail_response_sync_parse_Test {
	
	// This test method should give 100% coverage
	static testMethod void testParse() {
		String json = '{'+
		'    \"STATUS\": \"S\",'+
		'    \"MESSAGE\": \"SUCCESS\",'+
		'    \"LOAN_DETAIL\": {'+
		'        \"LOAN_DETAIL\": {'+
		'            \"INC_METHOD\": \"BUSINESS\",'+
		'            \"INTTYPE\": \"\",'+
		'            \"PROSPECT_CODE\": \"BLR000000008161\",'+
		'            \"ADV_INST\": 0,'+
		'            \"PDD_DOCUMENT\": ['+
		'                {'+
		'                    \"CREATED_BY\": 1317002,'+
		'                    \"DOCUMENT_COPY\": \"\",'+
		'                    \"CREATED_DATE\": \"21-08-18\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"DOCUMENT_DESC\": \"\",'+
		'                    \"EXPIRY_DATE\": \"\",'+
		'                    \"DOCUMENT_NAME\": \"\",'+
		'                    \"STATUS\": \"RECEIVED\",'+
		'                    \"LAST_UPD_DATE\": \"\",'+
		'                    \"OSV\": \"\",'+
		'                    \"TARGET_DATE\": \"\",'+
		'                    \"CUSTOMER_NAME\": \"5S70D1V3\",'+
		'                    \"RECEIVED_DATE\": \"21-08-18\",'+
		'                    \"LAST_UPD_BY\": \"\",'+
		'                    \"DOCUMENT_TYPE\": \"Signature Proof\"'+
		'                },'+
		'                {'+
		'                    \"CREATED_BY\": 1422001,'+
		'                    \"DOCUMENT_COPY\": \"OSV\",'+
		'                    \"CREATED_DATE\": \"29-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"DOCUMENT_DESC\": \"PANCARD and Aadhar card\",'+
		'                    \"EXPIRY_DATE\": \"\",'+
		'                    \"DOCUMENT_NAME\": \"PAN No.\",'+
		'                    \"STATUS\": \"RECEIVED\",'+
		'                    \"LAST_UPD_DATE\": \"\",'+
		'                    \"OSV\": \"Y\",'+
		'                    \"TARGET_DATE\": \"\",'+
		'                    \"CUSTOMER_NAME\": \"V1700T1S7R\",'+
		'                    \"RECEIVED_DATE\": \"29-05-19\",'+
		'                    \"LAST_UPD_BY\": \"\",'+
		'                    \"DOCUMENT_TYPE\": \"Identity Proof\"'+
		'                },'+
		'                {'+
		'                    \"CREATED_BY\": 1322001,'+
		'                    \"DOCUMENT_COPY\": \"\",'+
		'                    \"CREATED_DATE\": \"16-07-19\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"DOCUMENT_DESC\": \"Car loan NOC required\",'+
		'                    \"EXPIRY_DATE\": \"\",'+
		'                    \"DOCUMENT_NAME\": \"OTHERS AND MISCELLANEOUS\",'+
		'                    \"STATUS\": \"RECEIVED\",'+
		'                    \"LAST_UPD_DATE\": \"13-08-19\",'+
		'                    \"OSV\": \"N\",'+
		'                    \"TARGET_DATE\": \"\",'+
		'                    \"CUSTOMER_NAME\": \"V1700T1S7R\",'+
		'                    \"RECEIVED_DATE\": \"13-08-19\",'+
		'                    \"LAST_UPD_BY\": 1322001,'+
		'                    \"DOCUMENT_TYPE\": \"Others\"'+
		'                },'+
		'                {'+
		'                    \"CREATED_BY\": 1322001,'+
		'                    \"DOCUMENT_COPY\": \"\",'+
		'                    \"CREATED_DATE\": \"22-06-19\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"DOCUMENT_DESC\": \"Property Papers\",'+
		'                    \"EXPIRY_DATE\": \"\",'+
		'                    \"DOCUMENT_NAME\": \"OTHERS AND MISCELLANEOUS\",'+
		'                    \"STATUS\": \"RECEIVED\",'+
		'                    \"LAST_UPD_DATE\": \"16-07-19\",'+
		'                    \"OSV\": \"N\",'+
		'                    \"TARGET_DATE\": \"\",'+
		'                    \"CUSTOMER_NAME\": \"V1700T1S7R\",'+
		'                    \"RECEIVED_DATE\": \"16-07-19\",'+
		'                    \"LAST_UPD_BY\": 1322001,'+
		'                    \"DOCUMENT_TYPE\": \"Others\"'+
		'                },'+
		'                {'+
		'                    \"CREATED_BY\": 1322001,'+
		'                    \"DOCUMENT_COPY\": \"\",'+
		'                    \"CREATED_DATE\": \"22-06-19\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"DOCUMENT_DESC\": \"Vetting report\",'+
		'                    \"EXPIRY_DATE\": \"\",'+
		'                    \"DOCUMENT_NAME\": \"OTHERS AND MISCELLANEOUS\",'+
		'                    \"STATUS\": \"RECEIVED\",'+
		'                    \"LAST_UPD_DATE\": \"16-07-19\",'+
		'                    \"OSV\": \"N\",'+
		'                    \"TARGET_DATE\": \"\",'+
		'                    \"CUSTOMER_NAME\": \"V1700T1S7R\",'+
		'                    \"RECEIVED_DATE\": \"16-07-19\",'+
		'                    \"LAST_UPD_BY\": 1322001,'+
		'                    \"DOCUMENT_TYPE\": \"Others\"'+
		'                }'+
		'            ],'+
		'            \"FORM_NUMBER\": 9873,'+
		'            \"TENOR_MONTHS\": 0,'+
		'            \"REPAYMENT_MODE\": \"ECS\",'+
		'            \"MAX_FOIR_PERCENTAGE\": 80,'+
		'            \"MORATORIUM_PERIOD_MON\": 0,'+
		'            \"UNBILLED_PRINCIPAL\": \"\",'+
		'            \"PRE_EMI_DATE\": \"05-07-19\",'+
		'            \"ADV_EMI_AMT\": \"\",'+
		'            \"DISB_AMT\": 4145719,'+
		'            \"INSTL_NO\": 108,'+
		'            \"EMI\": \"73,951\",'+
		'            \"INSTTYPEID\": \"EQUAL STRUCTURED INSTALLMENTS\",'+
		'            \"EFFEECTIVE_RATE\": \"\",'+
		'            \"APPLICANT_CODE\": \"CN0000000016276\",'+
		'            \"DISBURSEMENT_DETAIL\": ['+
		'                {'+
		'                    \"BRANCH\": \"NBFC BANK BRANCH\",'+
		'                    \"INSTRUMENT_TYPE\": \"CHEQUE\",'+
		'                    \"BANK\": \"NBFC BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"LOAN ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 9999999999,'+
		'                    \"DISB_PAYMT_AMT\": 2875493,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 999999999,'+
		'                    \"IFSC_CODE\": \"AAAAAAAAAAA\",'+
		'                    \"MICR_CODE\": \"000000000\",'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002084\",'+
		'                    \"BENEFICIARY_NAME\": \"Cholamandalam Investment and Finance Company Ltd\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"NBFC BANK BRANCH\",'+
		'                    \"INSTRUMENT_TYPE\": \"CHEQUE\",'+
		'                    \"BANK\": \"NBFC BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"LOAN ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 9999999999,'+
		'                    \"DISB_PAYMT_AMT\": 112456,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 999999999,'+
		'                    \"IFSC_CODE\": \"AAAAAAAAAAA\",'+
		'                    \"MICR_CODE\": \"000000000\",'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002084\",'+
		'                    \"BENEFICIARY_NAME\": \"Indusind Bank A/C No.KBB00039T\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"DODDAKAMMANAHALLI\",'+
		'                    \"INSTRUMENT_TYPE\": \"RTGS\",'+
		'                    \"BANK\": \"SYNDICATE BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"SAVING ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 1000016200,'+
		'                    \"DISB_PAYMT_AMT\": 1157770,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 6832010013625,'+
		'                    \"IFSC_CODE\": \"SYNB0000683\",'+
		'                    \"MICR_CODE\": 560025119,'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002084\",'+
		'                    \"BENEFICIARY_NAME\": \"VENKATESH\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"NBFC BANK BRANCH\",'+
		'                    \"INSTRUMENT_TYPE\": \"CHEQUE\",'+
		'                    \"BANK\": \"NBFC BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"LOAN ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 9999999999,'+
		'                    \"DISB_PAYMT_AMT\": 2875493,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 999999999,'+
		'                    \"IFSC_CODE\": \"AAAAAAAAAAA\",'+
		'                    \"MICR_CODE\": \"000000000\",'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002083\",'+
		'                    \"BENEFICIARY_NAME\": \"Cholamandalam Investment and Finance Company Ltd\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"NBFC BANK BRANCH\",'+
		'                    \"INSTRUMENT_TYPE\": \"CHEQUE\",'+
		'                    \"BANK\": \"NBFC BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"LOAN ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 9999999999,'+
		'                    \"DISB_PAYMT_AMT\": 112456,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 999999999,'+
		'                    \"IFSC_CODE\": \"AAAAAAAAAAA\",'+
		'                    \"MICR_CODE\": \"000000000\",'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002083\",'+
		'                    \"BENEFICIARY_NAME\": \"Indusind Bank A/C No.KBB00039T\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"DODDAKAMMANAHALLI\",'+
		'                    \"INSTRUMENT_TYPE\": \"RTGS\",'+
		'                    \"BANK\": \"SYNDICATE BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"SAVING ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 1000016200,'+
		'                    \"DISB_PAYMT_AMT\": 1157770,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 6832010013625,'+
		'                    \"IFSC_CODE\": \"SYNB0000683\",'+
		'                    \"MICR_CODE\": 560025119,'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002083\",'+
		'                    \"BENEFICIARY_NAME\": \"VENKATESH\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"NBFC BANK BRANCH\",'+
		'                    \"INSTRUMENT_TYPE\": \"CHEQUE\",'+
		'                    \"BANK\": \"NBFC BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"LOAN ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 9999999999,'+
		'                    \"DISB_PAYMT_AMT\": 2875493,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 999999999,'+
		'                    \"IFSC_CODE\": \"AAAAAAAAAAA\",'+
		'                    \"MICR_CODE\": \"000000000\",'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002085\",'+
		'                    \"BENEFICIARY_NAME\": \"Cholamandalam Investment and Finance Company Ltd\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"NBFC BANK BRANCH\",'+
		'                    \"INSTRUMENT_TYPE\": \"CHEQUE\",'+
		'                    \"BANK\": \"NBFC BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"LOAN ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 9999999999,'+
		'                    \"DISB_PAYMT_AMT\": 112456,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 999999999,'+
		'                    \"IFSC_CODE\": \"AAAAAAAAAAA\",'+
		'                    \"MICR_CODE\": \"000000000\",'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002085\",'+
		'                    \"BENEFICIARY_NAME\": \"Indusind Bank A/C No.KBB00039T\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                },'+
		'                {'+
		'                    \"BRANCH\": \"DODDAKAMMANAHALLI\",'+
		'                    \"INSTRUMENT_TYPE\": \"RTGS\",'+
		'                    \"BANK\": \"SYNDICATE BANK\",'+
		'                    \"DISB_PAYMT_ACCOUNT_NUM\": 1821234020167252,'+
		'                    \"ACCOUNT_TYPE\": \"SAVING ACCOUNT\",'+
		'                    \"APPLICANT_NAME\": \"VENKATESH R\",'+
		'                    \"DISB_PAYMT_INST_DATE\": \"31-05-19\",'+
		'                    \"APPLICANT_TYPE\": \"\",'+
		'                    \"CUSTOMER_ID\": 1000016200,'+
		'                    \"DISB_PAYMT_AMT\": 1157770,'+
		'                    \"DISB_PAYMT_BANK\": \"AU SMALL FINANCE BANK\",'+
		'                    \"DISB_PAYMT_BRANCH\": \"Mumbai-Andheri Kurla Road\",'+
		'                    \"ACCOUNT\": 6832010013625,'+
		'                    \"IFSC_CODE\": \"SYNB0000683\",'+
		'                    \"MICR_CODE\": 560025119,'+
		'                    \"DISB_PAYMT_INST_NUM\": \"002085\",'+
		'                    \"BENEFICIARY_NAME\": \"VENKATESH\",'+
		'                    \"DISBURSED_AMT\": 4145719'+
		'                }'+
		'            ],'+
		'            \"PDC_DETAILS\": {'+
		'                \"FUTURE_INSTRUMENT_COUNTS\": 78,'+
		'                \"SECURITY_PDC_COUNTS\": 4'+
		'            },'+
		'            \"ELIGIBLELOANAMT\": -2061019.49,'+
		'            \"PRODUCT_NAME\": \"AMBIT_VYAPAR\",'+
		'            \"CUSTOMER_DETAIL\": ['+
		'                {'+
		'                    \"PAN_NUMBER\": \"00QV33289\",'+
		'                    \"LNAME\": \"R\",'+
		'                    \"MARITAL_STATUS\": \"MARRIED\",'+
		'                    \"ALIAS\": \"\",'+
		'                    \"REGISTRATION_NO\": \"\",'+
		'                    \"EDUCATIONAL_QUALIFICATION\": 1000000012,'+
		'                    \"DEPENDENTS\": 0,'+
		'                    \"NO_OF_DEPENDENTS\": \"\",'+
		'                    \"CUSTOMER_ENTITY_TYPE\": \"INDIVIDUAL\",'+
		'                    \"DNS_REASON\": \"\",'+
		'                    \"AUTHORIZED_CAPITAL\": \"\",'+
		'                    \"OTHERS_ID_NUMBER\": \"\",'+
		'                    \"APPLICANT_CODE\": \"CN0000000016276\",'+
		'                    \"SALUATION\": 1000000002,'+
		'                    \"FATHER_FNAME\": \"R080307\",'+
		'                    \"PSL\": \"N\",'+
		'                    \"CIN\": \"\",'+
		'                    \"TYPE_OF_BUSINESS\": \"OTHER SERVICES\",'+
		'                    \"CONSTITUTION\": \"INDIVIDUAL\",'+
		'                    \"SPOUSE_MNAME\": \"\",'+
		'                    \"PASSPORTNO\": \"\",'+
		'                    \"FNAME\": \"V1700T1S7\",'+
		'                    \"CLUSTERNAME\": \"E-COMMERCE\",'+
		'                    \"COMPANY_NAME\": \"\",'+
		'                    \"RELIGION\": \"\",'+
		'                    \"OTHER_NAME\": \"\",'+
		'                    \"TINNO\": 1000016201,'+
		'                    \"MNAME\": \"\",'+
		'                    \"SPOUSE_FNAME\": \"\",'+
		'                    \"CLUSTER_DESCRIPTION\": \"RENTAL BUSINESS\",'+
		'                    \"PREF_COMMUNICATION_MODE\": \"\",'+
		'                    \"PREF_TIME_TO_CALL\": \"\",'+
		'                    \"CKYC_ID\": \"\",'+
		'                    \"IS_PAN_AVAILABLE\": \"Y\",'+
		'                    \"KEY_CONTACT_PERSON\": \"\",'+
		'                    \"GENDER\": \"MALE\",'+
		'                    \"DRIVING_LICENCE_NO\": \"\",'+
		'                    \"FORM_60_NAME\": \"\",'+
		'                    \"UDYAM_REG_NO\": \"\",'+
		'                    \"FATHER_MNAME\": \"\",'+
		'                    \"SPOUSE_LNAME\": \"\",'+
		'                    \"DNS_REQUIRED\": \"\",'+
		'                    \"DATE_OF_INCORPORATION\": \"12-05-1968\",'+
		'                    \"SEGMENT\": \"SERVICES\",'+
		'                    \"SOCIAL_CATEGORY\": \"GENERAL\",'+
		'                    \"RELATION\": \"\",'+
		'                    \"NAME_AS_PER_AADHAR\": \"V1700T1S7 R\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"FATHER_LNAME\": \"R\",'+
		'                    \"VOTER_ID\": \"\",'+
		'                    \"GROUP_NAME\": \"AMBT\",'+
		'                    \"CUSTOMER_CREDIT_INFO\": \"NEW TO CREDIT\",'+
		'                    \"DATEOFBIRTH\": \"12-05-68\",'+
		'                    \"ADDRESSDETAIL\": ['+
		'                        {'+
		'                            \"MOBILE2\": 1000016201,'+
		'                            \"ADDRESSTYPE\": \"RESIDENCE ADDRESS\",'+
		'                            \"STATE\": \"KARNATAKA\",'+
		'                            \"EMAIL\": \"T0ST012@0M9L9.COM\",'+
		'                            \"PINCODE\": 560083,'+
		'                            \"STAY_IN_AREA_MONTHS\": 10,'+
		'                            \"DISTRICT\": \"Bangalore Rural\",'+
		'                            \"GST_APPLICABLE\": \"\",'+
		'                            \"ADDRESS1\": \"05 B90R69TT9 R79D\",'+
		'                            \"ADDRESS3\": \"D7DD999998\",'+
		'                            \"ADDRESS2\": \"B997R0\",'+
		'                            \"STAY_IN_AREA_YEARS\": 45,'+
		'                            \"DESTINATION_ADDRESS\": \"Y\",'+
		'                            \"GSTIN_NO\": \"\",'+
		'                            \"MAILING_ADDRESS\": \"Y\",'+
		'                            \"EXT1\": \"\",'+
		'                            \"EXT2\": \"\",'+
		'                            \"COMPANY_NAME\": \"\",'+
		'                            \"OCCUPANCY_STATUS\": \"SELFOWNED\",'+
		'                            \"LANDMARK\": \"\",'+
		'                            \"CITY\": \"BANGALORE SOUTH\",'+
		'                            \"PHONE2\": 1000016201,'+
		'                            \"PHONE1\": 1000016201,'+
		'                            \"FAX\": \"\",'+
		'                            \"MOBILE\": 1000016202'+
		'                        },'+
		'                        {'+
		'                            \"MOBILE2\": 1000016201,'+
		'                            \"ADDRESSTYPE\": \"PERMANENT ADDRESS\",'+
		'                            \"STATE\": \"KARNATAKA\",'+
		'                            \"EMAIL\": \"T0ST012@0M9L9.COM\",'+
		'                            \"PINCODE\": 560083,'+
		'                            \"STAY_IN_AREA_MONTHS\": 10,'+
		'                            \"DISTRICT\": \"Bangalore Rural\",'+
		'                            \"GST_APPLICABLE\": \"\",'+
		'                            \"ADDRESS1\": \"05 B90R69TT9 R79D\",'+
		'                            \"ADDRESS3\": \"D7DD999998\",'+
		'                            \"ADDRESS2\": \"B997R0\",'+
		'                            \"STAY_IN_AREA_YEARS\": 45,'+
		'                            \"DESTINATION_ADDRESS\": \"N\",'+
		'                            \"GSTIN_NO\": \"\",'+
		'                            \"MAILING_ADDRESS\": \"N\",'+
		'                            \"EXT1\": \"\",'+
		'                            \"EXT2\": \"\",'+
		'                            \"COMPANY_NAME\": \"\",'+
		'                            \"OCCUPANCY_STATUS\": \"SELFOWNED\",'+
		'                            \"LANDMARK\": \"\",'+
		'                            \"CITY\": \"BANGALORE SOUTH\",'+
		'                            \"PHONE2\": 1000016201,'+
		'                            \"PHONE1\": 1000016201,'+
		'                            \"FAX\": \"\",'+
		'                            \"MOBILE\": 1000016202'+
		'                        }'+
		'                    ],'+
		'                    \"CUST_CATEGORY\": \"\",'+
		'                    \"ADHAAR_AS_KYC\": \"N\"'+
		'                },'+
		'                {'+
		'                    \"PAN_NUMBER\": \"D9BR7267F\",'+
		'                    \"LNAME\": \"R\",'+
		'                    \"MARITAL_STATUS\": \"MARRIED\",'+
		'                    \"ALIAS\": \"\",'+
		'                    \"REGISTRATION_NO\": \"\",'+
		'                    \"EDUCATIONAL_QUALIFICATION\": 1000000012,'+
		'                    \"DEPENDENTS\": 0,'+
		'                    \"NO_OF_DEPENDENTS\": \"\",'+
		'                    \"CUSTOMER_ENTITY_TYPE\": \"INDIVIDUAL\",'+
		'                    \"DNS_REASON\": \"\",'+
		'                    \"AUTHORIZED_CAPITAL\": \"\",'+
		'                    \"OTHERS_ID_NUMBER\": \"\",'+
		'                    \"APPLICANT_CODE\": \"CN0000000016277\",'+
		'                    \"SALUATION\": 1000000004,'+
		'                    \"FATHER_FNAME\": \"R080307\",'+
		'                    \"PSL\": \"Y\",'+
		'                    \"CIN\": \"\",'+
		'                    \"TYPE_OF_BUSINESS\": \"OTHER SERVICES\",'+
		'                    \"CONSTITUTION\": \"INDIVIDUAL\",'+
		'                    \"SPOUSE_MNAME\": \"\",'+
		'                    \"PASSPORTNO\": \"\",'+
		'                    \"FNAME\": \"R17500880\",'+
		'                    \"CLUSTERNAME\": \"E-COMMERCE\",'+
		'                    \"COMPANY_NAME\": \"\",'+
		'                    \"RELIGION\": \"HINDU\",'+
		'                    \"OTHER_NAME\": \"\",'+
		'                    \"TINNO\": 1000016202,'+
		'                    \"MNAME\": \"\",'+
		'                    \"SPOUSE_FNAME\": \"V1700T1S7\",'+
		'                    \"CLUSTER_DESCRIPTION\": \"\",'+
		'                    \"PREF_COMMUNICATION_MODE\": \"MOBILE\",'+
		'                    \"PREF_TIME_TO_CALL\": \"1:00 PM-2:00 PM\",'+
		'                    \"CKYC_ID\": \"\",'+
		'                    \"IS_PAN_AVAILABLE\": \"Y\",'+
		'                    \"KEY_CONTACT_PERSON\": \"\",'+
		'                    \"GENDER\": \"FEMALE\",'+
		'                    \"DRIVING_LICENCE_NO\": \"\",'+
		'                    \"FORM_60_NAME\": \"\",'+
		'                    \"UDYAM_REG_NO\": \"\",'+
		'                    \"FATHER_MNAME\": \"\",'+
		'                    \"SPOUSE_LNAME\": \"R\",'+
		'                    \"DNS_REQUIRED\": \"\",'+
		'                    \"DATE_OF_INCORPORATION\": \"01-01-1975\",'+
		'                    \"SEGMENT\": \"SERVICES\",'+
		'                    \"SOCIAL_CATEGORY\": \"GENERAL\",'+
		'                    \"RELATION\": \"SPOUSE\",'+
		'                    \"NAME_AS_PER_AADHAR\": \"R17500880 R\",'+
		'                    \"APPLICANT_TYPE\": \"CO-APPLICANT\",'+
		'                    \"FATHER_LNAME\": \"R\",'+
		'                    \"VOTER_ID\": \"\",'+
		'                    \"GROUP_NAME\": \"AMBT\",'+
		'                    \"CUSTOMER_CREDIT_INFO\": \"NEW TO CREDIT\",'+
		'                    \"DATEOFBIRTH\": \"01-01-75\",'+
		'                    \"ADDRESSDETAIL\": {'+
		'                        \"MOBILE2\": 1000016202,'+
		'                        \"ADDRESSTYPE\": \"RESIDENCE ADDRESS\",'+
		'                        \"STATE\": \"KARNATAKA\",'+
		'                        \"EMAIL\": \"T0ST012@0M9L9.COM\",'+
		'                        \"PINCODE\": 560083,'+
		'                        \"STAY_IN_AREA_MONTHS\": 5,'+
		'                        \"DISTRICT\": \"Bangalore Rural\",'+
		'                        \"GST_APPLICABLE\": \"N\",'+
		'                        \"ADDRESS1\": \"05 B90R69TT9 R79D\",'+
		'                        \"ADDRESS3\": \"D7DD9999 98\",'+
		'                        \"ADDRESS2\": \"B997R0\",'+
		'                        \"STAY_IN_AREA_YEARS\": 20,'+
		'                        \"DESTINATION_ADDRESS\": \"Y\",'+
		'                        \"GSTIN_NO\": \"\",'+
		'                        \"MAILING_ADDRESS\": \"Y\",'+
		'                        \"EXT1\": \"\",'+
		'                        \"EXT2\": \"\",'+
		'                        \"COMPANY_NAME\": \"\",'+
		'                        \"OCCUPANCY_STATUS\": \"\",'+
		'                        \"LANDMARK\": \"\",'+
		'                        \"CITY\": \"BANGALORE SOUTH\",'+
		'                        \"PHONE2\": 1000016202,'+
		'                        \"PHONE1\": 1000016202,'+
		'                        \"FAX\": \"\",'+
		'                        \"MOBILE\": 1000016203'+
		'                    },'+
		'                    \"CUST_CATEGORY\": \"\",'+
		'                    \"ADHAAR_AS_KYC\": \"Y\"'+
		'                }'+
		'            ],'+
		'            \"AFFORDABLE_EMI\": 108686,'+
		'            \"CUSTOMER_GROUP\": \"AMBT\",'+
		'            \"POS\": 3843867.66,'+
		'            \"CURRENTLY_ASSIGNED_TO\": \"\",'+
		'            \"DPD\": \"\",'+
		'            \"NO_OF_ADV_EMI\": 0,'+
		'            \"ELIGIBLE_LOAN_AMT_LTV\": 5702742.5,'+
		'            \"LAST_TRANCHE_DISBURSED\": \"ALL TRANCHES\",'+
		'            \"INT_RATE\": 14,'+
		'            \"CUST_ENTITYTYP_ENAME\": \"INDIVIDUAL\",'+
		'            \"SCHEME_NAME\": \"AMBIT VYAPAR-LAP against Multi Tenanted Properties\",'+
		'            \"BUSINESS_DATE\": \"15-12-21\",'+
		'            \"MATURITY_DATE\": \"05-06-2028\",'+
		'            \"DBR_PERCENTAGE\": 0,'+
		'            \"LOAN_AMOUNT\": 4256994,'+
		'            \"SCHEME\": \"AMBIT VYAPAR-LAP against Multi Tenanted Properties\",'+
		'            \"SANCTIONED_AMOUNT\": 4256994,'+
		'            \"LOANSUBSTATUSID\": \"DISBURSED\",'+
		'            \"NPA_STAGE\": \"SUB STANDARD\",'+
		'            \"ASSIGNED_DATE_TIME\": \"\",'+
		'            \"REPAYMENTSCH\": ['+
		'                {'+
		'                    \"CLOSING_PRIN\": 4168033.06,'+
		'                    \"DUE_DATE\": \"05-09-20\",'+
		'                    \"PRINCIPAL\": 25031.91,'+
		'                    \"INSTALLMENT_NO\": 15,'+
		'                    \"OPENING_PRIN\": 4193064.97,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48919.09'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4142709.11,'+
		'                    \"DUE_DATE\": \"05-10-20\",'+
		'                    \"PRINCIPAL\": 25323.95,'+
		'                    \"INSTALLMENT_NO\": 16,'+
		'                    \"OPENING_PRIN\": 4168033.06,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48627.05'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4117089.72,'+
		'                    \"DUE_DATE\": \"05-11-20\",'+
		'                    \"PRINCIPAL\": 25619.39,'+
		'                    \"INSTALLMENT_NO\": 17,'+
		'                    \"OPENING_PRIN\": 4142709.11,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48331.61'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4091171.43,'+
		'                    \"DUE_DATE\": \"05-12-20\",'+
		'                    \"PRINCIPAL\": 25918.29,'+
		'                    \"INSTALLMENT_NO\": 18,'+
		'                    \"OPENING_PRIN\": 4117089.72,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48032.71'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4064950.76,'+
		'                    \"DUE_DATE\": \"05-01-21\",'+
		'                    \"PRINCIPAL\": 26220.67,'+
		'                    \"INSTALLMENT_NO\": 19,'+
		'                    \"OPENING_PRIN\": 4091171.43,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 47730.33'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4038424.19,'+
		'                    \"DUE_DATE\": \"05-02-21\",'+
		'                    \"PRINCIPAL\": 26526.57,'+
		'                    \"INSTALLMENT_NO\": 20,'+
		'                    \"OPENING_PRIN\": 4064950.76,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 47424.43'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4011588.14,'+
		'                    \"DUE_DATE\": \"05-03-21\",'+
		'                    \"PRINCIPAL\": 26836.05,'+
		'                    \"INSTALLMENT_NO\": 21,'+
		'                    \"OPENING_PRIN\": 4038424.19,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 47114.95'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3984439,'+
		'                    \"DUE_DATE\": \"05-04-21\",'+
		'                    \"PRINCIPAL\": 27149.14,'+
		'                    \"INSTALLMENT_NO\": 22,'+
		'                    \"OPENING_PRIN\": 4011588.14,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 46801.86'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3956973.12,'+
		'                    \"DUE_DATE\": \"05-05-21\",'+
		'                    \"PRINCIPAL\": 27465.88,'+
		'                    \"INSTALLMENT_NO\": 23,'+
		'                    \"OPENING_PRIN\": 3984439,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 46485.12'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3929186.81,'+
		'                    \"DUE_DATE\": \"05-06-21\",'+
		'                    \"PRINCIPAL\": 27786.31,'+
		'                    \"INSTALLMENT_NO\": 24,'+
		'                    \"OPENING_PRIN\": 3956973.12,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 46164.69'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3901076.32,'+
		'                    \"DUE_DATE\": \"05-07-21\",'+
		'                    \"PRINCIPAL\": 28110.49,'+
		'                    \"INSTALLMENT_NO\": 25,'+
		'                    \"OPENING_PRIN\": 3929186.81,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 45840.51'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3872637.88,'+
		'                    \"DUE_DATE\": \"05-08-21\",'+
		'                    \"PRINCIPAL\": 28438.44,'+
		'                    \"INSTALLMENT_NO\": 26,'+
		'                    \"OPENING_PRIN\": 3901076.32,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 45512.56'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3843867.66,'+
		'                    \"DUE_DATE\": \"05-09-21\",'+
		'                    \"PRINCIPAL\": 28770.22,'+
		'                    \"INSTALLMENT_NO\": 27,'+
		'                    \"OPENING_PRIN\": 3872637.88,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 45180.78'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3814761.78,'+
		'                    \"DUE_DATE\": \"05-10-21\",'+
		'                    \"PRINCIPAL\": 29105.88,'+
		'                    \"INSTALLMENT_NO\": 28,'+
		'                    \"OPENING_PRIN\": 3843867.66,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 44845.12'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3785316.33,'+
		'                    \"DUE_DATE\": \"05-11-21\",'+
		'                    \"PRINCIPAL\": 29445.45,'+
		'                    \"INSTALLMENT_NO\": 29,'+
		'                    \"OPENING_PRIN\": 3814761.78,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 44505.55'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3755527.35,'+
		'                    \"DUE_DATE\": \"05-12-21\",'+
		'                    \"PRINCIPAL\": 29788.98,'+
		'                    \"INSTALLMENT_NO\": 30,'+
		'                    \"OPENING_PRIN\": 3785316.33,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 44162.02'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3725390.84,'+
		'                    \"DUE_DATE\": \"05-01-22\",'+
		'                    \"PRINCIPAL\": 30136.51,'+
		'                    \"INSTALLMENT_NO\": 31,'+
		'                    \"OPENING_PRIN\": 3755527.35,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 43814.49'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3694902.73,'+
		'                    \"DUE_DATE\": \"05-02-22\",'+
		'                    \"PRINCIPAL\": 30488.11,'+
		'                    \"INSTALLMENT_NO\": 32,'+
		'                    \"OPENING_PRIN\": 3725390.84,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 43462.89'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3664058.93,'+
		'                    \"DUE_DATE\": \"05-03-22\",'+
		'                    \"PRINCIPAL\": 30843.8,'+
		'                    \"INSTALLMENT_NO\": 33,'+
		'                    \"OPENING_PRIN\": 3694902.73,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 43107.2'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3632855.28,'+
		'                    \"DUE_DATE\": \"05-04-22\",'+
		'                    \"PRINCIPAL\": 31203.65,'+
		'                    \"INSTALLMENT_NO\": 34,'+
		'                    \"OPENING_PRIN\": 3664058.93,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 42747.35'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3601287.59,'+
		'                    \"DUE_DATE\": \"05-05-22\",'+
		'                    \"PRINCIPAL\": 31567.69,'+
		'                    \"INSTALLMENT_NO\": 35,'+
		'                    \"OPENING_PRIN\": 3632855.28,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 42383.31'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3569351.61,'+
		'                    \"DUE_DATE\": \"05-06-22\",'+
		'                    \"PRINCIPAL\": 31935.98,'+
		'                    \"INSTALLMENT_NO\": 36,'+
		'                    \"OPENING_PRIN\": 3601287.59,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 42015.02'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3537043.05,'+
		'                    \"DUE_DATE\": \"05-07-22\",'+
		'                    \"PRINCIPAL\": 32308.56,'+
		'                    \"INSTALLMENT_NO\": 37,'+
		'                    \"OPENING_PRIN\": 3569351.61,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 41642.44'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3504357.55,'+
		'                    \"DUE_DATE\": \"05-08-22\",'+
		'                    \"PRINCIPAL\": 32685.5,'+
		'                    \"INSTALLMENT_NO\": 38,'+
		'                    \"OPENING_PRIN\": 3537043.05,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 41265.5'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3471290.72,'+
		'                    \"DUE_DATE\": \"05-09-22\",'+
		'                    \"PRINCIPAL\": 33066.83,'+
		'                    \"INSTALLMENT_NO\": 39,'+
		'                    \"OPENING_PRIN\": 3504357.55,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 40884.17'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3437838.11,'+
		'                    \"DUE_DATE\": \"05-10-22\",'+
		'                    \"PRINCIPAL\": 33452.61,'+
		'                    \"INSTALLMENT_NO\": 40,'+
		'                    \"OPENING_PRIN\": 3471290.72,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 40498.39'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3403995.22,'+
		'                    \"DUE_DATE\": \"05-11-22\",'+
		'                    \"PRINCIPAL\": 33842.89,'+
		'                    \"INSTALLMENT_NO\": 41,'+
		'                    \"OPENING_PRIN\": 3437838.11,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 40108.11'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3369757.5,'+
		'                    \"DUE_DATE\": \"05-12-22\",'+
		'                    \"PRINCIPAL\": 34237.72,'+
		'                    \"INSTALLMENT_NO\": 42,'+
		'                    \"OPENING_PRIN\": 3403995.22,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 39713.28'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3335120.34,'+
		'                    \"DUE_DATE\": \"05-01-23\",'+
		'                    \"PRINCIPAL\": 34637.16,'+
		'                    \"INSTALLMENT_NO\": 43,'+
		'                    \"OPENING_PRIN\": 3369757.5,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 39313.84'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3300079.08,'+
		'                    \"DUE_DATE\": \"05-02-23\",'+
		'                    \"PRINCIPAL\": 35041.26,'+
		'                    \"INSTALLMENT_NO\": 44,'+
		'                    \"OPENING_PRIN\": 3335120.34,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 38909.74'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2324734.73,'+
		'                    \"DUE_DATE\": \"05-02-25\",'+
		'                    \"PRINCIPAL\": 46289.06,'+
		'                    \"INSTALLMENT_NO\": 68,'+
		'                    \"OPENING_PRIN\": 2371023.79,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 27661.94'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2277905.64,'+
		'                    \"DUE_DATE\": \"05-03-25\",'+
		'                    \"PRINCIPAL\": 46829.09,'+
		'                    \"INSTALLMENT_NO\": 69,'+
		'                    \"OPENING_PRIN\": 2324734.73,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 27121.91'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2230530.21,'+
		'                    \"DUE_DATE\": \"05-04-25\",'+
		'                    \"PRINCIPAL\": 47375.43,'+
		'                    \"INSTALLMENT_NO\": 70,'+
		'                    \"OPENING_PRIN\": 2277905.64,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 26575.57'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2182602.06,'+
		'                    \"DUE_DATE\": \"05-05-25\",'+
		'                    \"PRINCIPAL\": 47928.15,'+
		'                    \"INSTALLMENT_NO\": 71,'+
		'                    \"OPENING_PRIN\": 2230530.21,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 26022.85'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2134114.75,'+
		'                    \"DUE_DATE\": \"05-06-25\",'+
		'                    \"PRINCIPAL\": 48487.31,'+
		'                    \"INSTALLMENT_NO\": 72,'+
		'                    \"OPENING_PRIN\": 2182602.06,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 25463.69'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2085061.76,'+
		'                    \"DUE_DATE\": \"05-07-25\",'+
		'                    \"PRINCIPAL\": 49052.99,'+
		'                    \"INSTALLMENT_NO\": 73,'+
		'                    \"OPENING_PRIN\": 2134114.75,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 24898.01'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2035436.48,'+
		'                    \"DUE_DATE\": \"05-08-25\",'+
		'                    \"PRINCIPAL\": 49625.28,'+
		'                    \"INSTALLMENT_NO\": 74,'+
		'                    \"OPENING_PRIN\": 2085061.76,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 24325.72'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1985232.24,'+
		'                    \"DUE_DATE\": \"05-09-25\",'+
		'                    \"PRINCIPAL\": 50204.24,'+
		'                    \"INSTALLMENT_NO\": 75,'+
		'                    \"OPENING_PRIN\": 2035436.48,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 23746.76'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1934442.28,'+
		'                    \"DUE_DATE\": \"05-10-25\",'+
		'                    \"PRINCIPAL\": 50789.96,'+
		'                    \"INSTALLMENT_NO\": 76,'+
		'                    \"OPENING_PRIN\": 1985232.24,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 23161.04'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1883059.77,'+
		'                    \"DUE_DATE\": \"05-11-25\",'+
		'                    \"PRINCIPAL\": 51382.51,'+
		'                    \"INSTALLMENT_NO\": 77,'+
		'                    \"OPENING_PRIN\": 1934442.28,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 22568.49'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1831077.8,'+
		'                    \"DUE_DATE\": \"05-12-25\",'+
		'                    \"PRINCIPAL\": 51981.97,'+
		'                    \"INSTALLMENT_NO\": 78,'+
		'                    \"OPENING_PRIN\": 1883059.77,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 21969.03'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1778489.37,'+
		'                    \"DUE_DATE\": \"05-01-26\",'+
		'                    \"PRINCIPAL\": 52588.43,'+
		'                    \"INSTALLMENT_NO\": 79,'+
		'                    \"OPENING_PRIN\": 1831077.8,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 21362.57'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1725287.41,'+
		'                    \"DUE_DATE\": \"05-02-26\",'+
		'                    \"PRINCIPAL\": 53201.96,'+
		'                    \"INSTALLMENT_NO\": 80,'+
		'                    \"OPENING_PRIN\": 1778489.37,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 20749.04'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1671464.76,'+
		'                    \"DUE_DATE\": \"05-03-26\",'+
		'                    \"PRINCIPAL\": 53822.65,'+
		'                    \"INSTALLMENT_NO\": 81,'+
		'                    \"OPENING_PRIN\": 1725287.41,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 20128.35'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1617014.18,'+
		'                    \"DUE_DATE\": \"05-04-26\",'+
		'                    \"PRINCIPAL\": 54450.58,'+
		'                    \"INSTALLMENT_NO\": 82,'+
		'                    \"OPENING_PRIN\": 1671464.76,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 19500.42'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1561928.35,'+
		'                    \"DUE_DATE\": \"05-05-26\",'+
		'                    \"PRINCIPAL\": 55085.83,'+
		'                    \"INSTALLMENT_NO\": 83,'+
		'                    \"OPENING_PRIN\": 1617014.18,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 18865.17'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1506199.85,'+
		'                    \"DUE_DATE\": \"05-06-26\",'+
		'                    \"PRINCIPAL\": 55728.5,'+
		'                    \"INSTALLMENT_NO\": 84,'+
		'                    \"OPENING_PRIN\": 1561928.35,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 18222.5'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1449821.18,'+
		'                    \"DUE_DATE\": \"05-07-26\",'+
		'                    \"PRINCIPAL\": 56378.67,'+
		'                    \"INSTALLMENT_NO\": 85,'+
		'                    \"OPENING_PRIN\": 1506199.85,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 17572.33'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1392784.76,'+
		'                    \"DUE_DATE\": \"05-08-26\",'+
		'                    \"PRINCIPAL\": 57036.42,'+
		'                    \"INSTALLMENT_NO\": 86,'+
		'                    \"OPENING_PRIN\": 1449821.18,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 16914.58'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1335082.92,'+
		'                    \"DUE_DATE\": \"05-09-26\",'+
		'                    \"PRINCIPAL\": 57701.84,'+
		'                    \"INSTALLMENT_NO\": 87,'+
		'                    \"OPENING_PRIN\": 1392784.76,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 16249.16'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1276707.89,'+
		'                    \"DUE_DATE\": \"05-10-26\",'+
		'                    \"PRINCIPAL\": 58375.03,'+
		'                    \"INSTALLMENT_NO\": 88,'+
		'                    \"OPENING_PRIN\": 1335082.92,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 15575.97'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2371023.79,'+
		'                    \"DUE_DATE\": \"05-01-25\",'+
		'                    \"PRINCIPAL\": 45755.24,'+
		'                    \"INSTALLMENT_NO\": 67,'+
		'                    \"OPENING_PRIN\": 2416779.03,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 28195.76'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3264629,'+
		'                    \"DUE_DATE\": \"05-03-23\",'+
		'                    \"PRINCIPAL\": 35450.08,'+
		'                    \"INSTALLMENT_NO\": 45,'+
		'                    \"OPENING_PRIN\": 3300079.08,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 38500.92'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3228765.34,'+
		'                    \"DUE_DATE\": \"05-04-23\",'+
		'                    \"PRINCIPAL\": 35863.66,'+
		'                    \"INSTALLMENT_NO\": 46,'+
		'                    \"OPENING_PRIN\": 3264629,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 38087.34'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3192483.27,'+
		'                    \"DUE_DATE\": \"05-05-23\",'+
		'                    \"PRINCIPAL\": 36282.07,'+
		'                    \"INSTALLMENT_NO\": 47,'+
		'                    \"OPENING_PRIN\": 3228765.34,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 37668.93'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3155777.91,'+
		'                    \"DUE_DATE\": \"05-06-23\",'+
		'                    \"PRINCIPAL\": 36705.36,'+
		'                    \"INSTALLMENT_NO\": 48,'+
		'                    \"OPENING_PRIN\": 3192483.27,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 37245.64'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3118644.32,'+
		'                    \"DUE_DATE\": \"05-07-23\",'+
		'                    \"PRINCIPAL\": 37133.59,'+
		'                    \"INSTALLMENT_NO\": 49,'+
		'                    \"OPENING_PRIN\": 3155777.91,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 36817.41'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3081077.5,'+
		'                    \"DUE_DATE\": \"05-08-23\",'+
		'                    \"PRINCIPAL\": 37566.82,'+
		'                    \"INSTALLMENT_NO\": 50,'+
		'                    \"OPENING_PRIN\": 3118644.32,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 36384.18'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3043072.4,'+
		'                    \"DUE_DATE\": \"05-09-23\",'+
		'                    \"PRINCIPAL\": 38005.1,'+
		'                    \"INSTALLMENT_NO\": 51,'+
		'                    \"OPENING_PRIN\": 3081077.5,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 35945.9'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 3004623.91,'+
		'                    \"DUE_DATE\": \"05-10-23\",'+
		'                    \"PRINCIPAL\": 38448.49,'+
		'                    \"INSTALLMENT_NO\": 52,'+
		'                    \"OPENING_PRIN\": 3043072.4,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 35502.51'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2965726.86,'+
		'                    \"DUE_DATE\": \"05-11-23\",'+
		'                    \"PRINCIPAL\": 38897.05,'+
		'                    \"INSTALLMENT_NO\": 53,'+
		'                    \"OPENING_PRIN\": 3004623.91,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 35053.95'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2926376.01,'+
		'                    \"DUE_DATE\": \"05-12-23\",'+
		'                    \"PRINCIPAL\": 39350.85,'+
		'                    \"INSTALLMENT_NO\": 54,'+
		'                    \"OPENING_PRIN\": 2965726.86,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 34600.15'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2886566.06,'+
		'                    \"DUE_DATE\": \"05-01-24\",'+
		'                    \"PRINCIPAL\": 39809.95,'+
		'                    \"INSTALLMENT_NO\": 55,'+
		'                    \"OPENING_PRIN\": 2926376.01,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 34141.05'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2846291.66,'+
		'                    \"DUE_DATE\": \"05-02-24\",'+
		'                    \"PRINCIPAL\": 40274.4,'+
		'                    \"INSTALLMENT_NO\": 56,'+
		'                    \"OPENING_PRIN\": 2886566.06,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 33676.6'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2805547.4,'+
		'                    \"DUE_DATE\": \"05-03-24\",'+
		'                    \"PRINCIPAL\": 40744.26,'+
		'                    \"INSTALLMENT_NO\": 57,'+
		'                    \"OPENING_PRIN\": 2846291.66,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 33206.74'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2764327.79,'+
		'                    \"DUE_DATE\": \"05-04-24\",'+
		'                    \"PRINCIPAL\": 41219.61,'+
		'                    \"INSTALLMENT_NO\": 58,'+
		'                    \"OPENING_PRIN\": 2805547.4,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 32731.39'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2722627.28,'+
		'                    \"DUE_DATE\": \"05-05-24\",'+
		'                    \"PRINCIPAL\": 41700.51,'+
		'                    \"INSTALLMENT_NO\": 59,'+
		'                    \"OPENING_PRIN\": 2764327.79,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 32250.49'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2680440.27,'+
		'                    \"DUE_DATE\": \"05-06-24\",'+
		'                    \"PRINCIPAL\": 42187.01,'+
		'                    \"INSTALLMENT_NO\": 60,'+
		'                    \"OPENING_PRIN\": 2722627.28,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 31763.99'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2637761.07,'+
		'                    \"DUE_DATE\": \"05-07-24\",'+
		'                    \"PRINCIPAL\": 42679.2,'+
		'                    \"INSTALLMENT_NO\": 61,'+
		'                    \"OPENING_PRIN\": 2680440.27,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 31271.8'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2594583.95,'+
		'                    \"DUE_DATE\": \"05-08-24\",'+
		'                    \"PRINCIPAL\": 43177.12,'+
		'                    \"INSTALLMENT_NO\": 62,'+
		'                    \"OPENING_PRIN\": 2637761.07,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 30773.88'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2550903.1,'+
		'                    \"DUE_DATE\": \"05-09-24\",'+
		'                    \"PRINCIPAL\": 43680.85,'+
		'                    \"INSTALLMENT_NO\": 63,'+
		'                    \"OPENING_PRIN\": 2594583.95,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 30270.15'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2506712.64,'+
		'                    \"DUE_DATE\": \"05-10-24\",'+
		'                    \"PRINCIPAL\": 44190.46,'+
		'                    \"INSTALLMENT_NO\": 64,'+
		'                    \"OPENING_PRIN\": 2550903.1,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 29760.54'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2462006.62,'+
		'                    \"DUE_DATE\": \"05-11-24\",'+
		'                    \"PRINCIPAL\": 44706.02,'+
		'                    \"INSTALLMENT_NO\": 65,'+
		'                    \"OPENING_PRIN\": 2506712.64,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 29244.98'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 2416779.03,'+
		'                    \"DUE_DATE\": \"05-12-24\",'+
		'                    \"PRINCIPAL\": 45227.59,'+
		'                    \"INSTALLMENT_NO\": 66,'+
		'                    \"OPENING_PRIN\": 2462006.62,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 28723.41'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4232707.93,'+
		'                    \"DUE_DATE\": \"05-07-19\",'+
		'                    \"PRINCIPAL\": 24286.07,'+
		'                    \"INSTALLMENT_NO\": 1,'+
		'                    \"OPENING_PRIN\": 4256994,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 49664.93'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4208138.52,'+
		'                    \"DUE_DATE\": \"05-08-19\",'+
		'                    \"PRINCIPAL\": 24569.41,'+
		'                    \"INSTALLMENT_NO\": 2,'+
		'                    \"OPENING_PRIN\": 4232707.93,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 49381.59'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4183282.47,'+
		'                    \"DUE_DATE\": \"05-09-19\",'+
		'                    \"PRINCIPAL\": 24856.05,'+
		'                    \"INSTALLMENT_NO\": 3,'+
		'                    \"OPENING_PRIN\": 4208138.52,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 49094.95'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4158136.43,'+
		'                    \"DUE_DATE\": \"05-10-19\",'+
		'                    \"PRINCIPAL\": 25146.04,'+
		'                    \"INSTALLMENT_NO\": 4,'+
		'                    \"OPENING_PRIN\": 4183282.47,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48804.96'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4132697.02,'+
		'                    \"DUE_DATE\": \"05-11-19\",'+
		'                    \"PRINCIPAL\": 25439.41,'+
		'                    \"INSTALLMENT_NO\": 5,'+
		'                    \"OPENING_PRIN\": 4158136.43,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48511.59'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4106960.82,'+
		'                    \"DUE_DATE\": \"05-12-19\",'+
		'                    \"PRINCIPAL\": 25736.2,'+
		'                    \"INSTALLMENT_NO\": 6,'+
		'                    \"OPENING_PRIN\": 4132697.02,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48214.8'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4080924.36,'+
		'                    \"DUE_DATE\": \"05-01-20\",'+
		'                    \"PRINCIPAL\": 26036.46,'+
		'                    \"INSTALLMENT_NO\": 7,'+
		'                    \"OPENING_PRIN\": 4106960.82,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 47914.54'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4054584.14,'+
		'                    \"DUE_DATE\": \"05-02-20\",'+
		'                    \"PRINCIPAL\": 26340.22,'+
		'                    \"INSTALLMENT_NO\": 8,'+
		'                    \"OPENING_PRIN\": 4080924.36,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 47610.78'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4027936.62,'+
		'                    \"DUE_DATE\": \"05-03-20\",'+
		'                    \"PRINCIPAL\": 26647.52,'+
		'                    \"INSTALLMENT_NO\": 9,'+
		'                    \"OPENING_PRIN\": 4054584.14,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 47303.48'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4027936.62,'+
		'                    \"DUE_DATE\": \"05-04-20\",'+
		'                    \"PRINCIPAL\": 0,'+
		'                    \"INSTALLMENT_NO\": 10,'+
		'                    \"OPENING_PRIN\": 4027936.62,'+
		'                    \"EMI_AMT\": 0,'+
		'                    \"INTEREST\": 0'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4121921.8,'+
		'                    \"DUE_DATE\": \"05-05-20\",'+
		'                    \"PRINCIPAL\": 0,'+
		'                    \"INSTALLMENT_NO\": 11,'+
		'                    \"OPENING_PRIN\": 4027936.62,'+
		'                    \"EMI_AMT\": 0,'+
		'                    \"INTEREST\": 0'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4170010.89,'+
		'                    \"DUE_DATE\": \"05-06-20\",'+
		'                    \"PRINCIPAL\": 0,'+
		'                    \"INSTALLMENT_NO\": 12,'+
		'                    \"OPENING_PRIN\": 4121921.8,'+
		'                    \"EMI_AMT\": 0,'+
		'                    \"INTEREST\": 0'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4144710.02,'+
		'                    \"DUE_DATE\": \"05-07-20\",'+
		'                    \"PRINCIPAL\": 25300.87,'+
		'                    \"INSTALLMENT_NO\": 13,'+
		'                    \"OPENING_PRIN\": 4170010.89,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 48650.13'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 4193064.97,'+
		'                    \"DUE_DATE\": \"05-08-20\",'+
		'                    \"PRINCIPAL\": 0,'+
		'                    \"INSTALLMENT_NO\": 14,'+
		'                    \"OPENING_PRIN\": 4144710.02,'+
		'                    \"EMI_AMT\": 0,'+
		'                    \"INTEREST\": 0'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 654158.16,'+
		'                    \"DUE_DATE\": \"05-08-27\",'+
		'                    \"PRINCIPAL\": 65554.35,'+
		'                    \"INSTALLMENT_NO\": 98,'+
		'                    \"OPENING_PRIN\": 719712.51,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 8396.65'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 587839.01,'+
		'                    \"DUE_DATE\": \"05-09-27\",'+
		'                    \"PRINCIPAL\": 66319.15,'+
		'                    \"INSTALLMENT_NO\": 99,'+
		'                    \"OPENING_PRIN\": 654158.16,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 7631.85'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 520746.13,'+
		'                    \"DUE_DATE\": \"05-10-27\",'+
		'                    \"PRINCIPAL\": 67092.88,'+
		'                    \"INSTALLMENT_NO\": 100,'+
		'                    \"OPENING_PRIN\": 587839.01,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 6858.12'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 452870.5,'+
		'                    \"DUE_DATE\": \"05-11-27\",'+
		'                    \"PRINCIPAL\": 67875.63,'+
		'                    \"INSTALLMENT_NO\": 101,'+
		'                    \"OPENING_PRIN\": 520746.13,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 6075.37'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 384202.99,'+
		'                    \"DUE_DATE\": \"05-12-27\",'+
		'                    \"PRINCIPAL\": 68667.51,'+
		'                    \"INSTALLMENT_NO\": 102,'+
		'                    \"OPENING_PRIN\": 452870.5,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 5283.49'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 314734.36,'+
		'                    \"DUE_DATE\": \"05-01-28\",'+
		'                    \"PRINCIPAL\": 69468.63,'+
		'                    \"INSTALLMENT_NO\": 103,'+
		'                    \"OPENING_PRIN\": 384202.99,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 4482.37'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 244455.26,'+
		'                    \"DUE_DATE\": \"05-02-28\",'+
		'                    \"PRINCIPAL\": 70279.1,'+
		'                    \"INSTALLMENT_NO\": 104,'+
		'                    \"OPENING_PRIN\": 314734.36,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 3671.9'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 173356.24,'+
		'                    \"DUE_DATE\": \"05-03-28\",'+
		'                    \"PRINCIPAL\": 71099.02,'+
		'                    \"INSTALLMENT_NO\": 105,'+
		'                    \"OPENING_PRIN\": 244455.26,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 2851.98'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 101427.73,'+
		'                    \"DUE_DATE\": \"05-04-28\",'+
		'                    \"PRINCIPAL\": 71928.51,'+
		'                    \"INSTALLMENT_NO\": 106,'+
		'                    \"OPENING_PRIN\": 173356.24,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 2022.49'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 28660.05,'+
		'                    \"DUE_DATE\": \"05-05-28\",'+
		'                    \"PRINCIPAL\": 72767.68,'+
		'                    \"INSTALLMENT_NO\": 107,'+
		'                    \"OPENING_PRIN\": 101427.73,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 1183.32'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 0,'+
		'                    \"DUE_DATE\": \"05-06-28\",'+
		'                    \"PRINCIPAL\": 28660.05,'+
		'                    \"INSTALLMENT_NO\": 108,'+
		'                    \"OPENING_PRIN\": 28660.05,'+
		'                    \"EMI_AMT\": 28995,'+
		'                    \"INTEREST\": 334.95'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1157906.76,'+
		'                    \"DUE_DATE\": \"05-12-26\",'+
		'                    \"PRINCIPAL\": 59745.06,'+
		'                    \"INSTALLMENT_NO\": 90,'+
		'                    \"OPENING_PRIN\": 1217651.82,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 14205.94'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1097464.67,'+
		'                    \"DUE_DATE\": \"05-01-27\",'+
		'                    \"PRINCIPAL\": 60442.09,'+
		'                    \"INSTALLMENT_NO\": 91,'+
		'                    \"OPENING_PRIN\": 1157906.76,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 13508.91'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1036317.42,'+
		'                    \"DUE_DATE\": \"05-02-27\",'+
		'                    \"PRINCIPAL\": 61147.25,'+
		'                    \"INSTALLMENT_NO\": 92,'+
		'                    \"OPENING_PRIN\": 1097464.67,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 12803.75'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 974456.79,'+
		'                    \"DUE_DATE\": \"05-03-27\",'+
		'                    \"PRINCIPAL\": 61860.63,'+
		'                    \"INSTALLMENT_NO\": 93,'+
		'                    \"OPENING_PRIN\": 1036317.42,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 12090.37'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 911874.45,'+
		'                    \"DUE_DATE\": \"05-04-27\",'+
		'                    \"PRINCIPAL\": 62582.34,'+
		'                    \"INSTALLMENT_NO\": 94,'+
		'                    \"OPENING_PRIN\": 974456.79,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 11368.66'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 848561.99,'+
		'                    \"DUE_DATE\": \"05-05-27\",'+
		'                    \"PRINCIPAL\": 63312.46,'+
		'                    \"INSTALLMENT_NO\": 95,'+
		'                    \"OPENING_PRIN\": 911874.45,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 10638.54'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 784510.88,'+
		'                    \"DUE_DATE\": \"05-06-27\",'+
		'                    \"PRINCIPAL\": 64051.11,'+
		'                    \"INSTALLMENT_NO\": 96,'+
		'                    \"OPENING_PRIN\": 848561.99,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 9899.89'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 719712.51,'+
		'                    \"DUE_DATE\": \"05-07-27\",'+
		'                    \"PRINCIPAL\": 64798.37,'+
		'                    \"INSTALLMENT_NO\": 97,'+
		'                    \"OPENING_PRIN\": 784510.88,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 9152.63'+
		'                },'+
		'                {'+
		'                    \"CLOSING_PRIN\": 1217651.82,'+
		'                    \"DUE_DATE\": \"05-11-26\",'+
		'                    \"PRINCIPAL\": 59056.07,'+
		'                    \"INSTALLMENT_NO\": 89,'+
		'                    \"OPENING_PRIN\": 1276707.89,'+
		'                    \"EMI_AMT\": 73951,'+
		'                    \"INTEREST\": 14894.93'+
		'                }'+
		'            ],'+
		'            \"BRANCH\": \"BANGALORE\",'+
		'            \"TENOR\": 96,'+
		'            \"DISBURSAL_DATE\": \"31-MAY-2019\",'+
		'            \"TARGET_IRR\": \"\",'+
		'            \"CHARGEDETAIL\": ['+
		'                {'+
		'                    \"LOANCHARGEID\": 1000193431,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000193432,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000162989,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Login Fees\",'+
		'                    \"CHARGE_ID\": 1000002100'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000162990,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Processing Fee Pre-D\",'+
		'                    \"CHARGE_ID\": 1000000111'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000162991,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance EMI Charges\",'+
		'                    \"CHARGE_ID\": 1000010119'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000188532,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Cheque Swap\",'+
		'                    \"CHARGE_ID\": 1000002099'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000178307,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Admin Charges\",'+
		'                    \"CHARGE_ID\": 1000010171'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000177803,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Insurance Premium\",'+
		'                    \"CHARGE_ID\": 1000000200'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000165076,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"IMD\",'+
		'                    \"CHARGE_ID\": 1000000120'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000178324,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Pre EMI\",'+
		'                    \"CHARGE_ID\": 1000000109'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000178325,'+
		'                    \"CHARGE_NATURE\": 0,'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Disbursal Amount\",'+
		'                    \"CHARGE_ID\": 1000000003'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000203508,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000203509,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000214273,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000214274,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000225363,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000225364,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000236629,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000236630,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000247486,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000247487,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000251886,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 5521.77,'+
		'                    \"CHARGE_NAME\": \"Late Payment Interest\",'+
		'                    \"CHARGE_ID\": 1000000114'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000251887,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 7789.8,'+
		'                    \"CHARGE_NAME\": \"Late Payment Interest\",'+
		'                    \"CHARGE_ID\": 1000000114'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000250260,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000259901,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000259902,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000272476,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000272477,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000284268,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000284269,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000294178,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000294179,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000303324,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000303325,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000309785,'+
		'                    \"CHARGE_NATURE\": 0,'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"MORATORIUM ACCRUAL\",'+
		'                    \"CHARGE_ID\": 1000000029'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000317561,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000313584,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000313585,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000321146,'+
		'                    \"CHARGE_NATURE\": 0,'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"MORATORIUM ACCRUAL\",'+
		'                    \"CHARGE_ID\": 1000000029'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000325810,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000325811,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000338334,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000338335,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000342549,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000348420,'+
		'                    \"CHARGE_NATURE\": 0,'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"MORATORIUM ACCRUAL\",'+
		'                    \"CHARGE_ID\": 1000000029'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000352653,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000352654,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000366431,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000366432,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000382951,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000382952,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000396833,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Ex-gratia Payable\",'+
		'                    \"CHARGE_ID\": 1000010110'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000401990,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000401991,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000406081,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000421118,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000421119,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000428967,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000429728,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000444241,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000444242,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000451817,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000468351,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000468352,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000476274,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000535167,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000535168,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000517042,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000517043,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000496852,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000496853,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000525111,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000504031,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000557474,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000557475,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000565479,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 590,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000585668,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000585669,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000576913,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000543294,'+
		'                    \"CHARGE_NATURE\": \"PAYABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Advance Against EMI\",'+
		'                    \"CHARGE_ID\": 1000010104'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000632181,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 590,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000595738,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 590,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000617282,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000617283,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 0,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000653214,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 36339.11,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000653215,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 29105.88,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000698889,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 590,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000661900,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 590,'+
		'                    \"CHARGE_NAME\": \"Cheque Bounce\",'+
		'                    \"CHARGE_ID\": 1000000105'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000718426,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 44162.02,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000718427,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 29788.98,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000686091,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 44505.55,'+
		'                    \"CHARGE_NAME\": \"Interest\",'+
		'                    \"CHARGE_ID\": 1000000108'+
		'                },'+
		'                {'+
		'                    \"LOANCHARGEID\": 1000686092,'+
		'                    \"CHARGE_NATURE\": \"RECIEVABLE\",'+
		'                    \"CHARGE_BALANCE_AMOUNT\": 29445.45,'+
		'                    \"CHARGE_NAME\": \"Principal\",'+
		'                    \"CHARGE_ID\": 1000000107'+
		'                }'+
		'            ],'+
		'            \"ASSET_VALUE\": 8773450,'+
		'            \"NACH_DETAILS\": {'+
		'                \"NACH_BANK_MICR_CODE\": 560015362,'+
		'                \"NACH_BANK_BRANCH\": \"\",'+
		'                \"NACH_BANK_REJECT_REASON_CODE\": \"\",'+
		'                \"NACH_BANK_IFSC_CODE\": \"CNRB0010683\",'+
		'                \"NACH_BANK_NAME\": \"CANARA BANK\",'+
		'                \"NACH_BANK_NACH_STATUS\": 1000000003,'+
		'                \"NACH_BANK_REMARKS\": \"AU Ambit Migration\",'+
		'                \"NACH_BANK_ACCOUNT_NUM\": 6832010013625,'+
		'                \"NACH_BANK_UMRN\": \"SYNB0000000003226275\",'+
		'                \"NACH_BANK_ACCOUNT_TYPE\": \"SAVING ACCOUNT\"'+
		'            },'+
		'            \"MAX_LTV_PERCENTAGE\": 65,'+
		'            \"TENOR_DAYS\": 0,'+
		'            \"PRE_EMI_AMT\": 73951,'+
		'            \"INST_TYPE\": \"EQUAL STRUCTURED INSTALLMENTS\",'+
		'            \"LTV_PERCENTAGE\": 48.52,'+
		'            \"CUSTOMER_NAME\": \"V1700T1S7  R\",'+
		'            \"DPD_STRING\": \"0|0|0|0|0|0|0|0|0|25|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|25|55|55|55\",'+
		'            \"REPAYMENT_FREQUENCY\": \"MONTHLY\",'+
		'            \"LOAN_STATUS\": \"DISBURSED\",'+
		'            \"APPLICATION_DATE\": \"11-APR-2019\",'+
		'            \"EMI_START_DATE\": \"05-JUL-2019\",'+
		'            \"DISBAMT\": 4256994,'+
		'            \"SANCTION_DATE\": \"31-05-19\",'+
		'            \"LOAN_ACTIVITY\": ['+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 0,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"11-APR-2019 13:36:43\",'+
		'                    \"ACTIVITYNAME\": \"LOAN\",'+
		'                    \"UPDATEDBY\": 1222004,'+
		'                    \"UPDATEDDATE\": \"11-APR-2019\",'+
		'                    \"ACTIVITYID\": 1100106701,'+
		'                    \"ACTIONID\": 1000000005'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 1,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"30-APR-2019 13:46:16\",'+
		'                    \"ACTIVITYNAME\": \"APPLICANT\",'+
		'                    \"UPDATEDBY\": 1422001,'+
		'                    \"UPDATEDDATE\": \"30-APR-2019\",'+
		'                    \"ACTIVITYID\": 1100106706,'+
		'                    \"ACTIONID\": 1000000079'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 2,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"27-MAY-2019 17:26:35\",'+
		'                    \"ACTIVITYNAME\": \"DEDUPE\",'+
		'                    \"UPDATEDBY\": 1422001,'+
		'                    \"UPDATEDDATE\": \"27-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106707,'+
		'                    \"ACTIONID\": 1000000080'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 3,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"30-APR-2019 13:47:07\",'+
		'                    \"ACTIVITYNAME\": \"VERIF\",'+
		'                    \"UPDATEDBY\": 1422001,'+
		'                    \"UPDATEDDATE\": \"30-APR-2019\",'+
		'                    \"ACTIVITYID\": 1100106710,'+
		'                    \"ACTIONID\": 1000000083'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 4,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"30-MAY-2019 19:36:14\",'+
		'                    \"ACTIVITYNAME\": \"ASSET DETAIL\",'+
		'                    \"UPDATEDBY\": 1422002,'+
		'                    \"UPDATEDDATE\": \"30-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106725,'+
		'                    \"ACTIONID\": 1000001502'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 5,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"30-MAY-2019 19:38:48\",'+
		'                    \"ACTIVITYNAME\": \"LOAN DETAIL\",'+
		'                    \"UPDATEDBY\": 1222004,'+
		'                    \"UPDATEDDATE\": \"30-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106705,'+
		'                    \"ACTIONID\": 1000000078'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 7,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"31-MAY-2019 20:28:34\",'+
		'                    \"ACTIVITYNAME\": \"CR DECISION\",'+
		'                    \"UPDATEDBY\": 1410023,'+
		'                    \"UPDATEDDATE\": \"31-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106713,'+
		'                    \"ACTIONID\": 1000000086'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 8,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"31-MAY-2019 22:54:37\",'+
		'                    \"ACTIVITYNAME\": \"CASH FLOW\",'+
		'                    \"UPDATEDBY\": 1310008,'+
		'                    \"UPDATEDDATE\": \"31-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106708,'+
		'                    \"ACTIONID\": 1000000081'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 10,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"\",'+
		'                    \"ACTIVITYNAME\": \"DOCUMENT\",'+
		'                    \"UPDATEDBY\": \"\",'+
		'                    \"UPDATEDDATE\": \"\",'+
		'                    \"ACTIVITYID\": 1100106709,'+
		'                    \"ACTIONID\": 1000000082'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 11,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"31-MAY-2019 23:00:31\",'+
		'                    \"ACTIVITYNAME\": \"DISB MAKER\",'+
		'                    \"UPDATEDBY\": 1310008,'+
		'                    \"UPDATEDDATE\": \"31-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106714,'+
		'                    \"ACTIONID\": 1000000087'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 12,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"31-MAY-2019 23:14:31\",'+
		'                    \"ACTIVITYNAME\": \"DISB AUTHOR\",'+
		'                    \"UPDATEDBY\": 1030100002,'+
		'                    \"UPDATEDDATE\": \"31-MAY-2019\",'+
		'                    \"ACTIVITYID\": 1100106715,'+
		'                    \"ACTIONID\": 1000000088'+
		'                },'+
		'                {'+
		'                    \"STATUSNAME\": \"FROZEN\",'+
		'                    \"SEQNO\": 17,'+
		'                    \"STATUS\": \"\",'+
		'                    \"UPDATEDDATETIME\": \"20-APR-2019 15:44:19\",'+
		'                    \"ACTIVITYNAME\": \"IMD\",'+
		'                    \"UPDATEDBY\": 1041100002,'+
		'                    \"UPDATEDDATE\": \"20-APR-2019\",'+
		'                    \"ACTIVITYID\": 1100106703,'+
		'                    \"ACTIONID\": 1000000044'+
		'                }'+
		'            ]'+
		'        }'+
		'    }'+
		'}';
		Loan_Detail_Response_sync_parse r = Loan_Detail_Response_sync_parse.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.LOAN_DETAIL_Z objLOAN_DETAIL_Z = new Loan_Detail_Response_sync_parse.LOAN_DETAIL_Z(System.JSON.createParser(json));
		System.assert(objLOAN_DETAIL_Z != null);
		System.assert(objLOAN_DETAIL_Z.LOAN_DETAIL == null);

		/*json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.Loan_Detail_Response_sync_parse objLoan_Detail_Response_sync_parse = new Loan_Detail_Response_sync_parse.Loan_Detail_Response_sync_parse(System.JSON.createParser(json));
		System.assert(objLoan_Detail_Response_sync_parse != null);
		System.assert(objLoan_Detail_Response_sync_parse.STATUS == null);
		System.assert(objLoan_Detail_Response_sync_parse.MESSAGE == null);
		System.assert(objLoan_Detail_Response_sync_parse.LOAN_DETAIL == null);*/

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.DISBURSEMENT_DETAIL objDISBURSEMENT_DETAIL = new Loan_Detail_Response_sync_parse.DISBURSEMENT_DETAIL(System.JSON.createParser(json));
		System.assert(objDISBURSEMENT_DETAIL != null);
		System.assert(objDISBURSEMENT_DETAIL.BRANCH == null);
		System.assert(objDISBURSEMENT_DETAIL.INSTRUMENT_TYPE == null);
		System.assert(objDISBURSEMENT_DETAIL.BANK == null);
		System.assert(objDISBURSEMENT_DETAIL.DISB_PAYMT_ACCOUNT_NUM == null);
		System.assert(objDISBURSEMENT_DETAIL.ACCOUNT_TYPE == null);
		System.assert(objDISBURSEMENT_DETAIL.APPLICANT_NAME == null);
		System.assert(objDISBURSEMENT_DETAIL.DISB_PAYMT_INST_DATE == null);
		System.assert(objDISBURSEMENT_DETAIL.APPLICANT_TYPE == null);
		System.assert(objDISBURSEMENT_DETAIL.CUSTOMER_ID == null);
		System.assert(objDISBURSEMENT_DETAIL.DISB_PAYMT_AMT == null);
		System.assert(objDISBURSEMENT_DETAIL.DISB_PAYMT_BANK == null);
		System.assert(objDISBURSEMENT_DETAIL.DISB_PAYMT_BRANCH == null);
		System.assert(objDISBURSEMENT_DETAIL.ACCOUNT == null);
		System.assert(objDISBURSEMENT_DETAIL.IFSC_CODE == null);
		System.assert(objDISBURSEMENT_DETAIL.MICR_CODE == null);
		System.assert(objDISBURSEMENT_DETAIL.DISB_PAYMT_INST_NUM == null);
		System.assert(objDISBURSEMENT_DETAIL.BENEFICIARY_NAME == null);
		System.assert(objDISBURSEMENT_DETAIL.DISBURSED_AMT == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.PDC_DETAILS objPDC_DETAILS = new Loan_Detail_Response_sync_parse.PDC_DETAILS(System.JSON.createParser(json));
		System.assert(objPDC_DETAILS != null);
		System.assert(objPDC_DETAILS.FUTURE_INSTRUMENT_COUNTS == null);
		System.assert(objPDC_DETAILS.SECURITY_PDC_COUNTS == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.ADDRESSDETAIL objADDRESSDETAIL = new Loan_Detail_Response_sync_parse.ADDRESSDETAIL(System.JSON.createParser(json));
		System.assert(objADDRESSDETAIL != null);
		System.assert(objADDRESSDETAIL.MOBILE2 == null);
		System.assert(objADDRESSDETAIL.ADDRESSTYPE == null);
		System.assert(objADDRESSDETAIL.STATE == null);
		System.assert(objADDRESSDETAIL.EMAIL == null);
		System.assert(objADDRESSDETAIL.PINCODE == null);
		System.assert(objADDRESSDETAIL.STAY_IN_AREA_MONTHS == null);
		System.assert(objADDRESSDETAIL.DISTRICT == null);
		System.assert(objADDRESSDETAIL.GST_APPLICABLE == null);
		System.assert(objADDRESSDETAIL.ADDRESS1 == null);
		System.assert(objADDRESSDETAIL.ADDRESS3 == null);
		System.assert(objADDRESSDETAIL.ADDRESS2 == null);
		System.assert(objADDRESSDETAIL.STAY_IN_AREA_YEARS == null);
		System.assert(objADDRESSDETAIL.DESTINATION_ADDRESS == null);
		System.assert(objADDRESSDETAIL.GSTIN_NO == null);
		System.assert(objADDRESSDETAIL.MAILING_ADDRESS == null);
		System.assert(objADDRESSDETAIL.EXT1 == null);
		System.assert(objADDRESSDETAIL.EXT2 == null);
		System.assert(objADDRESSDETAIL.COMPANY_NAME == null);
		System.assert(objADDRESSDETAIL.OCCUPANCY_STATUS == null);
		System.assert(objADDRESSDETAIL.LANDMARK == null);
		System.assert(objADDRESSDETAIL.CITY == null);
		System.assert(objADDRESSDETAIL.PHONE2 == null);
		System.assert(objADDRESSDETAIL.PHONE1 == null);
		System.assert(objADDRESSDETAIL.FAX == null);
		System.assert(objADDRESSDETAIL.MOBILE == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.CHARGEDETAIL objCHARGEDETAIL = new Loan_Detail_Response_sync_parse.CHARGEDETAIL(System.JSON.createParser(json));
		System.assert(objCHARGEDETAIL != null);
		System.assert(objCHARGEDETAIL.LOANCHARGEID == null);
		System.assert(objCHARGEDETAIL.CHARGE_NATURE == null);
		System.assert(objCHARGEDETAIL.CHARGE_BALANCE_AMOUNT == null);
		System.assert(objCHARGEDETAIL.CHARGE_NAME == null);
		System.assert(objCHARGEDETAIL.CHARGE_ID == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.NACH_DETAILS objNACH_DETAILS = new Loan_Detail_Response_sync_parse.NACH_DETAILS(System.JSON.createParser(json));
		System.assert(objNACH_DETAILS != null);
		System.assert(objNACH_DETAILS.NACH_BANK_MICR_CODE == null);
		System.assert(objNACH_DETAILS.NACH_BANK_BRANCH == null);
		System.assert(objNACH_DETAILS.NACH_BANK_REJECT_REASON_CODE == null);
		System.assert(objNACH_DETAILS.NACH_BANK_IFSC_CODE == null);
		System.assert(objNACH_DETAILS.NACH_BANK_NAME == null);
		System.assert(objNACH_DETAILS.NACH_BANK_NACH_STATUS == null);
		System.assert(objNACH_DETAILS.NACH_BANK_REMARKS == null);
		System.assert(objNACH_DETAILS.NACH_BANK_ACCOUNT_NUM == null);
		System.assert(objNACH_DETAILS.NACH_BANK_UMRN == null);
		System.assert(objNACH_DETAILS.NACH_BANK_ACCOUNT_TYPE == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.PDD_DOCUMENT objPDD_DOCUMENT = new Loan_Detail_Response_sync_parse.PDD_DOCUMENT(System.JSON.createParser(json));
		System.assert(objPDD_DOCUMENT != null);
		System.assert(objPDD_DOCUMENT.CREATED_BY == null);
		System.assert(objPDD_DOCUMENT.DOCUMENT_COPY == null);
		System.assert(objPDD_DOCUMENT.CREATED_DATE == null);
		System.assert(objPDD_DOCUMENT.APPLICANT_TYPE == null);
		System.assert(objPDD_DOCUMENT.DOCUMENT_DESC == null);
		System.assert(objPDD_DOCUMENT.EXPIRY_DATE == null);
		System.assert(objPDD_DOCUMENT.DOCUMENT_NAME == null);
		System.assert(objPDD_DOCUMENT.STATUS == null);
		System.assert(objPDD_DOCUMENT.LAST_UPD_DATE == null);
		System.assert(objPDD_DOCUMENT.OSV == null);
		System.assert(objPDD_DOCUMENT.TARGET_DATE == null);
		System.assert(objPDD_DOCUMENT.CUSTOMER_NAME == null);
		System.assert(objPDD_DOCUMENT.RECEIVED_DATE == null);
		System.assert(objPDD_DOCUMENT.LAST_UPD_BY == null);
		System.assert(objPDD_DOCUMENT.DOCUMENT_TYPE == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.LOAN_DETAIL objLOAN_DETAIL = new Loan_Detail_Response_sync_parse.LOAN_DETAIL(System.JSON.createParser(json));
		System.assert(objLOAN_DETAIL != null);
		System.assert(objLOAN_DETAIL.INC_METHOD == null);
		System.assert(objLOAN_DETAIL.INTTYPE == null);
		System.assert(objLOAN_DETAIL.PROSPECT_CODE == null);
		System.assert(objLOAN_DETAIL.ADV_INST == null);
		System.assert(objLOAN_DETAIL.PDD_DOCUMENT == null);
		System.assert(objLOAN_DETAIL.FORM_NUMBER == null);
		System.assert(objLOAN_DETAIL.TENOR_MONTHS == null);
		System.assert(objLOAN_DETAIL.REPAYMENT_MODE == null);
		System.assert(objLOAN_DETAIL.MAX_FOIR_PERCENTAGE == null);
		System.assert(objLOAN_DETAIL.MORATORIUM_PERIOD_MON == null);
		System.assert(objLOAN_DETAIL.UNBILLED_PRINCIPAL == null);
		System.assert(objLOAN_DETAIL.PRE_EMI_DATE == null);
		System.assert(objLOAN_DETAIL.ADV_EMI_AMT == null);
		System.assert(objLOAN_DETAIL.DISB_AMT == null);
		System.assert(objLOAN_DETAIL.INSTL_NO == null);
		System.assert(objLOAN_DETAIL.EMI == null);
		System.assert(objLOAN_DETAIL.INSTTYPEID == null);
		System.assert(objLOAN_DETAIL.EFFEECTIVE_RATE == null);
		System.assert(objLOAN_DETAIL.APPLICANT_CODE == null);
		System.assert(objLOAN_DETAIL.DISBURSEMENT_DETAIL == null);
		System.assert(objLOAN_DETAIL.PDC_DETAILS == null);
		System.assert(objLOAN_DETAIL.ELIGIBLELOANAMT == null);
		System.assert(objLOAN_DETAIL.PRODUCT_NAME == null);
		//System.assert(objLOAN_DETAIL.CUSTOMER_DETAIL == null);
		System.assert(objLOAN_DETAIL.AFFORDABLE_EMI == null);
		System.assert(objLOAN_DETAIL.CUSTOMER_GROUP == null);
		System.assert(objLOAN_DETAIL.POS == null);
		System.assert(objLOAN_DETAIL.CURRENTLY_ASSIGNED_TO == null);
		System.assert(objLOAN_DETAIL.DPD == null);
		System.assert(objLOAN_DETAIL.NO_OF_ADV_EMI == null);
		System.assert(objLOAN_DETAIL.ELIGIBLE_LOAN_AMT_LTV == null);
		System.assert(objLOAN_DETAIL.LAST_TRANCHE_DISBURSED == null);
		System.assert(objLOAN_DETAIL.INT_RATE == null);
		System.assert(objLOAN_DETAIL.CUST_ENTITYTYP_ENAME == null);
		System.assert(objLOAN_DETAIL.SCHEME_NAME == null);
		System.assert(objLOAN_DETAIL.BUSINESS_DATE == null);
		System.assert(objLOAN_DETAIL.MATURITY_DATE == null);
		System.assert(objLOAN_DETAIL.DBR_PERCENTAGE == null);
		System.assert(objLOAN_DETAIL.LOAN_AMOUNT == null);
		System.assert(objLOAN_DETAIL.SCHEME == null);
		System.assert(objLOAN_DETAIL.SANCTIONED_AMOUNT == null);
		System.assert(objLOAN_DETAIL.LOANSUBSTATUSID == null);
		System.assert(objLOAN_DETAIL.NPA_STAGE == null);
		System.assert(objLOAN_DETAIL.ASSIGNED_DATE_TIME == null);
		System.assert(objLOAN_DETAIL.REPAYMENTSCH == null);
		System.assert(objLOAN_DETAIL.BRANCH == null);
		System.assert(objLOAN_DETAIL.TENOR == null);
		System.assert(objLOAN_DETAIL.DISBURSAL_DATE == null);
		System.assert(objLOAN_DETAIL.TARGET_IRR == null);
		System.assert(objLOAN_DETAIL.CHARGEDETAIL == null);
		System.assert(objLOAN_DETAIL.ASSET_VALUE == null);
		System.assert(objLOAN_DETAIL.NACH_DETAILS == null);
		System.assert(objLOAN_DETAIL.MAX_LTV_PERCENTAGE == null);
		System.assert(objLOAN_DETAIL.TENOR_DAYS == null);
		System.assert(objLOAN_DETAIL.PRE_EMI_AMT == null);
		System.assert(objLOAN_DETAIL.INST_TYPE == null);
		System.assert(objLOAN_DETAIL.LTV_PERCENTAGE == null);
		System.assert(objLOAN_DETAIL.CUSTOMER_NAME == null);
		System.assert(objLOAN_DETAIL.DPD_STRING == null);
		System.assert(objLOAN_DETAIL.REPAYMENT_FREQUENCY == null);
		System.assert(objLOAN_DETAIL.LOAN_STATUS == null);
		System.assert(objLOAN_DETAIL.APPLICATION_DATE == null);
		System.assert(objLOAN_DETAIL.EMI_START_DATE == null);
		System.assert(objLOAN_DETAIL.DISBAMT == null);
		System.assert(objLOAN_DETAIL.SANCTION_DATE == null);
		System.assert(objLOAN_DETAIL.LOAN_ACTIVITY == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.CUSTOMER_DETAIL objCUSTOMER_DETAIL = new Loan_Detail_Response_sync_parse.CUSTOMER_DETAIL(System.JSON.createParser(json));
		System.assert(objCUSTOMER_DETAIL != null);
		System.assert(objCUSTOMER_DETAIL.PAN_NUMBER == null);
		System.assert(objCUSTOMER_DETAIL.LNAME == null);
		System.assert(objCUSTOMER_DETAIL.MARITAL_STATUS == null);
		System.assert(objCUSTOMER_DETAIL.ALIAS == null);
		System.assert(objCUSTOMER_DETAIL.REGISTRATION_NO == null);
		System.assert(objCUSTOMER_DETAIL.EDUCATIONAL_QUALIFICATION == null);
		System.assert(objCUSTOMER_DETAIL.DEPENDENTS == null);
		System.assert(objCUSTOMER_DETAIL.NO_OF_DEPENDENTS == null);
		System.assert(objCUSTOMER_DETAIL.CUSTOMER_ENTITY_TYPE == null);
		System.assert(objCUSTOMER_DETAIL.DNS_REASON == null);
		System.assert(objCUSTOMER_DETAIL.AUTHORIZED_CAPITAL == null);
		System.assert(objCUSTOMER_DETAIL.OTHERS_ID_NUMBER == null);
		System.assert(objCUSTOMER_DETAIL.APPLICANT_CODE == null);
		System.assert(objCUSTOMER_DETAIL.SALUATION == null);
		System.assert(objCUSTOMER_DETAIL.FATHER_FNAME == null);
		System.assert(objCUSTOMER_DETAIL.PSL == null);
		System.assert(objCUSTOMER_DETAIL.CIN == null);
		System.assert(objCUSTOMER_DETAIL.TYPE_OF_BUSINESS == null);
		System.assert(objCUSTOMER_DETAIL.CONSTITUTION == null);
		System.assert(objCUSTOMER_DETAIL.SPOUSE_MNAME == null);
		System.assert(objCUSTOMER_DETAIL.PASSPORTNO == null);
		System.assert(objCUSTOMER_DETAIL.FNAME == null);
		System.assert(objCUSTOMER_DETAIL.CLUSTERNAME == null);
		System.assert(objCUSTOMER_DETAIL.COMPANY_NAME == null);
		System.assert(objCUSTOMER_DETAIL.RELIGION == null);
		System.assert(objCUSTOMER_DETAIL.OTHER_NAME == null);
		System.assert(objCUSTOMER_DETAIL.TINNO == null);
		System.assert(objCUSTOMER_DETAIL.MNAME == null);
		System.assert(objCUSTOMER_DETAIL.SPOUSE_FNAME == null);
		System.assert(objCUSTOMER_DETAIL.CLUSTER_DESCRIPTION == null);
		System.assert(objCUSTOMER_DETAIL.PREF_COMMUNICATION_MODE == null);
		System.assert(objCUSTOMER_DETAIL.PREF_TIME_TO_CALL == null);
		System.assert(objCUSTOMER_DETAIL.CKYC_ID == null);
		System.assert(objCUSTOMER_DETAIL.IS_PAN_AVAILABLE == null);
		System.assert(objCUSTOMER_DETAIL.KEY_CONTACT_PERSON == null);
		System.assert(objCUSTOMER_DETAIL.GENDER == null);
		System.assert(objCUSTOMER_DETAIL.DRIVING_LICENCE_NO == null);
		System.assert(objCUSTOMER_DETAIL.FORM_60_NAME == null);
		System.assert(objCUSTOMER_DETAIL.UDYAM_REG_NO == null);
		System.assert(objCUSTOMER_DETAIL.FATHER_MNAME == null);
		System.assert(objCUSTOMER_DETAIL.SPOUSE_LNAME == null);
		System.assert(objCUSTOMER_DETAIL.DNS_REQUIRED == null);
		System.assert(objCUSTOMER_DETAIL.DATE_OF_INCORPORATION == null);
		System.assert(objCUSTOMER_DETAIL.SEGMENT == null);
		System.assert(objCUSTOMER_DETAIL.SOCIAL_CATEGORY == null);
		System.assert(objCUSTOMER_DETAIL.RELATION == null);
		System.assert(objCUSTOMER_DETAIL.NAME_AS_PER_AADHAR == null);
		System.assert(objCUSTOMER_DETAIL.APPLICANT_TYPE == null);
		System.assert(objCUSTOMER_DETAIL.FATHER_LNAME == null);
		System.assert(objCUSTOMER_DETAIL.VOTER_ID == null);
		System.assert(objCUSTOMER_DETAIL.GROUP_NAME == null);
		System.assert(objCUSTOMER_DETAIL.CUSTOMER_CREDIT_INFO == null);
		System.assert(objCUSTOMER_DETAIL.DATEOFBIRTH == null);
		System.assert(objCUSTOMER_DETAIL.ADDRESSDETAIL == null);
		System.assert(objCUSTOMER_DETAIL.CUST_CATEGORY == null);
		System.assert(objCUSTOMER_DETAIL.ADHAAR_AS_KYC == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.REPAYMENTSCH objREPAYMENTSCH = new Loan_Detail_Response_sync_parse.REPAYMENTSCH(System.JSON.createParser(json));
		System.assert(objREPAYMENTSCH != null);
		System.assert(objREPAYMENTSCH.CLOSING_PRIN == null);
		System.assert(objREPAYMENTSCH.DUE_DATE == null);
		System.assert(objREPAYMENTSCH.PRINCIPAL == null);
		System.assert(objREPAYMENTSCH.INSTALLMENT_NO == null);
		System.assert(objREPAYMENTSCH.OPENING_PRIN == null);
		System.assert(objREPAYMENTSCH.EMI_AMT == null);
		System.assert(objREPAYMENTSCH.INTEREST == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		Loan_Detail_Response_sync_parse.LOAN_ACTIVITY objLOAN_ACTIVITY = new Loan_Detail_Response_sync_parse.LOAN_ACTIVITY(System.JSON.createParser(json));
		System.assert(objLOAN_ACTIVITY != null);
		System.assert(objLOAN_ACTIVITY.STATUSNAME == null);
		System.assert(objLOAN_ACTIVITY.SEQNO == null);
		System.assert(objLOAN_ACTIVITY.STATUS == null);
		System.assert(objLOAN_ACTIVITY.UPDATEDDATETIME == null);
		System.assert(objLOAN_ACTIVITY.ACTIVITYNAME == null);
		System.assert(objLOAN_ACTIVITY.UPDATEDBY == null);
		System.assert(objLOAN_ACTIVITY.UPDATEDDATE == null);
		System.assert(objLOAN_ACTIVITY.ACTIVITYID == null);
		System.assert(objLOAN_ACTIVITY.ACTIONID == null);
	}
}