public class AccountDelTriggerHandler {
    
    public void accHandFunc(Map<Id,account> accMap){
        Map<id,Account> accm =  new Map <id,account>([Select Id, (Select id from opportunities) from Account where Id IN:accMap.keySet()]);
        for(Account acc:accMap.values()){
            
            if(accm.get(acc.Id).opportunities!=null && accm.get(acc.Id).opportunities.size()>0) {
                acc.addError('You cannot delete this account as it has opportunity related to it');
            }
        }
    }
    public void accOppFunc(Map<id,account> accMap){
        List<opportunity> oppList = new List<opportunity>();
        Map<id,Account> accm =  new Map <id,account>([Select Id,Rating, (Select id from opportunities) from Account where Id IN:accMap.keySet()]);
        for(Account acc:accMap.values()){
            
            if(accm.get(acc.Id).opportunities!=null && accm.get(acc.Id).opportunities.size()>0 && accm.get(acc.Id).Rating == 'Warm') {
                for(opportunity o:accm.get(acc.Id).opportunities){
                    o.StageName ='Closed Lost';
                	oppList.add(o);
                }
                
            }
        }
        if(oppList.size()>0){
            update oppList;
        }
        
        
    }
}