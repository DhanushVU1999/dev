public class SharedClass {
    private static Double temp {get;set;}
    public static DateTime date1;

    public static Double getTemp() {
        return temp;
    }

    public static void setTemp(Double value) {
        temp = (value * 9 / 5) + 32;
    }
    
    public static void exploreDate(){
        date1 = System.now();
        System.debug(date1 + 'Date');
        Map<Integer,String> List1 = new Map<Integer,String>{1=>'Dhanush'}; 
        System.debug(List1 + 'Map');
    }
}