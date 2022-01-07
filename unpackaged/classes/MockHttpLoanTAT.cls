@istest

Global class MockHttpLoanTAT implements HttpCalloutMock{
    
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint and method.
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json'); 
        res.setBody('{'+
		'    \"STATUS\": \"S\",'+
		'    \"MESSAGE\": \"SUCCESS\",'+
		'    \"LOAN_DETAIL\": {'+
		'        \"LOAN_DETAIL\": {'+
		'            \"INC_METHOD\": \"BUSINESS\",'+
		'            \"INTTYPE\": \"\",'+
		'            \"ADV_INST\": 0,'+
		'            \"FORM_NUMBER\": 36547,'+
		'            \"MAX_FOIR_PERCENTAGE\": \"\",'+
		'            \"DISB_MK_SEND_BACK_END_DATE_TIME\": \"\",'+
		'            \"MORATORIUM_PERIOD_MON\": 0,'+
		'            \"PRE_EMI_DATE\": \"\",'+
		'            \"INSTL_NO\": 121,'+
		'            \"DEDUPEDETAIL\": ['+
		'                {'+
		'                    \"APPLICANT_CODE\": \"CN0000000048744\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"START_DATE_TIME\": \"01-MAR-21\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                },'+
		'                {'+
		'                    \"APPLICANT_CODE\": \"CN0000000048748\",'+
		'                    \"APPLICANT_TYPE\": \"CO-APPLICANT\",'+
		'                    \"START_DATE_TIME\": \"20-FEB-08\",'+
		'                    \"END_DATE_TIME\": \"20-FEB-08\"'+
		'                }'+
		'            ],'+
		'            \"EFFEECTIVE_RATE\": \"\",'+
		'            \"INSTTYPEID\": 1000000011,'+
		'            \"N0_OF_ADV_EMI\": \"\",'+
		'            \"CREDIT_DECISION_USER\": {'+
		'                \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                \"ASSIGNED_TO\": \"\",'+
		'                \"END_DATE_TIME\": \"10-MAR-21\"'+
		'            },'+
		'            \"DISB_MK_END_DATE_TIME\": \"\",'+
		'            \"POS\": \"\",'+
		'            \"LOGIN_TO_FINAL_SANCTION\": \"\",'+
		'            \"REJECT_DATE\": \"\",'+
		'            \"FIRST_DISB_START_DATE_TIME\": \"\",'+
		'            \"LOGINDETAIL\": {'+
		'                \"START_DATE_TIME\": \"01-MAR-21\",'+
		'                \"END_DATE_TIME\": \"10-MAR-21\"'+
		'            },'+
		'            \"DPD\": \"\",'+
		'            \"TOTAL_HOLIDAYS_PERIOD\": \"\",'+
		'            \"ELIGIBLE_LOAN_AMT_LTV\": 9333000,'+
		'            \"DISB_AUTH_SEND_BACK_END_DATE_TIME\": \"\",'+
		'            \"INT_RATE\": 15,'+
		'            \"TOTAL_HOLD_PERIOD\": \"\",'+
		'            \"REJECT_ACTION_TYPE\": \"\",'+
		'            \"SCHEME_NAME\": \"AMBIT Vyapar- Surrogate\",'+
		'            \"MATURITY_DATE\": \"05-04-2031\",'+
		'            \"DBR_PERCENTAGE\": 0,'+
		'            \"PROPERTY_ADDRESS\": \"\",'+
		'            \"SANCTIONED_AMOUNT\": 9172044,'+
		'            \"DISB_AUTH_START_DATE_TIME\": \"\",'+
		'            \"REJECT_REMARKS\": \"\",'+
		'            \"TENOR\": 120,'+
		'            \"DEVIATION_ROLE\": ['+
		'                {'+
		'                    \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                    \"END_DATE_TIME\": \"09-MAR-21\",'+
		'                    \"RAISED_TO\": \"L3 (S-VYAPAR)\"'+
		'                },'+
		'                {'+
		'                    \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                    \"END_DATE_TIME\": \"09-MAR-21\",'+
		'                    \"RAISED_TO\": \"L3 (S-VYAPAR)\"'+
		'                }'+
		'            ],'+
		'            \"DISBURSAL_DATE\": \"07-MAR-2021\",'+
		'            \"TARGET_IRR\": \"\",'+
		'            \"ASSET_VALUE\": \"\",'+
		'            \"CREDIT_DECISION\": ['+
		'                {'+
		'                    \"ACTION\": \"APPROVE\",'+
		'                    \"START_DATE_TIME\": \"\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                },'+
		'                {'+
		'                    \"ACTION\": \"RECOMMEND\",'+
		'                    \"START_DATE_TIME\": \"\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                },'+
		'                {'+
		'                    \"ACTION\": \"RECOMMEND\",'+
		'                    \"START_DATE_TIME\": \"\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                }'+
		'            ],'+
		'            \"LOGIN_DATE_QUALITY_TO_START_DATE\": \"\",'+
		'            \"INSURANCE_AMT_TOTAL\": \"\",'+
		'            \"LAST_DISB_END_DATE_TIME\": \"\",'+
		'            \"PF_AMOUNT\": \"\",'+
		'            \"DPD_STRING\": \"25|55|85|115|175\",'+
		'            \"LEGAL_VALUATION\": ['+
		'                {'+
		'                    \"LEGAL_STATUS\": \"POSITIVE\",'+
		'                    \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                    \"AGENT_NAME\": \"RMV LAW ASSOCIATES\",'+
		'                    \"AGENCY_NAME\": \"CORPORATE LEGAL VALUER\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                }'+
		'            ],'+
		'            \"LOAN_STATUS\": \"PARTIALLY_DISBURSED\",'+
		'            \"FIRST_RECOMMENDATION_DATE\": \"\",'+
		'            \"SANCTION_DATE\": \"07-MAR-21\",'+
		'            \"EMI_START_DATE\": \"05-APR-2021\",'+
		'            \"APPLICATION_DATE\": \"28-FEB-2021\",'+
		'            \"PROSPECT_CODE\": \"JAI000000021202\",'+
		'            \"DISB_MK_SEND_BACK_START_DATE_TIME\": \"\",'+
		'            \"CASH_FLOW_END_DATE_TIME\": \"\",'+
		'            \"REJECT_ACTION_CODE\": \"\",'+
		'            \"DISB_AUTH_SEND_BACK_START_DATE_TIME\": \"\",'+
		'            \"TENOR_MONTHS\": 0,'+
		'            \"IMDDETAIL\": {'+
		'                \"STATUS\": \"CLEAR\",'+
		'                \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                \"END_DATE_TIME\": \"09-MAR-21\",'+
		'                \"RECEIPT_NO\": \"OTCR026456\"'+
		'            },'+
		'            \"REPAYMENT_MODE\": 1000000009,'+
		'            \"UNBILLED_PRINCIPAL\": \"\",'+
		'            \"ADV_EMI_AMT\": \"\",'+
		'            \"DISB_AMT\": 4850000,'+
		'            \"DATA_QUALITY_COMPLETION_TO_SANCTION\": \"\",'+
		'            \"EMI\": \"64,158\",'+
		'            \"APPLICANT_CODE\": \"CN0000000048744\",'+
		'            \"ELIGIBLELOANAMT\": 0,'+
		'            \"PRODUCT_NAME\": \"AMBIT_VYAPAR\",'+
		'            \"CUSTOMER_DETAIL\": ['+
		'                {'+
		'                    \"APPLICANT_CODE\": \"CN0000000048744\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"START_DATE_TIME\": \"01-MAR-21\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                },'+
		'                {'+
		'                    \"APPLICANT_CODE\": \"CN0000000048748\",'+
		'                    \"APPLICANT_TYPE\": \"CO-APPLICANT\",'+
		'                    \"START_DATE_TIME\": \"20-FEB-08\",'+
		'                    \"END_DATE_TIME\": \"20-FEB-08\"'+
		'                }'+
		'            ],'+
		'            \"AFFORDABLE_EMI\": \"\",'+
		'            \"CUSTOMER_GROUP\": \"AMBT\",'+
		'            \"FIRST_RECOMMENDATION_TO_SANCTION_REJECT\": \"\",'+
		'            \"CURRENTLY_ASSIGNED_TO\": \"\",'+
		'            \"CASE_OVERALL_TAT\": \"\",'+
		'            \"VERIFICATION\": ['+
		'                {'+
		'                    \"AGENCY_ID\": 0,'+
		'                    \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                    \"AGENCY_NAME\": 0,'+
		'                    \"VERIFICATION_TYPE\": \"Resi Tele verification\",'+
		'                    \"END_DATE_TIME\": \"\",'+
		'                    \"VERIFICATION_STATUS\": \"COMPLETED\"'+
		'                }'+
		'            ],'+
		'            \"LAST_TRANCHE_DISBURSED\": \"ALL TRANCHES\",'+
		'            \"CUST_ENTITYTYP_ENAME\": \"NON-INDIVIDUAL\",'+
		'            \"FINANCIALDETAIL\": ['+
		'                {'+
		'                    \"APPLICANT_CODE\": \"CN0000000048744\",'+
		'                    \"APPLICANT_TYPE\": \"APPLICANT\",'+
		'                    \"START_DATE_TIME\": \"01-MAR-21\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                },'+
		'                {'+
		'                    \"APPLICANT_CODE\": \"CN0000000048748\",'+
		'                    \"APPLICANT_TYPE\": \"CO-APPLICANT\",'+
		'                    \"START_DATE_TIME\": \"20-FEB-08\",'+
		'                    \"END_DATE_TIME\": \"20-FEB-08\"'+
		'                }'+
		'            ],'+
		'            \"BUSINESS_DATE\": \"01-OCT-21\",'+
		'            \"DISB_AUTH_END_DATE_TIME\": \"\",'+
		'            \"LOAN_AMOUNT\": 9172044,'+
		'            \"SCHEME\": 1000000109,'+
		'            \"LOANSUBSTATUSID\": 1000000010,'+
		'            \"NPA_STAGE\": \"SUB STANDARD\",'+
		'            \"ASSIGNED_DATE_TIME\": \"\",'+
		'            \"SANCTION_TO_FIRST_DISBURSAL\": \"\",'+
		'            \"BRANCH\": \"JAIPUR\",'+
		'            \"CASH_FLOW_START_DATE_TIME\": \"\",'+
		'            \"MAX_LTV_PERCENTAGE\": 50,'+
		'            \"DISB_MK_START_DATE_TIME\": \"\",'+
		'            \"TENOR_DAYS\": 0,'+
		'            \"PRE_EMI_AMT\": \"\",'+
		'            \"INST_TYPE\": \"EQUAL STRUCTURED INSTALLMENTS\",'+
		'            \"LTV_PERCENTAGE\": 49.14,'+
		'            \"CUSTOMER_NAME\": \"SHREE TIMBER INDUSTRIES\",'+
		'            \"LOGIN_TO_FIRST_DISBURSAL\": \"\",'+
		'            \"LAST_DISB_START_DATE_TIME\": \"\",'+
		'            \"REPAYMENT_FREQUENCY\": \"MONTHLY\",'+
		'            \"FIRST_DISB_END_DATE_TIME\": \"\",'+
		'            \"TECHNICAL_VALUATION\": ['+
		'                {'+
		'                    \"TECHNICAL_STATUS\": \"POSITIVE\",'+
		'                    \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                    \"AGENT_NAME\": \"B.G ASSOCIATES\",'+
		'                    \"AGENCY_NAME\": \"ValJaipur\",'+
		'                    \"VALUATION_AMOUNT\": \"\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                },'+
		'                {'+
		'                    \"TECHNICAL_STATUS\": \"POSITIVE\",'+
		'                    \"START_DATE_TIME\": \"07-MAR-21\",'+
		'                    \"AGENT_NAME\": \"VINOD KUMAR GARG\",'+
		'                    \"AGENCY_NAME\": \"ValJaipur\",'+
		'                    \"VALUATION_AMOUNT\": \"\",'+
		'                    \"END_DATE_TIME\": \"\"'+
		'                }'+
		'            ],'+
		'            \"DISBAMT\": 5132634,'+
		'            \"LOAN_ACTIVITY\": ['+
		'                {'+
		'                    \"ACTIVITY_NAME\": \"LOAN\",'+
		'                    \"SEQ_NO\": 0,'+
		'                    \"UPDATED_BY\": 1417001,'+
		'                    \"UPDATED_DATE\": \"28-FEB-2021\",'+
		'                    \"UPDATED_DATETIME\": \"01-MAR-2021 17:41:19\",'+
		'                    \"ACTIVITY_ID\": 1100106701,'+
		'                    \"STATUS_NAME\": \"FROZEN\",'+
		'                    \"ACTION_ID\": 1000000005'+
		'                },'+
		'                {'+
		'                    \"ACTIVITY_NAME\": \"APPLICANT\",'+
		'                    \"SEQ_NO\": 1,'+
		'                    \"UPDATED_BY\": 1417003,'+
		'                    \"UPDATED_DATE\": \"07-MAR-2021\",'+
		'                    \"UPDATED_DATETIME\": \"09-MAR-2021 02:48:04\",'+
		'                    \"ACTIVITY_ID\": 1100106706,'+
		'                    \"STATUS_NAME\": \"FROZEN\",'+
		'                    \"ACTION_ID\": 1000000079'+
		'                }'+
		'            ]'+
		'        }'+
		'    }'+
		'}');
        return res;
    }

}