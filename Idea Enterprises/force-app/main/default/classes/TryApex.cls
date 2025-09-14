public with sharing class TryApex {
    @AuraEnabled
    public static List<Case> RetrieveCase(Integer limitNum){
        List<Case> caseList = new List<Case>();
        try {
            caseList = [SELECT Id, CaseNumber, Status FROM Case LIMIT :limitNum];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        System.debug('limitnum is '+limitNum);
        return caseList;
    }
    
}