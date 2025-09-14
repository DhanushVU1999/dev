trigger Opportunitytrigger on Opportunity (before update) {
    if(trigger.isbefore && (trigger.isupdate  )){
        System.debug('oppmap value in trigger ---'+trigger.newMap); 
    	System.debug('list value in trigger ---'+trigger.new);
        OpportunitytriggerHandler oppval = new OpportunitytriggerHandler();
        oppval.oppvalidation(trigger.newMap);
		 
    }
}