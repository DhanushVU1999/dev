public with sharing class CreateAccount {
    @AuraEnabled
    public static String cAccount(string accfields){
        AccWrapper accWrap = (AccWrapper)JSON.deserialize(accfields, AccWrapper.class);
        Account acc = new Account();
        acc.name = accWrap.accName;
        acc.industry = accWrap.accIndustry;
        acc.phone = '1234567890';
        acc.website = 'www.google.com';
        insert acc;

        return JSON.serialize(acc.id);
    }
    class AccWrapper{
        public string accName;
        public string accIndustry;
    }
}