trigger caseTrigger on Case (after insert,after update) {
    casetriggerhandler cth = new casetriggerhandler();
    if(trigger.isafter && (trigger.isinsert ||trigger.isupdate) ){
      cth.updatedate(Trigger.newMap);  
    }

}