public class Cisneros_Josue_P0B{

    public static Integer nFibonacci( Integer n ){
        if(n == 0){
            return 0;
        }
        else if(n == 1){
            return 1;
        }
        else{
            return nFibonacci(n-1) + nFibonacci(n-2);
        }
    }
    
    public static List<Integer> sortList( List<Integer> intList ) {
        for(Integer i=0; i<intList.size(); i++ ){
            for(Integer j=i+1; j<intList.size(); j++){
                Integer tempValue;
                if(intList[i]>intList[j]){
                    tempValue=intList[i];
                    intList[i]=intList[j];
                    intList[j]=tempValue;
                }
                
            }
        }
        for(Integer a:intList){
            System.debug(''+a);
        }
        Return intList; 
    }
    
    public static Integer nFactorial( Integer n) {
    if(n == 0){
        return 1;
    }
    else{
        return (n * nFactorial(n-1));
    }
    }
    
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {
        for(Integer i = 0; i<n; i++){
            Integer tempValue = nList.get(0);
            for(Integer j=0; j<nList.size()-1;j++){
                nList.set(j,nList.get(j+1));
            }
            nList.set(nList.size()-1,tempValue);
            System.debug(nList);
        }
        return nList;
    }
    
    public static Boolean bracketsAreBalanced( String s ) {
        return true;
    }
    
    public static void updateAccountSize( ) {
        List<Account> acctList = [SELECT Id,NumberOfEmployees,Size__c FROM Account];
        for(Account currentAcct : acctList){
            if(currentAcct.NumberOfEmployees == null || currentAcct.NumberOfEmployees == 0){
                continue;
            }
            if(currentAcct.NumberOfEmployees >= 1 && currentAcct.NumberOfEmployees <= 1000){
                currentAcct.Size__c = 'small';
                Database.update(currentAcct);
            }
            
            else if(currentAcct.NumberOfEmployees >= 1001 && currentAcct.NumberOfEmployees <= 10000){
                currentAcct.Size__c = 'medium';
                Database.update(currentAcct);
            }
            if(currentAcct.NumberOfEmployees > 10000){
                currentAcct.Size__c = 'large';
                Database.update(currentAcct);
            }
        }
    }
    
    public static void updateCALeads( ) {
        List<Lead> leadList = [SELECT Id, Address, Status, Description FROM Lead];
        for(Lead currentLead : leadList){
            if(currentLead.Address.getState() == 'California' && currentLead.Address.getStateCode() =='CA'){
                currentLead.Status = 'Closed';
                currentLead.Description = 'We are no longer doing business in California.';
                Database.update(currentLead);
            }
        }
    }
    
    public static void closePastDueOpportunities( ) {
        List<Opportunity> oppList = [SELECT Id,CloseDate,StageName FROM Opportunity WHERE CloseDate < 2021-04-26 AND StageName != 'Closed Won' ];
        Date currentDate = Date.today();
        for(Opportunity currentOpp : oppList){
            currentOpp.StageName = 'Closed Lost';
            Database.update(currentOpp);
        }
    }
    
    public static Boolean questionMarks(String str){ 
        Integer questionCount=0;
        Integer sumToTen=0;  
        return True;
    }    
    
    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
            Integer currentNum = firstNum;
            Integer countOfMultiples=0;
            if(currentNum == 0){
                currentNum++;
            }
            while(currentNum>=firstNum && currentNum<=secondNum){
                if(math.mod(currentNum, n) == 0){
                    countOfMultiples++;
                }
                currentNum++;
            }
            return countOfMultiples;
    }
    
}