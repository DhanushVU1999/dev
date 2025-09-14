trigger oppTrigger on Opportunity (after insert,after update) {
  opportunitytrighandler han = new opportunitytrighandler();
    
    if(trigger.isafter && (trigger.isupdate || trigger.isinsert)){
        
       han.updatesum (trigger.newMap);
    }
    

}