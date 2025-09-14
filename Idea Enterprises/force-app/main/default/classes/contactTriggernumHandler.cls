public class contactTriggernumHandler {
   
 
public void triggerHandler(List<contact> cons){
        
        set<id> accids = new set<id>();
        for(contact con : cons){
            accids.add(con.AccountId);
        }
        if(!accids.isEmpty()){
            List<Account> accs = [select id, name, NumberOfContacts__c,(Select id from contacts) from account where id in : accids];
            
            for(account acc:accs){
                List<contact> conts = acc.contacts;
                acc.NumberOfContacts__c = conts.size();
            }
            update accs;
        }
        
    }
    
    
public void triggerHandler2(Map<id,contact> conmap){
        
        try{
                set<id> accids = new set<id>();
            for(contact con:conmap.values()){
                accids.add(con.accountid);
            }
            if(!accids.isempty()){
                list<account> accs = [select id,name, (select id from contacts) from account where id in : accids];
                for (Account acc : accs){
                    List<contact> cons = acc.contacts;
                    Acc.NumberOfContacts__c = cons.size();
                }
                update accs;
            }
        }
            catch(exception e){
                system.debug(e);
                //throw new exception(e);
            }
        
        
    }

}