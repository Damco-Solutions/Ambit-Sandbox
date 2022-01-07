@istest
Global class MockHttpLoanCreation  implements HttpCalloutMock {
    
     global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint and method.
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        //res.setBody('{"example":"test"}');
        res.setBody('{'+
		'    \"RECEIVE\": {'+
		'        \"STATUS\": \"S\",'+
		'        \"MESSAGE\": \"SUCCESS\",'+
		'        \"ERR_DTLS\": \"null\",'+
		'        \"CUSTOMER_DETAILS\": {'+
		'            \"LOAN_DETAIL\": {'+
		'                \"EXT_PROSPECTCODE\": \"\",'+
		'                \"PROSPECTID\": 1000022295,'+
		'                \"PROSPECTCODE\": \"DEL000000022294\",'+
		'                \"CUSTOMER_DETAIL\": ['+
		'                    {'+
		'                        \"EMPLOYMENTDETAILSID\": 1000049116,'+
		'                        \"APPLICANTCODE\": \"CN0000000054883\",'+
		'                        \"CUSTOMER_ENTITYTYPE\": \"INDIVIDUAL\",'+
		'                        \"APPLICANT_NAME\": \"Ashwini kumar\",'+
		'                        \"ADDRESS_DETAIL\": ['+
		'                            {'+
		'                                \"ADDRESSTYPE\": \"RESIDENCE ADDRESS\",'+
		'                                \"ADDRESSID\": 1000068401'+
		'                            },'+
		'                            {'+
		'                                \"ADDRESSTYPE\": \"PERMANENT ADDRESS\",'+
		'                                \"ADDRESSID\": 1000068402'+
		'                            },'+
		'                            {'+
		'                                \"ADDRESSTYPE\": \"OFFICE ADDRESS\",'+
		'                                \"ADDRESSID\": 1000068403'+
		'                            }'+
		'                        ],'+
		'                        \"APPLICANTID\": 1000054698,'+
		'                        \"APPLICANTTYPE\": \"APPLICANT\",'+
		'                        \"EXTERNAL_CUSTOMER_CODE\": \"\"'+
		'                    },'+
		'                    {'+
		'                        \"EMPLOYMENTDETAILSID\": 1000049117,'+
		'                        \"APPLICANTCODE\": \"CN0000000054884\",'+
		'                        \"CUSTOMER_ENTITYTYPE\": \"INDIVIDUAL\",'+
		'                        \"APPLICANT_NAME\": \"Ashwini Kim\",'+
		'                        \"ADDRESS_DETAIL\": ['+
		'                            {'+
		'                                \"ADDRESSTYPE\": \"OFFICE ADDRESS\",'+
		'                                \"ADDRESSID\": 1000068404'+
		'                            },'+
		'                            {'+
		'                                \"ADDRESSTYPE\": \"PERMANENT ADDRESS\",'+
		'                                \"ADDRESSID\": 1000068405'+
		'                            },'+
		'                            {'+
		'                                \"ADDRESSTYPE\": \"RESIDENCE ADDRESS\",'+
		'                                \"ADDRESSID\": 1000068406'+
		'                            }'+
		'                        ],'+
		'                        \"APPLICANTID\": 1000054699,'+
		'                        \"APPLICANTTYPE\": \"CO-APPLICANT\",'+
		'                        \"EXTERNAL_CUSTOMER_CODE\": \"\"'+
		'                    }'+
		'                ]'+
		'            }'+
		'        }'+
		'    }'+
		'}');
        return res;
    }

}