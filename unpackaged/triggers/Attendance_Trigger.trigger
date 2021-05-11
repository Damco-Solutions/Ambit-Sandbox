trigger Attendance_Trigger on Attendance__c (after insert) {
    if(trigger.isInsert && trigger.isAfter){
        Map<id,id> attend_OwnerMap = new Map<id,id>();
        for(Attendance__c att :trigger.new){
            attend_OwnerMap.put(att.id,att.OwnerId);
        }
        if(attend_OwnerMap !=null){
            ShareRecordsToManagers.shareRecords(attend_OwnerMap,'Attendance__c');
        }
    }

}