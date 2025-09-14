trigger contactTriggernum on Contact (after insert, after delete) {
    contactTriggernumHandler ctnm = new contactTriggernumHandler();
    if(Trigger.isAfter){
        if(Trigger.isinsert){
            ctnm.triggerHandler2(Trigger.newMap);
        }
        if(Trigger.isdelete){
            ctnm.triggerHandler2(Trigger.oldMap);
        }
    }

}