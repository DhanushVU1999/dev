trigger contTriggerLatest on Contact (after insert, after update) {

    // if(Trigger.isbefore &&( Trigger.isinsert || Trigger.isupdate)){
    //     contTriggerHandler.ContTriggerMethod(Trigger.new);
    // }
    if(Trigger.isafter && (Trigger.isinsert || Trigger.isupdate)){
        contTriggerHandler.ContMethod(Trigger.newMap);
    }
}