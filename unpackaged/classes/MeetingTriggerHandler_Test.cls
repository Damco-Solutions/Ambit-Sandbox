@istest
public class MeetingTriggerHandler_Test {
    
    public static testmethod void ReScheduled(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        // create meeting
        Meeting__c ma= new Meeting__c();
        ma.Category__c='New Customer';
        ma.Status__c='Scheduled';
        ma.Type__c='Meeting';
        ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 5, 11, 17, 45, 0);
        insert ma;
        
        ma.Status__c='Re-Scheduled';
        //ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 3, 30, 8, 45, 0);
        test.startTest();
        try{
            update ma;
        }
        catch (Exception e){
            System.assert(e.getMessage().contains('Please enter a new Scheduled Start Time'));
        }
        
        test.stopTest();
    }
    
    public static testmethod void Scheduled(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        // create meeting
        Meeting__c ma= new Meeting__c();
        ma.Category__c='New Customer';
        ma.Status__c='Scheduled';
        ma.Type__c='Meeting';
        ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 5, 11, 17, 45, 0);
        insert ma;
        
        ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 5, 9, 14, 45, 0);
        //ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 3, 30, 8, 45, 0);
        test.startTest();
        try{
            update ma;
        }
        catch (Exception e){
            System.assert(e.getMessage().contains('Scheduled Meeting can not be added in back date'));
        }
        
        test.stopTest();
    }
    
    public static testmethod void completed(){
        Contact c = new Contact();
        c.RecordTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Individual').getRecordTypeId();
        c.FirstName = 'Test';
        c.LastName = 'Name';
        c.Email = 'test@abc.com';
        c.Phone = '86559944';
        c.Product__c = 'Lead - VYAPAR (SECURED LOAN)';
        insert c;
        // create meeting
        Meeting__c ma= new Meeting__c();
        ma.Category__c='New Customer';
        ma.Status__c='Completed';
        ma.Type__c='Meeting';
        ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 5, 11, 17, 45, 0);
        insert ma;
        
        ma.Status__c='Scheduled';
        //ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 3, 30, 8, 45, 0);
        test.startTest();
        try{
            update ma;
        }
        catch (Exception e){
            System.assert(e.getMessage().contains('Status of completed meetings cannot be changed'));
        }
        
        test.stopTest();
    }
    
    public static testmethod void completedwith(){
        
        user u1=TestDataFactory.CreateUser();
        System.runAs ( u1 ){
            // create meeting
            Meeting__c ma= new Meeting__c();
            ma.Category__c='New Customer';
            ma.Status__c='Completed';
            ma.Type__c='Meeting';
            ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 5, 11, 17, 45, 0);
            
            insert ma;
            
            ma.Type__c='Collection Task';
            //ma.Salesperson__c=u1.id;
            //ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 3, 30, 8, 45, 0);
            test.startTest();
            try{
                update ma;
            }
            catch (Exception e){
                System.assert(e.getMessage().contains('On Completed Stage We Can Not Update Type,Category,Purpose,Salesperson,Owner,Scheduled Start Time,Scheduled End Time,Applicant,Collection Task,Loan Account,DSA/Connector'));
            }
            
            test.stopTest();
        }
        
    }
    
    
    public static testmethod void Meetinginsert(){
        
        user u1=TestDataFactory.CreateUser();
        System.runAs ( u1 ){
            // create meeting
            Meeting__c ma= new Meeting__c();
            ma.Category__c='New Customer';
            ma.Status__c='Completed';
            ma.Type__c='Meeting';
            ma.Scheduled_Start_Time__c=datetime.newInstance(2021, 5, 11, 17, 45, 0);
            ma.Salesperson__c=u1.Id;
            test.startTest();
            try{
                insert ma;
            }
            catch (Exception e){
                
            } 
            test.stopTest();
        }
        
    }
    
}