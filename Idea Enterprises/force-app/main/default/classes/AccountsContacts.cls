public class AccountsContacts {
	
    public static void AddAccounts(){
        Account [] accts = new Account[0];
        for (Integer i=0;i<10;i++) {
        accts.add(new Account(name = 'Account'+ i));
        }
        insert accts;
        Contact[] conts = new Contact[0];
        for (Account acct:accts) {
            conts.add(new Contact(lastname = acct.name, AccountId = acct.Id));
      	}
    	insert conts;
    }
    
}