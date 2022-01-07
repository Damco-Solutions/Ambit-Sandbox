global class Lead_Assignment implements Database.Batchable<sObject>,Database.Stateful,Database.AllowsCallouts {
    
   Map<id,contact> IdContactMapBatch=new Map<id,contact>();
    global Lead_Assignment(Map<id,contact> IdContactMap){
        IdContactMapBatch=IdContactMap;
    }
    
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // collect the batches of records or objects to be passed to execute
        
        //Boolean Status=True;
        //String query = 'Select Id,MailingAddress,Product__c,Loan_Amount__c,Branch__c,Branch_Manager__c,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,State_Destination__c,Pincode_Destination__c,Applicant_upload__c from Contact where Applicant_upload__c=:Status';
        return Database.getQueryLocator([Select Id,MailingAddress,Product__c,Loan_Amount__c,Branch__c,Branch_Manager__c,Flat_House_Number_Destination__c,Building_Street_Name_Destination__c,Area_Destination__c,District_Destination__c,City_Destination__c,State_Destination__c,Pincode_Destination__c,Applicant_upload__c from Contact where id in:IdContactMapBatch.keySet()]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope) {
        if(scope != null && scope.size()>0){
            system.debug('scope->'+scope);
            Map<id,List<Contact>> applicantuploadList_Map = new Map<id,List<Contact>>();
            for(Contact con:scope){
                if(applicantuploadList_Map.get(con.id)==null){
                    applicantuploadList_Map.put(con.id,new List<Contact>{con});
                }else{
                    applicantuploadList_Map.get(con.id).add(con);
                }            
            }
             system.debug('applicantuploadList_Map->'+applicantuploadList_Map);
            if(applicantuploadList_Map!=null && !applicantuploadList_Map.isEmpty()){
                    string origins;
                    string destinations;
                    string accrecordtypeid=Schema.SObjectType.Account.getRecordTypeInfosByName().get('Branch').getRecordTypeId();
                    list<Account>branchlist= new list<Account>();
                    list<Contact> conbranchlist= new list<Contact>();
                    list<Contact> conlist= new list<Contact>();
                    list<Account>branchlastuserupdatelist= new list<Account>();
                    Map<Id, Id> ownerAssignments = new Map<Id, Id>();// adding user to applicant
                    Map<Id, Id> lastowner = new Map<Id, Id>();//adding branch with last user lead assign
                    map<id,contact>app_ownerupdate_Map = new Map<id,contact>();
                    map<id,Account>Branceowerupdate_Map = new Map<id,Account>();
                   map<id,map<id,integer>>brancuserindex_map=new map<id,map<id,integer>>();
                   map<id,integer>user_index_map=new map<id,integer>();
                   Map<Id,integer >userindex= new map<id,integer>();
                   Map<Id, List<user>> assgbranchTouserMap= new Map<Id, List<user>>();
                map<id,string>branchdistance=new map<id,string>();
                  // Map<Id,list<string,string>> BranchwithGeocodeMap= new Map<Id,Geolocation>();
                //list<contact> contactownerupdate= new list<contact>();
                   // assgnGroupsToMembersMap = new Map<Id, List<Assignment_Group_Member__c>>();
                   // 
                   // 
                
                      
                for(id AppId:applicantuploadList_Map.keyset()){
                  
                    for(Contact ca:applicantuploadList_Map.get(AppId)){
                        set<id> branch_id= new set<id>();
                        if(ca.City_Destination__c!=null){
                            branchlist=[select id,name,RecordTypeId,Branch_Coordinate__c,Branch_Manager__c,Shippingcity  from account where RecordTypeId=:accrecordtypeid and Shippingcity=:ca.City_Destination__c];
                             system.debug('branchlist->'+branchlist);
                            system.debug('branchlist.size()->'+branchlist.size());
                            if(branchlist.size()==1){
                             Contact con1 = new Contact();
                            con1.Branch__c=branchlist[0].id;
                            con1.Branch_Manager__c=branchlist[0].Branch_Manager__c;
                            con1.Id=ca.Id;
                            
                            conbranchlist.add(con1);   
                        }
                            if(branchlist.size()==0){
                            branchlist=[select id,name,RecordTypeId,Branch_Coordinate__c,Branch_Coordinate__Latitude__s,Branch_Coordinate__Longitude__s,Branch_Manager__c,Shippingcity  from account where RecordTypeId=:accrecordtypeid];
                            if(!branchlist.isEmpty()){
                                
                                for( Account brn :branchlist){
                                    if(brn.Branch_Coordinate__c!=null){
                                     string branchLat= string.valueOf(brn.Branch_Coordinate__Latitude__s);
                                     String branchLong=string.valueOf(brn.Branch_Coordinate__Longitude__s);
                                      system.debug('branchLat->'+branchLat);
                                        system.debug('branchLong->'+branchLong);
                                    origins='"'+ca.Flat_House_Number_Destination__c+',';
                                        system.debug('Flat_House_Number_Destination__c->'+ca.Flat_House_Number_Destination__c);
                                        if(ca.Building_Street_Name_Destination__c!=null){
                                             origins+=''+ca.Building_Street_Name_Destination__c+',';
                                        } 
                                   
                                        system.debug('Building_Street_Name_Destination__c->'+ca.Building_Street_Name_Destination__c);
                                         system.debug('origins->'+origins);
                                    origins+=''+ca.Area_Destination__c+',';
                                        system.debug('Area_Destination__c->'+ca.Area_Destination__c);
                                         system.debug('origins->'+origins);
                                    origins+=''+ca.District_Destination__c+',';
                                        system.debug('District_Destination__c->'+ca.District_Destination__c);
                                         system.debug('origins->'+origins);
                                    origins+=''+ca.City_Destination__c+'';
                                        system.debug('City_Destination__c->'+ca.City_Destination__c);
                                         system.debug('origins->'+origins);
                                    origins+=''+ca.State_Destination__c+'';
                                        system.debug('State_Destination__c->'+ca.State_Destination__c);
                                         system.debug('origins->'+origins);
                                    origins+=''+ca.Pincode_Destination__c+'"';
                                        system.debug('Pincode_Destination__c->'+ca.Pincode_Destination__c);
                                         system.debug('origins->'+origins);
                                    destinations=''+branchLat+',';
                                    destinations+=''+branchLong+'';
                                    }
                                    
                                   
                                    system.debug('origins->'+origins);
                                    system.debug('destinations->'+destinations);
                                    String Distance=Lead_Assignment.getAddressAutoComplete(origins,destinations);
                                     Distance = Distance.deleteWhitespace();
                                     string dis = Distance.substringBetween('"value":','},"duration":');
                                     system.debug('Distance->'+Distance);
                                     system.debug('dis->'+dis);
                                    branchdistance.put(brn.Id,dis);
                                     system.debug('branchdistance->'+branchdistance.values());
                                   
                                    
                                }
                                if(!branchdistance.isEmpty()){
                                     List<string> disvalues=branchdistance.values();
                                    disvalues.sort();
                                    system.debug('disvalues->'+disvalues);
                                    string sortdis=disvalues[0];
                                     system.debug('sortdis->'+sortdis);
                                    if(string.isNotBlank(sortdis)){
                                        for(id key : branchdistance.keySet()){
                                            string dis=branchdistance.get(key);
                                            system.debug('dis 1->'+dis);
                                            if(dis==sortdis){
                                                system.debug('key->'+key);
                                                branch_id.add(key);
                                               system.debug('branch_id->'+branch_id); 
                                            }
                                            
                                    }
                                    
}
                                    
                                }
                                
                               
                            }
                            
                        }
                        }
                        if(branch_id!=null){
                            for(id branchid:branch_id){
                                Contact con1 = new Contact();
                                con1.Branch__c=branchid;
                                 con1.Id=ca.Id;
                            conbranchlist.add(con1);   
                            }
                             
                            
                        }
                        
                        
                        
                        system.debug('conbranchlist->'+conbranchlist);
                    }
                }
                    if(!conbranchlist.isEmpty()){
                        update conbranchlist;
                        for(Contact con :conbranchlist){
                            conlist.add(con);
                        }   
                    }
                    system.debug('conlist->'+conlist);
                    if(!conlist.isEmpty()){
                         integer index=0;
                         integer lastindex=0;
                        user assign_user;
                        for(contact app:conlist){ 
                            contact app1=[select id,name,Branch_Name__c,Branch__c from contact where id=:app.Id ];
                            system.debug('app1->'+app1);    
                          string branchname=app1.Branch_Name__c; 
                            Account Brandetails=[select id,name,Branch_Manager__c,last_assign_user__c,Index_no__c from account where id=:app.Branch__c limit 1];
                            
                            system.debug('branchname=>'+branchname);
                            system.debug('Brandetails.last_assign_user__c=>'+Brandetails.last_assign_user__c);
                            system.debug('Brandetails.Index_no__c=>'+Brandetails.Index_no__c); 
                  List<user> queues = [select id, Name,Branch__c,Profile.Name, UserRole.Name FROM User where  Profile.Name='sales profile' and Branch__c=:branchname ORDER BY Name];
                       system.debug('user list=>'+queues);
                             assgbranchTouserMap.put(app.Branch__c, queues);
                            // Pick the next person to be assigned
                            if(Brandetails.last_assign_user__c==null && ownerAssignments.isEmpty()){
                                assign_user=queues.get(Math.mod(index,queues.size()));
                                userindex.put(app.Branch__c,index);
                                ownerAssignments.put(app.Id, assign_user.Id);
                                lastowner.put(app.Branch__c, assign_user.Id);
                                user_index_map.put(assign_user.Id,index);
                                brancuserindex_map.put(app.Branch__c,user_index_map);
                               system.debug('assgbranchTouserMap=>'+assgbranchTouserMap);
                            system.debug('user_index_map=>'+user_index_map);
                             system.debug('brancuserindex_map=>'+brancuserindex_map);
                              system.debug('assign_user=>'+assign_user);
                            
                         system.debug('userindex=>'+userindex);                               
                            system.debug('ownerAssignments=>'+ownerAssignments);
                            system.debug('lastowner=>'+lastowner);
                             contact appownerlist= new contact();
                             appownerlist.Id=app.Id;
                            appownerlist.OwnerId=ownerAssignments.get(app.Id);
                            appownerlist.Applicant_upload__c=False;
                            app_ownerupdate_Map.put(appownerlist.id,appownerlist);
                                
                            Account branleadtouser= new Account();
                            branleadtouser.id=app.Branch__c;
                            branleadtouser.last_assign_user__c=lastowner.get(app.Branch__c);
                            branleadtouser.Index_no__c=userindex.get(app.Branch__c);   
                            Branceowerupdate_Map.put(branleadtouser.id,branleadtouser);
                               
            if(app_ownerupdate_Map != null && app_ownerupdate_Map.size()>0 && Branceowerupdate_Map != null && Branceowerupdate_Map.size()>0){
                    try{
                                upsert app_ownerupdate_Map.values();
                                upsert Branceowerupdate_Map.values();
                        
                    }
                    catch(dmlException ex){
                        system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
                    }
                }
                                
                            }
                            system.debug('userindex=>'+userindex);
                             system.debug('ownerAssignments=>'+ownerAssignments);
                            system.debug('lastowner=>'+lastowner);
            if(Brandetails.last_assign_user__c!=null && Brandetails.Index_no__c!=null){
                               lastindex= integer.valueOf(Brandetails.Index_no__c);
                                userindex.put(Brandetails.id,lastindex);
                                if(userindex.containskey(app.Branch__c)){
                                    index=userindex.get(app.Branch__c);
                                    system.debug('new index->'+index);
                                    index=(index + 1) >= queues.size() ? 0 : index + 1;
                                    assign_user=queues.get(Math.mod(index,queues.size()));
                                    userindex.put(app.Branch__c,index);
                                    system.debug('assign_user=>'+assign_user);
                                    system.debug('userindex=>'+userindex);
                                     //userindex.put(app.Branch__c,index);
                                   ownerAssignments.put(app.Id, assign_user.Id);
                                   lastowner.put(app.Branch__c, assign_user.Id);
                                    
                                    contact appownerlist= new contact();
                                   appownerlist.Id=app.Id;
                                 appownerlist.OwnerId=ownerAssignments.get(app.Id);
                            appownerlist.Applicant_upload__c=False;
                            app_ownerupdate_Map.put(appownerlist.id,appownerlist);
                                
                            Account branleadtouser= new Account();
                            branleadtouser.id=app.Branch__c;
                            branleadtouser.last_assign_user__c=lastowner.get(app.Branch__c);
                            branleadtouser.Index_no__c=userindex.get(app.Branch__c);   
                            Branceowerupdate_Map.put(branleadtouser.id,branleadtouser);
                                }
                                 if(app_ownerupdate_Map != null && app_ownerupdate_Map.size()>0 && Branceowerupdate_Map != null && Branceowerupdate_Map.size()>0){
                    try{
                                upsert app_ownerupdate_Map.values();
                                upsert Branceowerupdate_Map.values();
                        
                    }
                    catch(dmlException ex){
                        system.debug('error: '+ex.getLineNumber() +'>> '+ ex.getMessage());
                    }
                }
                                
                                
              }
                            
                           
                        }
                        
                    }
                         
                }
    }
                
                        
            }


    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations like sending email
        // Database.executeBatch(new SalesIncentiveBatchForUnsecured(),200); 
    }
    //google api to get driving distance
    
    public static string getAddressAutoComplete(String origin,String destinations ) {
        string GoogleApiURL=label.GoogleApiURL;
        string ApiKey = label.googelApikey;
        String url = GoogleApiURL+
            +origin+'&destinations='+ destinations +
            + '&key=' + ApiKey;
        return Lead_Assignment.getHttp(url);
    }
    
    public static string getHttp(string strURL){
       string url=strURL;
        system.debug('url->'+url);
        String encodedString = EncodingUtil.urlEncode(url,'UTF-8');
         encodedString = encodedString.replace ('%3A',':');
         encodedString = encodedString.replace ('%2F','/');
         encodedString = encodedString.replace ('%3F','?');
        encodedString = encodedString.replace ('%3D','=');
        encodedString = encodedString.replace ('%26','&');
        encodedString = encodedString.replace ('%2C',',');
        encodedString = encodedString.replace ('+','%20');
        system.debug('encodedString->'+encodedString);
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setMethod('GET');
        req.setEndpoint(encodedString);
        req.setTimeout(120000);
        res = h.send(req); 
        String responseBody = res.getBody();
        system.debug('response: '+responseBody);
        return responseBody;
    }
}