@isTest
global class MockHttpResponseAcknowlogement implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        //System.assertEquals('http://example.com/example/test', req.getEndpoint());
        //System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        //res.setBody('{"example":"test"}');
        res.setBody('{"STATUS":"SUCCESS","ACKNOWLEDGEMENT-ID":5196283,"HEADER":{"CUST-ID":"0039D00000Cma6iQAB","APPLICATION-ID":"0039D00000Cma6iQAB","RESPONSE-TYPE":"ACKNOWLEDGEMENT","REQUEST-RECEIVED-TIME":"25062021 16:03:52"}}');
        res.setStatusCode(200);
        return res;
    }
}