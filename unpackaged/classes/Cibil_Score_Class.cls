public class Cibil_Score_Class {
    @AuraEnabled
    public static string returnScore(Id AppId){
        system.debug('class called');
        Contact con = [SELECT CIBIL_ID__c,firstName,CIBIL_ID_Number__c FROM Contact WHERE id=:AppId LIMIT 1];
        string msg = '';
        if(string.isBlank(con.firstName))
            msg= 'Please provide First Name';
        else{
            con.CIBIL_ID_Number__c = '1234';
            con.CIBIL_Score__c = 750;
            con.Status__c  = 'CIBIL Updated';
            update con;
            msg = 'Success';  
        }
        return msg;
    }
}