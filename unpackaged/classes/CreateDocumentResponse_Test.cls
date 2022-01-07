@IsTest
public class CreateDocumentResponse_Test {
	
	static testMethod void testParse() {
		String json = '{'+
		'    \"STATUS\": \"S\",'+
		'    \"MESSAGE\": \"FILE OBJECT DETAILS FOR THE CUSTOMER SAVED SUCCESSFULLY\",'+
		'    \"DOCUMENT_INFO\": ['+
		'        {'+
		'            \"FILEOBJECTID\": 1000080137,'+
		'            \"SAVEDDATE\": \"2021-08-03 15:08:05.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000163320'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000080121,'+
		'            \"SAVEDDATE\": \"2021-07-20 19:02:17.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000163158'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022782,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:58.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074851'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022781,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:38.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074850'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022780,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:37.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074849'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022779,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:36.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074848'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022778,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:36.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074847'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022777,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:34.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074846'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022776,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:18.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074845'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022775,'+
		'            \"SAVEDDATE\": \"2019-07-27 14:16:12.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074844'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022757,'+
		'            \"SAVEDDATE\": \"2019-07-26 11:35:46.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074832'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022756,'+
		'            \"SAVEDDATE\": \"2019-07-26 11:35:46.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074831'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022755,'+
		'            \"SAVEDDATE\": \"2019-07-26 11:35:46.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074830'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022754,'+
		'            \"SAVEDDATE\": \"2019-07-26 11:35:45.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074829'+
		'        },'+
		'        {'+
		'            \"FILEOBJECTID\": 1000022753,'+
		'            \"SAVEDDATE\": \"2019-07-26 11:35:13.0\",'+
		'            \"PROSPECTID\": 1000022227,'+
		'            \"PROSPECTCODE\": \"AHM000000022226\",'+
		'            \"DOCUMENT_ID\": 1000074828'+
		'        }'+
		'    ]'+
		'}';
		CreateDocumentResponse obj = CreateDocumentResponse.parse(json);
		System.assert(obj != null);
	}
}