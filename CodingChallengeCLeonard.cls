public with sharing class CodingChallengeCLeonard {
    
    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: Chance Leonard (chance.leonard@revature.net)
    // Date: 04/23/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////
    public CodingChallengeCLeonard() {

    }

    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){
        
        if ( n < 0 ) {
            return -1;
        }

        if ( n == 0 ) {
            return 0;
        } else if ( n == 1 ) {
            return 1;
        }
        
        return nFibonacci(n-1) + nFibonacci(n-2);
        
    }

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {

        for (Integer index1 = 0; index1 < intList.size(); index1++) {

            for (Integer index2 = index1; index2 < intList.size(); index2++) {
                
                if (intList[index1] > intList[index2]) {
                    Integer holder = intList[index1];
                    intList[index1] = intList[index2];
                    intList[index2] = holder;
                }
            }
        }
        return intList;
    }

    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {

        if ( n < 0 ) {
            return -1;
        }

        if ( n == 0 || n == 1) {
            return 1;
        } else {
            return (n * nFactorial(n-1));
        }
    }

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {

        for (Integer index1 = 0; index1 < n; index1++) {

            Integer holder = nList[0];

            for (Integer index2 = 1; index2 < nList.size(); index2++){

                nList[index2-1] = nList[index2];

            }

            nList[nList.size()-1] = holder;
        }

        return nList;
    }

    //After this point I don't know how to do the problems

    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    public static Boolean bracketsAreBalanced( String s ) {

        Boolean isBalanced;
        Integer balancedCounter = 0;
        List<String> strList = new List<String>();

        for (Integer index = 0; index < s.length(); index++) {

            if (s.substring(index, index+1) == '(' || s.substring(index, index+1) == '[' || s.substring(index, index+1) == '{') {
                strList.add(s.substring(index, index+1));
                isBalanced = false;
                balancedCounter++;
            }

            if (s.substring(index, index+1) == ')') {
                if (strList[strList.size()-1] == '(') {
                    strList.remove(strList.size()-1);
                    balancedCounter--;
                } else if (strList[strList.size()-1] == '[' || strList[strList.size()-1] == '{') {
                    isBalanced = false;
                    break;
                }
            } else if (s.substring(index, index+1) == ']') {
                if (strList[strList.size()-1] == '[') {
                    strList.remove(strList.size()-1);
                    balancedCounter--;
                } else if (strList[strList.size()-1] == '(' || strList[strList.size()-1] == '{') {
                    isBalanced = false;
                    break;
                }
            } else if (s.substring(index, index+1) == '}') {
                if (strList[strList.size()-1] == '{') {
                    strList.remove(strList.size()-1);
                    balancedCounter--;
                } else if (strList[strList.size()-1] == '(' || strList[strList.size()-1] == '[') {
                    isBalanced = false;
                    break;
                }
            }
        }

        if (balancedCounter == 0){
            isBalanced = true;
        }

        return isBalanced;
    }

    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /*
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     *      Create a custom field on the Account standard object called Size__c that will be a 
     * picklist containing small/medium/large.
     *     Create a method that retrieves a list of all accounts. 
     *         - If an account has between 1-1000 employees then it is classified as small.
     *         - If an account has between 1001-10000 employees it is classified as medium.
    *         - If an account has more than 10000 employees it is classified as large.
     *     Update the Size__c field on each account to reflect the amount of employees in the Account.
    */
    public static void updateAccountSize( ) {

    }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {
        // List<Lead> listOfLeads = [SELECT Lead_Status__c, Description FROM Lead WHERE Location LIKE '%ca%'];

        // Integer index = 0;

        // for (index = 0; index < listofLeads.size(); index++) {
        //     listOfLeads[index].Lead_Status__c = 'Closed - Not Converted';
        //     listOfLeads[index].Description = 'We are no longer doing business in California.';
        // }

        //send changes to database
    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {
        // List<Opportunity> listOfOpportunities = [SELECT Close_Date__c, Stage FROM Opportunity WHERE Stage != 'Closed Won' /* AND CloseDate < Date */];
    }

    /*  
     *  9. questionMarks declares the str parameter, which can have numbers, letters, and question marks.
     *  It will then check str to see if there are exactly 3 question marks between every pair of two numbers that add up to 10.
     *   If there are, questionMarks returns true. In any other case (including the case where str doesn't contain any two numbers that sum to 10),
     *   questionMarks will return false.
     *
     *   For example, when given the String "arrb6???4b5???ef5", questionMarks returns true because there are 3 question marks between 6 and 4 and
     *   another 3 question marks between 5 and 5 (and both pairs of numbers sum to 10).
     *
     *  Other examples:
     *      str = "aa6?9" => questionMarks returns false
     *      str = "a?7??s?3r1?????5" => questionMarks returns true because there's at least one pair of numbers that sum to 10 (7 and 3) and 3
     *          question marks between those numbers
    */
    public static Boolean questionMarks(String str) {

        List<String> strList = new List<String>();

        for (Integer index = 0; index < str.length(); index++) {
            strList.add(str.substring(index, index+1));
        }

        for (Integer index1 = 0; index1 < strList.size(); index1++) {
            if (strList[index1].isNumeric()) {
                for (Integer index2 = index1; index2 < strList.size(); index2++) {
                    if (strList[index2].isNumeric()) {

                        //

                    }
                }
            }
        }

        //find if str has numbers that sum to 10
        //check between those numbers for 3 question marks
        //check if split will make an empty string for between ?? if using ? to split string
        return null;
    }

    /*
     *   10. multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
     *   You can assume that firstNum < secondNum in all cases.
     *
     *   Examples:
     *       firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
     *       firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
     *          (which are 2, 4, 6, 8, 10, and 12)
    */
    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {

        Integer counter = 0;

        for (Integer index = firstNum; index <= secondNum; index++) {
            if (Math.mod(index, n) == 0) {
                counter++;
            }
        }

        return counter;
    }
    
    /*
     *   11. palindromicity declares a parameter str and returns the degree of palindromicity for that string - i.e. the smallest possible number
     *   of palindromes needed to construct the string.
     *
     *   Examples:
     *      str = "a" => palindromicity returns 1 because "a" backwards is "a"
     *      str = "b3b" => palindromicity returns 1 because "b3b" backwards is "b3b"
     *
     *      str = "ty" => palindromicity returns 2 because str can be broken into two 1 letter palindromes ("t" and "y")
     *      str = "343hmh" => palindromicity returns 2 because str can be broken into two 3 letter palindromes ("343" and "hmh")
     *
     *      str = "iotoihannahracecar" => palindromicity returns 3 because str can be broken into 3 palindromes ("iotoi", "hannah", and "racecar")
     *      str = "abcbabcbabab" => 2. pretty sure it's greedy
     *      str = "abcbabcbababa" => 3. both ways: "abcbabcba" "bab" "a" or "ababa" "bcbabcb" "a"
     *      str = "ababbbabbababa" => 4. NOT GREEDY. 'a' 'babbbab' 'b' 'ababa' is the answer. 
     *                                    'aba' 'bbb' 'abba' 'b' 'aba' is the greedy answer.
    */
    public static Integer palindromicity(String str) {

        Integer counter = 0;

        for (Integer index1 = 0; index1 < str.length(); index1++) {
            for (Integer index2 = index1+1; index2 <= str.length(); index2++) {
                if (str.substring(index1, index2) == str.substring(index1, index2).reverse()) {
                    counter++;
                }
            }
        }

        return counter;
    }
}
