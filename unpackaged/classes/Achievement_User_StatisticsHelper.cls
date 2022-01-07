public class Achievement_User_StatisticsHelper {
    
    public static void insertUpdateUser_Statistics(Set<Id> AchievementList)
    {
        Set<Id> Salespersons=new Set<Id>();
        Set<string> SalespersonsData=new Set<string>();
        Set<string> SalespersonsUSData=new Set<string>();
        set<String> usermonth=new set<String>();
        set<String> userYear=new set<String>();
        List<User_Statistics__c> insertUser_Statistics=new List<User_Statistics__c>();
        List<User_Statistics__c> UpdateUser_Statistics=new List<User_Statistics__c>();
        List<Achievement__c> Achievementlst=new List<Achievement__c>();
        
        Map<String,User_Statistics__c> MapUser_Statistics= new  Map<String,User_Statistics__c>();
        for(Achievement__c Achievement:[select No_of_Sanctions__c,Lead_Generation_Achieved__c ,Value_Achieved__c,No_of_Units_Disbursed_Achieved__c,No_of_Files_Logged_In_Achieved__c,Lead_Generation_Target__c,Meeting_Achievement__c,User__c,Month__c,Year__c from Achievement__c where id in:AchievementList ])
        {
            Salespersons.add(Achievement.user__c);
            
            SalespersonsData.add(Achievement.user__c+'-'+Achievement.Month__c.toUppercase()+'-'+Achievement.Year__c.toUppercase());
            usermonth.add(Achievement.Month__c);
            userYear.add(Achievement.Year__c);
            Achievementlst.add(Achievement);
            
        }
        List<User_Statistics__c>  User_Statistics=[SELECT Id, Salesperson__c,Month__c, Year__c FROM User_Statistics__c where Salesperson__c in:Salespersons and Month__c in:usermonth and Year__c in:userYear ];
        System.debug('User_Statistics '+User_Statistics);
        for(User_Statistics__c UserStatistics:User_Statistics)
        {
            MapUser_Statistics.put(UserStatistics.Salesperson__c+'-'+UserStatistics.Month__c.toUppercase()+'-'+UserStatistics.Year__c.toUppercase(),UserStatistics);
            
        }
        
        for(Achievement__c Achievement:Achievementlst)
        {
            
            if(MapUser_Statistics.containskey(Achievement.user__c+'-'+Achievement.Month__c.toUppercase()+'-'+Achievement.Year__c.toUppercase()))
            {
                User_Statistics__c updUser_Statistics=    updateUS(Achievement,MapUser_Statistics.get(Achievement.user__c+'-'+Achievement.Month__c.toUppercase()+'-'+Achievement.Year__c.toUppercase()).Id);
                UpdateUser_Statistics.add(updUser_Statistics);
            }
            else
            {
                User_Statistics__c instUser_Statistics= insertUS(Achievement);
                insertUser_Statistics.add(instUser_Statistics);
            }
            
        }
        System.debug('insertUser_Statistics '+insertUser_Statistics);
        if(!insertUser_Statistics.isEmpty())
        {
            try{
                insert insertUser_Statistics;
            }Catch(Exception Ex)
            {
                System.debug('----Error-----'+Ex.getMessage()+' @ Line No '+Ex.getLineNumber());
            }
        }
        System.debug('UpdateUser_Statistics '+UpdateUser_Statistics);
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
    public static User_Statistics__c updateUS(Achievement__c Achievement, Id Usid)
    {
        User_Statistics__c objUser_Statistics=new User_Statistics__c(Id=Usid,Salesperson__c=Achievement.user__c,
                                                                     Value_of_Disbursement__c=Achievement.Value_Achieved__c,No_of_Disbursement__c=Achievement.No_of_Units_Disbursed_Achieved__c,
                                                                     No_of_Sanctions__c=Achievement.No_of_Sanctions__c,No_of_Logins__c=Achievement.No_of_Files_Logged_In_Achieved__c,
                                                                     No_of_Active_Leads__c=Achievement.Lead_Generation_Achieved__c,No_of_Meetings__c=Achievement.Meeting_Achievement__c,
                                                                     Value_of_Disbursement_Achieved__c=Achievement.Value_Achieved__c,
                                                                     Login_Achievement_MTD__c=Achievement.No_of_Files_Logged_In_Achieved__c
                                                                    );
        
        return objUser_Statistics;
        
    }
    public static User_Statistics__c insertUS(Achievement__c Achievement)
    {
        User_Statistics__c objUser_Statistics=new User_Statistics__c(Salesperson__c=Achievement.user__c,
                                                                     Value_of_Disbursement__c=Achievement.Value_Achieved__c,No_of_Disbursement__c=Achievement.No_of_Units_Disbursed_Achieved__c,
                                                                     No_of_Sanctions__c=Achievement.No_of_Sanctions__c,No_of_Logins__c=Achievement.No_of_Files_Logged_In_Achieved__c,
                                                                     No_of_Active_Leads__c=Achievement.Lead_Generation_Achieved__c,No_of_Meetings__c=Achievement.Meeting_Achievement__c,
                                                                     Value_of_Disbursement_Achieved__c=Achievement.Value_Achieved__c,
                                                                     Login_Achievement_MTD__c=Achievement.No_of_Files_Logged_In_Achieved__c,
                                                                     Month__c=Achievement.Month__c,Year__c=Achievement.Year__c);
        return objUser_Statistics;
    }
    
}