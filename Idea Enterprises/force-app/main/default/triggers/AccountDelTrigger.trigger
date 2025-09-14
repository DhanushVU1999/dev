trigger AccountDelTrigger on Account (before delete, after update) {
    AccountDelTriggerHandler accdel = new AccountDelTriggerHandler();
    if(trigger.isBefore && trigger.isdelete){
        accdel.accHandFunc(trigger.oldMap);
    }
    if(trigger.isAfter && trigger.isUpdate){
        accdel.accOppFunc(trigger.newMap);
    }
    
}