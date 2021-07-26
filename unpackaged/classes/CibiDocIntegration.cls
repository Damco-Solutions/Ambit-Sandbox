public class CibiDocIntegration {
    public  List<list<Integer>> PDFREPORT {get;set;}
    public  string htmlcode {get;set;}
    
    
    public CibiDocIntegration()
    {
        //  getResponse();
    }
    public  static void getResponse()
    {
        string url1='https://mbuat.serviceurl.in/CODExS/saas/saasRequest.action?INSTITUTION_ID=4160&AGGREGATOR_ID=691&MEMBER_ID=cpu_user_AMBT@softcell.com&PASSWORD=JEQ4biF5OEY=&inputJson_=%7B%22HEADER%22:%7B%22APPLICATION-ID%22:%220039D00000Cma6iQAB%22,%22CUST-ID%22:%220039D00000Cma6iQAB%22,%22REQUEST-TIME%22:null,%22REQUEST-RECEIVED-TIME%22:%2205072021%2021:53:47%22,%22REQUEST-TYPE%22:%22ISSUE%22,%22RESPONSE-TYPE%22:null,%22SOURCE-SYSTEM%22:%22GoNOGo%22%7D,%22ACKNOWLEDGEMENT-ID%22:5336620,%22RESPONSE-FORMAT%22:%5B%2204%22,%2203%22,%2202%22,%2201%22%5D%7D';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        system.debug('');
        req.setEndpoint(url1);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('Status Code: '+res.getStatusCode() + 'Status: '+ res.getStatus());
        system.debug('responseissues: '+responseBody);
        
        CibiDocIntegration cr=(CibiDocIntegration) JSON.deserialize(responseBody, CibiDocIntegration.class);
        
        String HTMLREPORT;
        string csscore;
        string APPLICATIONID;
        
        list<contact> con= new list<contact>();
        String jsonResult = responseBody;
        System.debug('jsonResult '+jsonResult);
        JSONParser parser = JSON.createParser(jsonResult);
        System.debug('parser->'+parser);
        //String transformedText = parser.replace('""', '"');
        // Parsing of string
        list<Integer> res1=cr.PDFREPORT.get(0);
        system.debug('pdfreport->'+res1);
        list<string> res2=new list<string>();
       while(parser.nextToken()!= null) {
    if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
        parser.nextValue();
        if(parser.getCurrentName() =='PDF REPORT') {
            
            if (parser.getCurrentToken() == null) parser.nextToken();
            while (parser.nextToken() != System.JSONToken.END_ARRAY) {
                res1.add(parser.getIntegerValue());
                system.debug('res: '+res1);
                
            }
            
            
        }
        
    }
}
        string blbdata='';
        //res1 = new Integer[] {37,80,68,70, 45, 49,46,52,10,37,-57 };
        
        for(Integer i=0;i<res1.Size()-100000;i++)
            
        {
            string val=string.valueof(res1[i]);
            // system.debug('EncodingUtil.convertToHex '+EncodingUtil.convertToHex(blob.valueOf(val)));
            blbdata+=EncodingUtil.convertToHex(blob.valueOf(val));
        }
        
        //  String encodedString = String.fromCharArray(res1);
        // blbdata=EncodingUtil.convertToHex(blob.valueOf(encodedString));
        system.debug('blbdata '+blbdata);
        blob finalblob=EncodingUtil.convertFromHex(blbdata);
        system.debug('blbdata '+blbdata);
        
        //String encodedString = String.valueOf(Integer.valueOf(res1));
        
        //Blob tempBlob =EncodingUtil.base64Decode('');
        // String result =EncodingUtil.Base64Encode(tempBlob);
        // system.debug('result'+result);
        //blob someFile = EncodingUtil.base64Decode(result);
        //system.debug('someFile->'+someFile);
        Attachment attach = new Attachment();
        attach.Body = finalblob;
        attach.Name = 'Cibilscore123'+'.pdf';
        attach.IsPrivate = false;
        attach.contentType = 'application/pdf';
        attach.ParentId = '0039D00000Cl8AMQAZ';
        insert attach;
        
        /*string blbdata;
for(Integer i:res1)
{
string val=string.valueof(i);
blbdata+=EncodingUtil.convertToHex(blob.valueOf(val));
}
blob finalblob=EncodingUtil.convertFromHex(blbdata);
system.debug('finalblob '+finalblob);
// system.debug('res1 '+res1);
//string score=String.valueOf(Integer.valueOf(csscore));
////Decimal CIBILScore = decimal.valueOf(score);
//system.debug('HTML REPORT: '+HTMLREPORT);
//system.debug('APPLICATIONID: '+APPLICATIONID);
//system.debug('score: '+csscore);
//system.debug('CIBILScore: '+CIBILScore);
/*   if(APPLICATIONID!=null){
for (contact cs:[select id,name,CIBIL_Score__c from contact where id=:APPLICATIONID]){
contact app= new contact();
app.Id=cs.id;
app.CIBIL_Score__c=CIBILScore;
con.add(app);

} 
}
*/
        if(HTMLREPORT!=null){
            /*	
HTMLREPORT = HTMLREPORT.replace ('\n','');
HTMLREPORT = HTMLREPORT.replace ('<html xmlns="http://www.w3.org/1999/xhtml">','<html>');
HTMLREPORT = HTMLREPORT.replace ('<pd4ml:page.header>','');
HTMLREPORT = HTMLREPORT.replace ('</pd4ml:page.header>','');
HTMLREPORT = HTMLREPORT.replace ('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">','');
system.debug('HTMLREPORT new->'+HTMLREPORT);
htmlcode=HTMLREPORT;
htmlcode = htmlcode.substringBefore('END OF REPORT');
// htmlcode=htmlcode+'<html><body><div><div><table><tr><td>testing</td></tr></table>  </div>  </div></body></html>';
htmlcode=htmlcode+'</td></tr></table>  </div>  </div></body></html>';
string blbdata='';
*/
            
            
            
            
            /*	List<Integer> abcd=bytetopdf.parse(HTMLREPORT);
for(Integer i:abcd)
{
string val=string.valueof(i);
blbdata+=EncodingUtil.convertToHex(blob.valueOf(val));
}
blob finalblob=EncodingUtil.convertFromHex(blbdata);
system.debug('finalblob '+finalblob);
//  
//  */
            
            
            // Add parameters (if any) passed from the custom button or queried locally
            
            
        }
    }
}