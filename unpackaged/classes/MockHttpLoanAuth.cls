@istest
Global class MockHttpLoanAuth implements HttpCalloutMock  {
    
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
		'        \"TOKEN\": \"1000000079\"'+
		'    }'+
		'}');
        return res;
    }

}