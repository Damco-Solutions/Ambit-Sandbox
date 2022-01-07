public class Sales_plan_User_StatisticsHelper {
    
    public static void insertUpdateUser_Statistics(Set<Id> SalesPlanList)
    {
        Set<Id> Salespersons=new Set<Id>();
        Set<string> SalespersonsData=new Set<string>();
        Set<string> SalespersonsUSData=new Set<string>();
        set<String> usermonth=new set<String>();
        set<String> userYear=new set<String>();
        List<User_Statistics__c> insertUser_Statistics=new List<User_Statistics__c>();
        List<User_Statistics__c> UpdateUser_Statistics=new List<User_Statistics__c>();
        List<Sales_Plan__c> SalesPlanlst=new List<Sales_Plan__c>();
        
        Map<String,User_Statistics__c> MapUser_Statistics= new  Map<String,User_Statistics__c>();
        for(Sales_Plan__c SalesPlan:[select Id,OwnerId , No_of_Logins__c,No_of_disbursement__c, Year__c, Month__c FROM Sales_Plan__c where id in:SalesPlanList ])
        {
            Salespersons.add(SalesPlan.ownerid);
            
            SalespersonsData.add(SalesPlan.ownerid+'-'+SalesPlan.Month__c.toUppercase()+'-'+SalesPlan.Year__c.toUppercase());
            usermonth.add(SalesPlan.Month__c);
            userYear.add(SalesPlan.Year__c);
            SalesPlanlst.add(SalesPlan);
            
        }
        AggregateResult[]  SalesPlanGroupedData=[select  ownerid,sum(No_of_Logins__c) No_of_Logins__c,sum(volume_of_disbursement__c) volume_of_disbursement__c , Year__c, Month__c FROM Sales_Plan__c where id in:SalesPlanList group by ownerid, Year__c, Month__c];
        
        
        List<User_Statistics__c>  User_Statistics=[SELECT Id, Salesperson__c,Month__c, Year__c FROM User_Statistics__c where Salesperson__c in:Salespersons and Month__c in:usermonth and Year__c in:userYear ];
        for(User_Statistics__c UserStatistics:User_Statistics)
        {
            MapUser_Statistics.put(UserStatistics.Salesperson__c+'-'+UserStatistics.Month__c.toUppercase()+'-'+UserStatistics.Year__c.toUppercase(),UserStatistics);
            
        }
        for(AggregateResult SalesPlan:SalesPlanGroupedData)
        {
            if(MapUser_Statistics.containskey(SalesPlan.get('ownerid')+'-'+SalesPlan.get('Month__c').toString().toUppercase()+'-'+SalesPlan.get('Year__c').toString().toUppercase()))
            {
                User_Statistics__c updUser_Statistics =  updateUS(SalesPlan,MapUser_Statistics.get(SalesPlan.get('ownerid')+'-'+SalesPlan.get('Month__c').toString().toUppercase()+'-'+SalesPlan.get('Year__c').toString().toUppercase()).Id);
                UpdateUser_Statistics.add(updUser_Statistics);
            }
            else
            {
                User_Statistics__c instUser_Statistics =insertUS(SalesPlan);
                insertUser_Statistics.add(instUser_Statistics);
            }
            
        }
        if(!insertUser_Statistics.isEmpty())
        {
            try{
                insert insertUser_Statistics;
            }Catch(Exception Ex)
            {
                System.debug('----Error-----'+Ex.getMessage()+' @ Line No '+Ex.getLineNumber());
            }
        }
        if(!UpdateUser_Statistics.isEmpty())
        {
            try{
                update UpdateUser_Statistics;
            }Catch(Exception Ex)
            {
                System.debug('----Error-----'+Ex.getMessage()+' @ Line No '+Ex.getLineNumber());
            }
        }
    }
    public static User_Statistics__c updateUS(AggregateResult SalesPlan, Id Usid)
    {
        User_Statistics__c objUser_Statistics=new User_Statistics__c(Id=Usid,Salesperson__c=SalesPlan.get('ownerid').tostring(),Login_Commitment_for_the_month__c=(decimal)SalesPlan.get('No_of_Logins__c'),
                                                                     Value_of_Disbursement_Commitment_For_the__c=(decimal)SalesPlan.get('volume_of_disbursement__c')
                                                                    );
        
        
        return objUser_Statistics;
        
    }
    public static User_Statistics__c insertUS(AggregateResult SalesPlan)
    {
        User_Statistics__c objUser_Statistics=new User_Statistics__c(Salesperson__c=SalesPlan.get('ownerid').tostring(),
                                                                     Login_Commitment_for_the_month__c=(decimal)SalesPlan.get('No_of_Logins__c'),
                                                                     Value_of_Disbursement_Commitment_For_the__c=(decimal)SalesPlan.get('volume_of_disbursement__c'),
                                                                     Month__c=SalesPlan.get('Month__c').tostring(),Year__c=SalesPlan.get('Year__c').tostring());
        
        return objUser_Statistics;
    }
    
}