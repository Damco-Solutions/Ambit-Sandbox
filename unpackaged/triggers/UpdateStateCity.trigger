trigger UpdateStateCity on Contact (after insert,after update) {
    Map<id,contact> IdContactMap=new Map<Id,contact>();
    if(trigger.isInsert || trigger.isUpdate){
          if(UpdateStateCityRecursionHelper.disableRecursion==false){
                UpdateStateCityRecursionHelper.disableRecursion = true;
        for(Contact con:trigger.new){
            
            IdContactMap.put(con.id,con);
            
        }
        if(IdContactMap.size() > 0){
            UpdateSateandCityonApplicant.UpdateStateandCity(IdContactMap) ;
        }
    }
    }
}