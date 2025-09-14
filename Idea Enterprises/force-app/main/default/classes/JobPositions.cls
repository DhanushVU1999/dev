public class JobPositions {
    
    public static List<Job_Position__c>  fetchJobPositions(){
        List<Job_Position__c> JobList = [SELECT Position__c,Min_Salary__c,Max_Salary__c FROM Job_Position__c];
        return JobList;
    }

}