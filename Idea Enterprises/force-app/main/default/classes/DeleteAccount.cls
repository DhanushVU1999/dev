public class DeleteAccount {
    
    public static void DltAccount(){
        Account[] accts = [Select name From Account where createdDate=TODAY];
		Delete accts;
    }
    static{
        System.debug('static printed');
    }

}