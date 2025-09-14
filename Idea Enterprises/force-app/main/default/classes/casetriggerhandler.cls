public class casetriggerhandler {

    
    public void updatedate(Map<Id,Case> casemap){
       set<id> conid = new set<Id>(); 
        for(Case co:casemap.values()){
         conid.add(co.Contactid);   
        }
     
        Map<Id , Contact> conmap = new Map<Id , Contact>([select id ,LastCaseDate__c,(select id,lastmodifieddate from cases order by lastmodifieddate desc limit 1 ) from contact where id in: conid]);
        List<Contact>  updatedcontact = new List<Contact>();  
            for(Case c:casemap.values()){
                
               Contact con = conmap.get(c.Contactid);
                con.LastCaseDate__c =conmap.get(c.Contactid).cases[0].lastmodifieddate ;
                updatedcontact.add(con);
				}
        
        if(updatedcontact!=null && updatedcontact.size()>0){
            update  updatedcontact;
        }
        
    }
}