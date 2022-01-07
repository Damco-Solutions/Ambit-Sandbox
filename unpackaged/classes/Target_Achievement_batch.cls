/***Created by Shabana Tarannum on 01-03-2021***/
/***Modification done by Ashwini kumar on 01-june-2021***/
global class Target_Achievement_batch implements Database.Batchable<sObject> {
    Private Map<id,Decimal> AllLoans = new Map<id,Decimal>();
    Private Map<id,Decimal> NPA_DPD_Map = new Map<id,Decimal>();
    
    global Target_Achievement_batch(Map<id,Decimal> all, Map<id,Decimal> dpd){
        AllLoans = all;
        NPA_DPD_Map = dpd;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        Integer CurrentYear = system.today().year();
        Date StartDate = date.newinstance(CurrentYear,4,1);
        Date todayDate = system.today();
        String query = 'Select Id,OwnerId,name,Active__c,Meeting_Targets__c,Meeting_Lead_Conversation_Ratio__c,Lead_Generation_Target__c,No_of_Files_Logged_In_No__c,No_of_Files_Logged_In_Value__c,No_of_Units_Disbursed__c,Volumes__c,IRR__c,Net_PF__c,Insurance_Penetration__c,Direct_Biz_Sourced__c,FTR__c,Query_TAT_Resolution__c,Approval_Ratio__c,OTC_PDD_above_norms__c,Cases_Disbursed_in_last_3_days__c,NPA__c,Salesperson__c,Adherence_to_Ambit_Values__c,Communication_and_email_skillset__c,Overall_grooming_attendance_discipline__c,Overall_conduct_and_Cross_function_deali__c,Branch_Manager__c from Targets__c WHERE Start_Date__c=:StartDate AND End_Date__c >=: todayDate';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Targets__c> scope){
        
        if(scope != null && scope.size()>0){
            
            //Targets per user
            Map<id,Targets__c> UserTargetMap = new Map<id,Targets__c>();           
            for(Targets__c tg: scope){
                if(tg.Salesperson__c !=null)
                    UserTargetMap.put(tg.Salesperson__c,tg);                
            }
            //target per role added
            
            Integer CurrentYear = system.today().year();
            Date StartDate = date.newinstance(CurrentYear,4,1);
            Date todayDate = system.today();
            
            Integer mnth = System.Today().Month();
            Map<Integer,String> monthMap = new Map<Integer,String>();
            monthMap.put(1, 'January'); monthMap.put(2, 'February');
            monthMap.put(3, 'March'); monthMap.put(4, 'April');
            monthMap.put(5, 'May'); monthMap.put(6, 'June');
            monthMap.put(7, 'july'); monthMap.put(8, 'August');
            monthMap.put(9, 'September'); monthMap.put(10, 'October');
            monthMap.put(11, 'November'); monthMap.put(12, 'December');
            //Already added achievement for the period
            Map<id,Achievement__c> AchievementMap = new Map<id,Achievement__c>();
            Map<id,Achievement__c> AchievementMapUpdate = new Map<id,Achievement__c>();
            for(Achievement__c ac:[select id,User__c FROM Achievement__c WHERE Month__c=:monthMap.get(mnth) AND Year__c=:string.valueOf(CurrentYear)]){
                AchievementMap.put(ac.User__c,ac);
                 
            }
            
            

            //achievements added
            
            //meetings per user---Meeting Targets
            Map<id,integer> userMeetingsMap = new Map<id,integer>();
            for(Meeting__c meet:[select id,OwnerId FROM Meeting__c WHERE CALENDAR_MONTH(Scheduled_Start_Time__c) =:mnth AND CALENDAR_YEAR(Scheduled_Start_Time__c) =:CurrentYear AND Status__c= 'Completed' AND Meeting_Outcome__c LIKE 'Lead Generation%']){
                if(userMeetingsMap.containsKey(meet.OwnerId)){
                    userMeetingsMap.put(meet.OwnerId,(userMeetingsMap.get(meet.OwnerId))+1);
                }else{
                    userMeetingsMap.put(meet.OwnerId,1);
                }
            }
             //----Added by Niyaz
            //No of SANCTIONED
             Map<id,decimal> SANCTIONEDLA_Map = new Map<id,decimal>();
             for(Loan_Account__c la:[select id,name,Status__c,Applicant__r.OwnerId,Applicant__r.Loan_Amount__c from Loan_Account__c WHERE CALENDAR_MONTH(CreatedDate) =:mnth AND CALENDAR_YEAR(CreatedDate) =:CurrentYear]){
               System.debug('la--- '+la);
                 if(string.isNotBlank(la.LOAN_STATUS__c) && (la.LOAN_STATUS__c =='Approved')){
                    if(SANCTIONEDLA_Map.containsKey(la.Applicant__r.OwnerId)){
                        SANCTIONEDLA_Map.put(la.Applicant__r.OwnerId,(SANCTIONEDLA_Map.get(la.Applicant__r.OwnerId))+1);
                    }else{
                        SANCTIONEDLA_Map.put(la.Applicant__r.OwnerId,1);
                    }
                }
             }
            System.debug('SANCTIONEDLA_Map '+SANCTIONEDLA_Map);
             //----Added by Niyaz
            
            
            //meetings count added
            
            
            //Meeting/Lead conversion ratio 
            Map<id,decimal> ConvertedLeadsMap = new Map<id,decimal>();
            Map<id,decimal> allLeadsMap = new Map<id,decimal>();
            Map<id,decimal> ConvertedLeadsAmountMap = new Map<id,decimal>();
            Map<id,decimal> ApprovedLA_Map = new Map<id,decimal>();
            for(Loan_Account__c la:[select id,name,Status__c,Applicant__r.OwnerId,Applicant__r.Loan_Amount__c from Loan_Account__c WHERE CALENDAR_MONTH(CreatedDate) =:mnth AND CALENDAR_YEAR(CreatedDate) =:CurrentYear]){
                if(string.isNotBlank(la.LOAN_STATUS__c) && (la.LOAN_STATUS__c =='Approved' || la.LOAN_STATUS__c =='Disbursed' || la.LOAN_STATUS__c =='Authorized' || la.LOAN_STATUS__c =='Partially Disbursed')){
                    if(ApprovedLA_Map.containsKey(la.Applicant__r.OwnerId)){
                        ApprovedLA_Map.put(la.Applicant__r.OwnerId,(ApprovedLA_Map.get(la.Applicant__r.OwnerId))+1);
                    }else{
                        ApprovedLA_Map.put(la.Applicant__r.OwnerId,1);
                    }
                    

                }
                if(ConvertedLeadsMap.containsKey(la.Applicant__r.OwnerId)){
                    ConvertedLeadsMap.put(la.Applicant__r.OwnerId,(ConvertedLeadsMap.get(la.Applicant__r.OwnerId))+1);
                }else{
                    ConvertedLeadsMap.put(la.Applicant__r.OwnerId,1);
                }
              

                if(ConvertedLeadsAmountMap.containsKey(la.Applicant__r.OwnerId)){
                    ConvertedLeadsAmountMap.put(la.Applicant__r.OwnerId,(ConvertedLeadsAmountMap.get(la.Applicant__r.OwnerId))+la.Applicant__r.Loan_Amount__c);
                }else{
                    ConvertedLeadsAmountMap.put(la.Applicant__r.OwnerId,la.Applicant__r.Loan_Amount__c);
                }
                
            }
            for(Contact con:[select id,OwnerId,Loan_Amount__c FROM Contact WHERE CALENDAR_MONTH(CreatedDate) =:mnth AND CALENDAR_YEAR(CreatedDate) =:CurrentYear AND Applicant_Type__c='Applicant']){
                if(allLeadsMap.containsKey(con.OwnerId)){
                    allLeadsMap.put(con.OwnerId,(allLeadsMap.get(con.OwnerId))+1);
                }else{
                    allLeadsMap.put(con.OwnerId,1);
                }
            }
            
            
            Map<id,decimal> conversionRateMap = new Map<id,decimal>();
            for(id own:allLeadsMap.keySet()){
                decimal denum= allLeadsMap.get(own);
                decimal num= 0;
                if(ConvertedLeadsMap.containsKey(own))
                    num = ConvertedLeadsMap.get(own);
              
                conversionRateMap.put(own,(num/denum)*100);
            }
            
            //
            
            //Disbursed Loan Accounts
            Map<id,decimal> DisbursedIn3DaysMap = new Map<id,decimal>();
            Date DaysBefore = system.today().addDays(-2);
            Map<id,Decimal> DisbursedLAMap = new Map<id,Decimal>();
            Map<id,Decimal> DisbursedAmountMap = new Map<id,Decimal>();
            Map<id,Decimal> ROIMap = new Map<id,Decimal>();
            Map<id,Decimal> PfAmountMap = new Map<id,Decimal>();
            Map<id,Decimal> InsuranceLoanMap = new Map<id,Decimal>();
            Map<id,Decimal> DirectLoansMap = new Map<id,Decimal>();
            for(Loan_Account__c la:[select id,OwnerId,name,Disbursal_Amount__c,ROI__c,DPD__c, Applicant__r.Product__c,PF_Amount__c,Insurance_Amount__c,DSA_Connector__c,Disbursal_Date__c FROM Loan_Account__c WHERE Disbursal_Amount__c !=null AND Disbursal_Date__c !=null AND CALENDAR_MONTH(Disbursal_Date__c) =:mnth AND CALENDAR_YEAR(Disbursal_Date__c) =:CurrentYear]){
                system.debug('name: '+la.name);
                //Loan Count
                if(DisbursedLAMap.containsKey(la.OwnerId)){
                    DisbursedLAMap.put(la.OwnerId,(DisbursedLAMap.get(la.OwnerId))+1);
                }else{
                    DisbursedLAMap.put(la.OwnerId,1);
                }
                
                //Loan Amount total
                decimal loanAmount = 0;
                if(la.Disbursal_Amount__c !=null)
                    loanAmount = la.Disbursal_Amount__c;
                if(DisbursedAmountMap.containsKey(la.OwnerId)){
                    DisbursedAmountMap.put(la.OwnerId,(DisbursedAmountMap.get(la.OwnerId))+loanAmount);
                }else{
                    DisbursedAmountMap.put(la.OwnerId,loanAmount);
                }
               

                //average roi
                decimal roi = 0;
                if(la.ROI__c != null)
                    roi = la.ROI__c;
                if(ROIMap.containsKey(la.OwnerId)){
                    ROIMap.put(la.OwnerId,ROIMap.get(la.OwnerId)+roi);
                }else{
                    ROIMap.put(la.OwnerId,roi);
                }
               
                //Net PF
                decimal pf = 0;
                if(la.PF_Amount__c != null)
                    pf=la.PF_Amount__c;
                if(PfAmountMap.containsKey(la.OwnerId)){
                    PfAmountMap.put(la.OwnerId,(PfAmountMap.get(la.OwnerId))+pf);
                }else{
                    PfAmountMap.put(la.OwnerId,pf);
                }
                 
                //Insurance Penetration
                if(la.Insurance_Amount__c !=null){
                    if(InsuranceLoanMap.containsKey(la.OwnerId)){
                        InsuranceLoanMap.put(la.OwnerId,(InsuranceLoanMap.get(la.OwnerId))+1);
                    }else{
                        InsuranceLoanMap.put(la.OwnerId,1);
                    }
                }
                
                //Direct Loans
                if(la.DSA_Connector__c ==null){
                    if(DirectLoansMap.containsKey(la.OwnerId)){
                        DirectLoansMap.put(la.OwnerId,(DirectLoansMap.get(la.OwnerId))+1);
                    }else{
                        DirectLoansMap.put(la.OwnerId,1);
                    }
                }
                
                //Cases disbursed in last 3 days as a % of total biz for the month
                if(la.Disbursal_Date__c >=DaysBefore){
                    if(DisbursedIn3DaysMap.containsKey(la.OwnerId)){
                        DisbursedIn3DaysMap.put(la.OwnerId,(DisbursedIn3DaysMap.get(la.OwnerId))+1);
                    }else{
                        DisbursedIn3DaysMap.put(la.OwnerId,1);
                    }
                }
                
            }
            //
            
            //Create Achievement record
            for(User u:[select id, UserRoleId FROM User WHERE Id=:UserTargetMap.keySet()]){
                Achievement__c ac = new Achievement__c();
                if(userMeetingsMap.containskey(u.id)){
                    ac.Meeting_Achievement__c = userMeetingsMap.get(u.id);
                }
                if(conversionRateMap.containsKey(u.id)){
                    ac.Meeting_Lead_Conversation_Ratio__c = conversionRateMap.get(u.id);
                }
                if(allLeadsMap.containsKey(u.id))
                    ac.Lead_Generation_Achieved__c = allLeadsMap.get(u.id);
                if(ConvertedLeadsMap.containsKey(u.id))
                    ac.No_of_Files_Logged_In_Achieved__c = ConvertedLeadsMap.get(u.id);
                if(ApprovedLA_Map.containsKey(u.id) && ac.No_of_Files_Logged_In_Achieved__c !=null){
                    ac.Approval_Ratio_Achieved__c = (ApprovedLA_Map.get(u.id)/ac.No_of_Files_Logged_In_Achieved__c)*100;
                }
                //----Added by Niyaz
                if(SANCTIONEDLA_Map.containsKey(u.id))
                    ac.No_of_Sanctions__c = SANCTIONEDLA_Map.get(u.id);
                //----Added by Niyaz
                if(DisbursedLAMap.containsKey(u.id))
                    ac.No_of_Units_Disbursed_Achieved__c = DisbursedLAMap.get(u.id);
                if(DisbursedAmountMap.containsKey(u.id))
                    ac.Value_Achieved__c = DisbursedAmountMap.get(u.id);
                if(ROIMap.containsKey(u.id) && DisbursedLAMap.containsKey(u.id)){
                    decimal averageROI = ROIMap.get(u.id)/DisbursedLAMap.get(u.id);
                    ac.IRR_Achieved__c = averageROI;
                }
                if(PfAmountMap.containsKey(u.id) && DisbursedAmountMap.containsKey(u.id)){
                    decimal pf =(PfAmountMap.get(u.id)/DisbursedAmountMap.get(u.id));
                    ac.Net_PF_Achieved__c = pf;
                }
                if(InsuranceLoanMap.containsKey(u.id) && DisbursedLAMap.containsKey(u.id)){
                    decimal ins = (InsuranceLoanMap.get(u.id)/DisbursedLAMap.get(u.id));
                    ac.Insurance_Penetration_Achieved__c = ins;
                }
                if(DirectLoansMap.containsKey(u.id) && DisbursedLAMap.containsKey(u.id)){
                    decimal direct =(DirectLoansMap.get(u.id)/DisbursedLAMap.get(u.id));
                    ac.Direct_Biz_Sourced_Achieved__c = direct;
                }
                
                if(DisbursedLAMap.containsKey(u.id)){
                    Decimal DisbursedIn3Days= 0;
                    if(DisbursedIn3DaysMap.containsKey(u.id))
                        DisbursedIn3Days = DisbursedIn3DaysMap.get(u.id);
                    decimal CasesDisbursed = (DisbursedIn3Days/DisbursedLAMap.get(u.id));
                    ac.Cases_Disbursed_in_last_3_days_Ach__c = CasesDisbursed;
                }
                if(ConvertedLeadsAmountMap.containsKey(u.id)){
                    ac.Value_of_Files_Logged_In_Achieved__c = ConvertedLeadsAmountMap.get(u.id);                  
                }
                if(NPA_DPD_Map.containsKey(u.id) && AllLoans.containsKey(u.id)){
                    system.debug('dpd: '+NPA_DPD_Map.get(u.id)+' outof: '+AllLoans.get(u.id));
                    decimal npa= ((NPA_DPD_Map.get(u.id))/(AllLoans.get(u.id)))*100;
                    ac.NPA_Achieved__c = npa;    
                }
                
                if(AchievementMap.containsKey(u.id)){
                    ac.id= AchievementMap.get(u.id).id;
                    AchievementMapUpdate.put(u.id,ac);
                    system.debug('AchievementMapUpdate'+AchievementMapUpdate.values()); 
                    
                }else{
                    ac.User__c = u.id;
                    ac.Month__c = monthMap.get(system.today().month());
                    ac.Year__c = string.valueOf(system.today().year());
                    if(UserTargetMap.containsKey(u.id)){
                          ac.target__c = UserTargetMap.get(u.id).id;
                          ac.OwnerId = UserTargetMap.get(u.id).Branch_Manager__c;   
                        if(UserTargetMap.get(u.id).Meeting_Targets__c !=null)
                            ac.Meetings_Target__c = UserTargetMap.get(u.id).Meeting_Targets__c;
                        if(UserTargetMap.get(u.id).Meeting_Lead_Conversation_Ratio__c !=null)
                            ac.Meeting_Lead_Conversion_Ratio_Target__c = UserTargetMap.get(u.id).Meeting_Lead_Conversation_Ratio__c;
                        if(UserTargetMap.get(u.id).Lead_Generation_Target__c !=null)
                            ac.Lead_Generation_Target__c = UserTargetMap.get(u.id).Lead_Generation_Target__c;
                          
                        if(UserTargetMap.get(u.id).No_of_Files_Logged_In_No__c !=null)
                            ac.No_of_Files_Logged_In_Target__c = UserTargetMap.get(u.id).No_of_Files_Logged_In_No__c;
                        if(UserTargetMap.get(u.id).No_of_Files_Logged_In_Value__c !=null)
                            ac.Value_of_Files_Logged_In_Targets__c = UserTargetMap.get(u.id).No_of_Files_Logged_In_Value__c;
                      
                        if(UserTargetMap.get(u.id).No_of_Units_Disbursed__c !=null)
                            ac.No_of_Units_Disbursed_Target__c = UserTargetMap.get(u.id).No_of_Units_Disbursed__c;
                        if(UserTargetMap.get(u.id).Volumes__c !=null)
                            ac.Value_Target__c = UserTargetMap.get(u.id).Volumes__c;
                       
                        if(UserTargetMap.get(u.id).IRR__c !=null)
                            ac.IRR_Target__c = UserTargetMap.get(u.id).IRR__c;
                        if(UserTargetMap.get(u.id).Net_PF__c !=null)
                            ac.Net_PF_Target__c = UserTargetMap.get(u.id).Net_PF__c;
                        if(UserTargetMap.get(u.id).Insurance_Penetration__c !=null)
                            ac.Insurance_Penetration_Target__c = UserTargetMap.get(u.id).Insurance_Penetration__c;
                        if(UserTargetMap.get(u.id).Direct_Biz_Sourced__c !=null)
                            ac.Direct_Biz_Sourced_Target__c = UserTargetMap.get(u.id).Direct_Biz_Sourced__c;
                        if(UserTargetMap.get(u.id).FTR__c !=null)
                            ac.FTR_Target__c = UserTargetMap.get(u.id).FTR__c;
                        if(UserTargetMap.get(u.id).Query_TAT_Resolution__c !=null)
                            ac.Query_TAT_Resolution_Target__c = UserTargetMap.get(u.id).Query_TAT_Resolution__c;
                        if(UserTargetMap.get(u.id).Approval_Ratio__c !=null)
                            ac.Approval_Ratio_Target__c = UserTargetMap.get(u.id).Approval_Ratio__c;
                        if(UserTargetMap.get(u.id).OTC_PDD_above_norms__c !=null)
                            ac.OTC_PDD_above_norms_Target__c = UserTargetMap.get(u.id).OTC_PDD_above_norms__c;
                        if(UserTargetMap.get(u.id).Cases_Disbursed_in_last_3_days__c != null)
                            ac.Cases_Disbursed_in_last_3_days_Target__c = UserTargetMap.get(u.id).Cases_Disbursed_in_last_3_days__c;
                        if(UserTargetMap.get(u.id).NPA__c !=null)
                            ac.NPA_Target__c = UserTargetMap.get(u.id).NPA__c;
                        if(UserTargetMap.get(u.id).Communication_and_email_skillset__c !=null)
                            ac.Communication_and_email_skillset_Target__c = UserTargetMap.get(u.id).Communication_and_email_skillset__c;
                        if(UserTargetMap.get(u.id).Overall_grooming_attendance_discipline__c !=null)
                            ac.Overall_grooming_attendance_dis_Target__c = UserTargetMap.get(u.id).Overall_grooming_attendance_discipline__c;
                        if(UserTargetMap.get(u.id).Overall_conduct_and_Cross_function_deali__c !=null)
                            ac.Overallconduct_Crossfunction_deal_Target__c = UserTargetMap.get(u.id).Overall_conduct_and_Cross_function_deali__c;
                        if(UserTargetMap.get(u.id).Adherence_to_Ambit_Values__c !=null)
                            ac.Adherence_to_Ambit_Values_Target__c = UserTargetMap.get(u.id).Adherence_to_Ambit_Values__c;
                    }
                }
               if(ac.Target__c != null)
               AchievementMap.put(u.id,ac);
              system.debug('AchievementMap'+AchievementMap.values());  
            }
            //achievement added

            if(AchievementMapUpdate!=null && AchievementMap.size()>0){
                try{
                     system.debug('AchievementMapUpdate'+AchievementMapUpdate.values());
                    upsert AchievementMapUpdate.values();
                    
                }
                catch(dmlexception ex){
                    system.debug('error: '+ex.getMessage());
                }
            }
            if(AchievementMap != null && AchievementMap.size()>0){
                try{
                    system.debug('AchievementMap'+AchievementMap.values());
                    upsert AchievementMap.values();
                  
                }
                catch(dmlexception ex){
                    system.debug('error: '+ex.getMessage());
                }
            }
        }
        
    }
    global void finish(Database.BatchableContext BC){
        
    }
    
}