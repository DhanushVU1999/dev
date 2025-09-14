public class OpportunitytriggerHandler {
    
    public void oppvalidation(Map<id,opportunity> oppMap){
        System.debug('oppmap value ---'+oppMap);
       Map<Id,opportunity> oMap = new Map<Id,opportunity>([Select id, CloseDate from opportunity where id in: oppMap.keyset()]);
        
        for(opportunity o:oppMap.values()){
            if(oppMap.get(o.id)!=null && oppMap.size()>0 && oppMap.get(o.id).CloseDate < System.now()){
                o.addError('Cant create this record. Check the closure date');
                
                
            }
        }
    } 
        /*for (opportunity o:oppMap){
            if(o.CloseDate < System.now()){
                
               o.adderror('not possible');
            }
              
        }*/
    }