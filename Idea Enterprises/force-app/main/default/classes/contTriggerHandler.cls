public with sharing class contTriggerHandler {
    // public static void ContTriggerMethod(List<contact> contlist){
    //     //List<Contact> contlist1 = [select id, name from contact]
    //     for(contact con : contlist){
    //         con.Firstname = con.Lastname + 'TRIGGER';
    //     }
    // }

    public static void contMethod(Map<id,contact> contMap){
        list<account> acclist = new list<account>();
        Set<id> accidlist = new Set<id>();
        for(contact con : contMap.values()){
            accidlist.add(con.Accountid);
        }
        for(account acc : [select id, name, (select id,name from contacts) from account where id IN:accidlist]){
            acc.name = acc.contacts[0].name + ' ACCOUNT TRIGGER';
            acclist.add(acc);
        }
        update acclist;
    }
}