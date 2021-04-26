    //Lead off your class with the following comment, filled out with 
    //your information.

    /////////////////////////////////////////////////////////////////
    //
    // Name: Coding Challenges
    // Author: brett.spokes@revature.net
    // Date: 4/23/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////

    /*Write the following methods in a class called P0B. 
    Note: The method signatures are given.*/
    public class BrettSpokesCodingChallenge {

        public static Integer nFibonacci(Integer n)
        {
            Integer a = 0;
            Integer b = 1;
            Integer c = 0;  
            
            if(n == 0) {
                System.debug(' '+a);
                return a;
            }
            if(n == 1) {
                System.debug(' '+b);
                return b;
            }
            System.debug(' '+a);
            for(Integer i=1; i<n ; ++i)   
                {    
                    c=a+b;    
                    System.debug(' '+c);
                    a=b;    
                    b=c;    
                }
            return c;
        }

        public static List<Integer> sortList( List<Integer> intList ) {
            List<Integer> newList = new List<Integer> {};
            List<Integer> inputList = intList.clone();
            List<Integer> targetList = intList.clone();
            Integer test = 0;

            System.debug(intList);
            System.debug('Original Size: ' + intList.size());
            System.debug('Inputlistsize: ' + inputList.size());
            
            
            //Psuedo
            // Find smallest number in a list
            // Add it to a holder
            // Delete it from the original list to allow for duplicates of values, if I didn't remove it I would always just get the smallest
            // Repeat until new list length = original list lengtn 

            while(newList.size() != targetList.size())
            {
                Integer holder = 100000;
                Integer holderPos = 0;
                Integer i = 0;
                for( i = 0 ; i != inputList.size() ; i++)
                {	
                    if(holder > inputList[i])
                    {
                        holder = inputList[i];
                        holderPos = i;
                    }
                    System.debug(holder);
                }
                
                //outside of the sort for smallest
                //add it onto newList        
                newList.add(holder);    
                inputList.remove(holderPos);
                
                
                
                System.debug(inputList);
                System.debug(newList);
            }
            //List<Integer> nums = new List<Integer> { 5, 2132, 2, 44 };
            //sortList(nums);
            
            targetList.sort();
            System.debug('input' + inputList);
            System.debug('new' + newList);
            System.debug('target' + targetList);
            return targetList;
        }

        public static Integer nFactorial(Integer n) {
            // 5! = 5*4*3*2*1 
            Integer countdown = n-1;
            Integer total = n;
            while(countdown != 0)
            {            
                total = total * (countdown);
                System.debug('Current countdown ' + n);
                System.debug('Total: ' + total);
                countdown--;
            }
            
            return total;
        }

        public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) 
        {
            System.debug('Original List ' + nList + ' rotate number ' + n);
            List<Integer> outList = nList.clone();
            Integer length = outList.size();
            
            for(Integer i = 1; i <= n; i++) {
                Integer first = outList[0];
                for(Integer j=0; j<length-1; j++)
                {
                    outList[j]=outList[j+1];
                }
                outList[length-1]=first;
                
            }
            System.debug('New List: ' + outList);
            return outList;
        }

        public static Boolean bracketsAreBalanced( String s ) {
            // if last position is opposite to first position, 
            // check if second to last is opposite to second etc.
            // case first position has to = (, {, [
            // case has to be even
            // 
            // 
            // split string into two from center, iterate through first half while comparing the
            // values to their reverse while going comparing against second half in descending order
            Boolean returnBool = false;
            Integer evenCheck = 1;
            String noWhiteSpace = s.deleteWhitespace();
            
            evenCheck = math.mod(noWhiteSpace.length(), 2);
            
            if ( ( s.startsWith('(') || s.startsWith('{') || s.startsWith('[') ) && evenCheck == 0)
            {
                // s ({[]}) length = 6
                // rs ]})
                // ls ({[
                // rs reversed )}]
                
                String rightSide = noWhiteSpace.right(noWhiteSpace.length()/2);
                String leftSide = noWhiteSpace.left(noWhiteSpace.length()/2);
                Integer lengthSave = (noWhiteSpace.length()/2);
                rightSide = rightSide.reverse();
                
                System.debug(leftSide);
                System.debug(rightSide);
                System.debug('Length ' + lengthSave);
                
                for ( Integer i = 0 ; i != lengthSave ; i++ )
                {
                    if (
                        ( leftSide.startsWith('(') && rightSide.startsWith(')') ) 
                        ||
                        ( leftSide.startsWith('{') && rightSide.startsWith('}') )
                        ||
                        ( leftSide.startsWith('[') && rightSide.startsWith(']') )
                        ||
                        ( leftSide.startsWith(')') && rightSide.startsWith('(') )
                        ||
                        ( leftSide.startsWith('}') && rightSide.startsWith('{') )
                        ||
                        ( leftSide.startsWith(']') && rightSide.startsWith('[') )
                    )
                    //Not comprehensive, doesn't do deeper checks against the first and second
                    //so while ()() is true and should return true
                    //a case unaccounted for is (}{), which is false, but will return true.
                    //would probably make the starters ' ( { [ ' be held in a variable
                    //and only allow starts from the left side using and endcap ' ) } ] '
                    //if that variables value was the starter of the set
                    {
                        leftSide = leftSide.right(leftSide.length()-1);
                        rightSide = rightSide.right(rightSide.length()-1);
                        System.debug('still true');
                        System.debug(leftSide);
                        System.debug(rightSide);
                    }
                    else 
                    {
                        System.debug('false');
                        return false;
                    }
                }      
                return true;
            }
            System.debug('false');
            return false;
        }

        public static void updateAccountSize( ) {
		List<Account> accs = [SELECT Id, NumberOfEmployees, Size__c FROM Account WHERE NumberOfEmployees > 0];
        System.debug('accs' + accs);
        for(Account a: accs)
        {
            System.debug('In loop');
            if(a.NumberOfEmployees > 10000)
            {
            	a.Size__c = 'large';  
            }
            else if(a.NumberOfEmployees > 1000)
            {
            	a.Size__c = 'medium';   
            }
            else
            {
            	a.Size__c = 'small';           
            }
        }     
        update accs;
        }

        public static void updateCALeads( ) {
            List<Lead> leads = [SELECT Name, State, Description, Status FROM Lead WHERE State LIKE '%ca%'];
            for(Lead a: leads)
                {
                    a.Status = 'Closed - Not Converted';
                    a.Description = 'We are no longer doing business in California.';
                }
            System.debug(leads);
            update leads;
        }

        public static void closePastDueOpportunities( ) {
            List<Opportunity> opps = [SELECT Name, StageName, CloseDate FROM Opportunity WHERE CloseDate < TODAY AND StageName != 'Closed Won'];
            for(Opportunity op: opps)
                {
                    op.StageName = 'Closed Lost';
                }
            System.debug(opps);
            update opps;
        }

        public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
            //Create a loop from firstNum to lastNum, do mods for each step, 
            //if mod returns 0, multiple count++
            Integer count = 0;
            for( Integer i = firstNum ; i != secondNum+1 ; i++)
            {
                if(math.mod(i, n) == 0)
                {
                    System.debug('New Multiple ' + i);
                    count++;
                }
            }
            System.debug('Multiples Count ' + count);
            return count;
        }
        
        public static Boolean questionMarks(String str) {
            Boolean isTrue = false;
            Boolean checkQuestionMark = false;
            Boolean firstNumFound = false;
            Integer firstNumber = -1;
            //Find first number
            //Find second number
            //if it equals 10 take out a substring starting from index fn to index sn
            //iteriate through substring and count for '?', if equals exactly 3 set isTrue to true, break;
            //if it equals 4 break;
            //set second number to first and look for a new second number
            Integer questionMarkCount = 0;
            //Get it into characters that are symbols and not data representation for ease of use
            String[] chars = str.split('');
            System.debug(chars);       
            
            for(Integer i = 0 ; i != str.length() ; i++)
            {
                if(chars[i] == '0' || chars[i] == '1' || chars[i] == '2' || chars[i] == '3' 
                   || chars[i] == '4' || chars[i] == '5' || chars[i] == '6' 
                   || chars[i] == '7' || chars[i] == '8' || chars[i] == '9')
                {
                    System.debug('A number has been found ' + chars[i] );
                    
                    if(firstNumFound == true && checkQuestionMark == true && questionMarkCount == 3)
                    {
                        System.debug('Second Number will be: ' + chars[i]);
                        if(firstNumber + (integer.valueof(chars[i])) == 10)
                        {
                            System.debug('It passed, it is true');
                            isTrue = true;
                            break;
                        }
                        else
                        {
                            questionMarkCount = 0;
                            firstNumber = integer.valueof(chars[i]);
                            System.debug('First Number will now be: ' + firstNumber);
                        }
                    }
                    else if (firstNumFound == true && questionMarkCount != 3)
                    {
                        questionMarkCount = 0;
                        firstNumber = integer.valueof(chars[i]);
                        System.debug('First Number will now be: ' + firstNumber);
                    }
                                             
                    if(firstNumFound == false)
                    {
                        firstNumFound = true;
                        checkQuestionMark = true;
                        firstNumber = integer.valueof(chars[i]);
                        System.debug('First Number will be: ' + firstNumber);
                    }                         
                }                       
                System.debug(chars[i]);
                if(chars[i] == '?' && checkQuestionMark == true)
                {
                    questionMarkCount++;
                    System.debug('Question Mark Count: ' + questionMarkCount);
                    if(questionMarkCount > 3)
                    {
                        System.debug('This pair has failed');
                        firstNumFound = false;
                        checkQuestionMark = false;
                    }
                }
            }
          
            System.debug(String.join(chars, ''));
            System.debug('Final Result ' + isTrue);
            return isTrue;
            
        }

        public static Integer palindromicity(String str) {
            //iotoihannahracecar
            //From left to right, find palindromes
            //Count amount that the first letter is present
            //from first position to last check
            //create a substring ending at the last position
            //if it equals itself reversed it's true
            //if it doesn't move to the next last position
            //keep trying, count it's length at the end and then subtract it from the
            //main string. Keep working until the original string is diminished 
            String myStr = str;   
            String[] dummyStr = myStr.split('');
            String letterToCheckAgainst;
            Integer lastPosition = -1;
            Integer[] positionsArray = new Integer[]{};
            Integer palindromeCount = 0;
            Boolean startingAgain = false;
            
            for(Integer i = 0 ; i != dummyStr.size() ; i++)
            {
                letterToCheckAgainst = dummyStr[i];
                if (startingAgain == true)
                {
                    letterToCheckAgainst = dummyStr[0];
                    startingAgain = false;
                }
                System.debug('Current Letter ' + letterToCheckAgainst);
                for(Integer j = dummyStr.size()-1 ; j != 0 ; j--)
                {
                    if (dummyStr[j] == letterToCheckAgainst)
                    {
                        positionsArray.add(j);
                        System.debug(positionsArray);
                        if(j > lastPosition)
                        {
                            lastPosition = j;
                            
                            System.debug('Last Position of letter ' + letterToCheckAgainst + ' is at: ' + lastPosition);
                        }   
                    }          
                }
    
                System.debug('Resulting Palindrome ' + myStr.left(lastPosition+positionsArray.size()));
                System.debug('Last position array size ' + (positionsArray.size()-1));
                System.debug('lastPosition+1 ' + (lastPosition+1));
                for(Integer b = 0 ; b <= positionsArray.size()-1 ; b++)
                {
                    System.debug('Trying ' + myStr.left((positionsArray[b]+1)) + ' against ' + myStr.left((positionsArray[b]+1)).reverse());
                    if(myStr.left((positionsArray[b]+1)) == (myStr.left((positionsArray[b]+1)).reverse()))
                    {
                        System.debug('it equals its reverse');
                        palindromeCount++;
                        myStr = myStr.right(myStr.length()-(positionsArray[b]+1));
                        System.debug('My new string is ' + myStr);
                        dummyStr = myStr.split('');
                        i=0;
                        lastPosition = -1;
                        startingAgain = true;
                        positionsArray.clear();
                        break;
                    }
                    System.debug(' for b ' + (positionsArray[b]+1) );
                }
    
                System.debug('Dummystr ' + dummyStr + ' Current i ' + i);
                
            }
            
            letterToCheckAgainst = String.join(dummyStr, '');
            System.debug(letterToCheckAgainst.length());
            if(letterToCheckAgainst.length() > 0)
            {
                for(Integer l = 0 ; l != letterToCheckAgainst.length() ; l++)
                {
                    palindromeCount++;
                }
            }
            
            System.debug('Final result: ' + palindromeCount);
            return palindromeCount;
        }

    }

    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    //public static List<Integer> sortList( List<Integer> intList ) {

    //}

    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    //public static Integer nFactorial( Integer n) {

    //}

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    //public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {

    //}

    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    //public static Boolean bracketsAreBalanced( String s ) {

    //}

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
    //public static void updateAccountSize( ) {

    //}

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    //public static void updateCALeads( ) {

    //}

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    //public static void closePastDueOpportunities( ) {

    //}

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
    //public static Boolean questionMarks(String str) {
    //}

    /*
     *   10. multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
     *   You can assume that firstNum < secondNum in all cases.
     *
     *   Examples:
     *       firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
     *       firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
     *          (which are 2, 4, 6, 8, 10, and 12)
    */
    //public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
    //}
    
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
    //public static Integer palindromicity(String str) {
    //}