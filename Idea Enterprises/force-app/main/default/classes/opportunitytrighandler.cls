public class opportunitytrighandler {

    public void updatesum(map<id,opportunity> oppmap){
        set<id> accid = new set<id>();
        for(opportunity o:oppmap.values()){
           accid.add(o.Accountid); 
        }
         list<account> acclist = new  list<account>();
      list<account> acc = [select id, Total_Revenue__c from account where id in:accid];
      Map<id,AggregateResult> axc = new Map<id,AggregateResult>();  
      list<AggregateResult> agr = ([select Accountid, SUM(Amount) amt from opportunity where accountid in:accid group by accountid]);
       
        for(AggregateResult a:agr){
            id ap = (Id)a.get('Accountid');
            axc.put(ap,a);
            
        }
        for(account a:acc){
           a.Total_Revenue__c= (Decimal)axc.get(a.id).get('amt'); 
           acclist.add(a); 
        } 
         
        update acclist;
            
    }
}