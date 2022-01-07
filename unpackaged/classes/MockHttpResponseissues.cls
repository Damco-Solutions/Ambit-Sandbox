@isTest
global class MockHttpResponseissues implements HttpCalloutMock {
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
        res.setBody('{\"HEADER\":{\"APPLICATION-ID\":\"L16MAR210000001194\",\"CUST-ID\":\"L16MAR210000001194\",\"REQUEST-TIME\":null,\"REQUEST-RECEIVED-TIME\":\"16032021 17:27:13\",\"REQUEST-TYPE\":\"ISSUE\",\"RESPONSE-TYPE\":null,\"SOURCE-SYSTEM\":\"GoNOGo\"},\"ACKNOWLEDGEMENT-ID\":5962351,\"RESPONSE-FORMAT\":[\"04\"]}"');
        return res;
    }
}