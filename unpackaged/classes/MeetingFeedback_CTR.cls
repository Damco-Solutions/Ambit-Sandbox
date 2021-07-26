public class MeetingFeedback_CTR {
    public String MeetingId {get;set;}
    public string feedbackcheck{get;set;}
    public Integer rating { get; set; }
    public string response{ get; set; }
    List<Meeting_Rating__c> MeetingList;
    public MeetingFeedback_CTR () {
        MeetingId = ApexPages.currentPage().getParameters().get('id');
        feedbackcheck= 'False';
        response='False';
    }
    public PageReference InitPage() {
        MeetingList=[select id,Name,Meeting__c FROM  Meeting_Rating__c WHERE Meeting__c=:MeetingId];
        if(MeetingList.size()>0){
          response='True';
          feedbackcheck='True';
        }
        return null;		
    }
    
    public PageReference save(){
        system.debug('selected rating>>>>>'+rating);
        if(rating!=null){
            Meeting_Rating__c mr=new Meeting_Rating__c();
            mr.Meeting__c=MeetingId;
            mr.Feeback__c=string.valueOf(rating);
            insert mr;
            feedbackcheck='True';
        }
        if(rating==null){
         feedbackcheck='False';   
        }
        
        
        return null;
        
    }
}