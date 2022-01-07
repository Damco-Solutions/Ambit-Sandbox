@IsTest
public class LoanCreationResponse_Test {
	
	static testMethod void testParse() {
		String json = '{'+
		'   \"RECEIVE\":{'+
		'      \"STATUS\":\"S\",'+
		'      \"MESSAGE\":\"SUCCESS\",'+
		'      \"ERR_DTLS\":\"null\",'+
		'      \"CUSTOMER_DETAILS\":{'+
		'         \"LOAN_DETAIL\":{'+
		'            \"EXT_PROSPECTCODE\":\"ABC\",'+
		'            \"PROSPECTID\":1000022277,'+
		'            \"PROSPECTCODE\":\"MUM000000022276\",'+
		'            \"CUSTOMER_DETAIL\":['+
		'               {'+
		'                  \"EMPLOYMENTDETAILSID\":1000049090,'+
		'                  \"APPLICANTCODE\":\"CN0000000054583\",'+
		'                  \"CUSTOMER_ENTITYTYPE\":\"INDIVIDUAL\",'+
		'                  \"APPLICANT_NAME\":\"ABCD KUMAR SHARMA\",'+
		'                  \"ADDRESS_DETAIL\":['+
		'                     {'+
		'                        \"ADDRESSTYPE\":\"RESIDENCE ADDRESS\",'+
		'                        \"ADDRESSID\":1000068345'+
		'                     },'+
		'                     {'+
		'                        \"ADDRESSTYPE\":\"PERMANENT ADDRESS\",'+
		'                        \"ADDRESSID\":1000068346'+
		'                     },'+
		'                     {'+
		'                        \"ADDRESSTYPE\":\"OFFICE ADDRESS\",'+
		'                        \"ADDRESSID\":1000068347'+
		'                     }'+
		'                  ],'+
		'                  \"APPLICANTID\":1000054398,'+
		'                  \"APPLICANTTYPE\":\"APPLICANT\",'+
		'                  \"EXTERNAL_CUSTOMER_CODE\":\"\"'+
		'               },'+
		'               {'+
		'                  \"EMPLOYMENTDETAILSID\":1000049091,'+
		'                  \"APPLICANTCODE\":\"CN0000000054584\",'+
		'                  \"CUSTOMER_ENTITYTYPE\":\"NON-INDIVIDUAL\",'+
		'                  \"APPLICANT_NAME\":\"PRIYA\",'+
		'                  \"ADDRESS_DETAIL\":['+
		'                     {'+
		'                        \"ADDRESSTYPE\":\"OFFICE ADDRESS\",'+
		'                        \"ADDRESSID\":1000068348'+
		'                     },'+
		'                     {'+
		'                        \"ADDRESSTYPE\":\"PERMANENT ADDRESS\",'+
		'                        \"ADDRESSID\":1000068349'+
		'                     },'+
		'                     {'+
		'                        \"ADDRESSTYPE\":\"RESIDENCE ADDRESS\",'+
		'                        \"ADDRESSID\":1000068350'+
		'                     }'+
		'                  ],'+
		'                  \"APPLICANTID\":1000054399,'+
		'                  \"APPLICANTTYPE\":\"CO-APPLICANT\",'+
		'                  \"EXTERNAL_CUSTOMER_CODE\":\"\"'+
		'               }'+
		'            ]'+
		'         }'+
		'      }'+
		'   }'+
		'}';
		LoanCreationResponse obj = LoanCreationResponse.parse(json);
		System.assert(obj != null);
	}
}