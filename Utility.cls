/**  
* Chicago Cloud Group (c) - 2019
*
* Primary Utility class for all repetitive functions
* in the org
*
* Created By: Alexander Miller
* Created Date: 6/25/2019
* Tested By: UtilityTest
*
* Modified By                       Alias                Modified Date              Reason
* -------------------------------------------------------------------------------------------
* 
*/
public class Utility {

    /**
    * getObjectFields
    *
    * Fucntion which takes the object name given and returns 
    * all of the API names of the fields. Primarly used for dynamic queries
    *
    * @param objectName - Label of the of Objecet (NOT THE API NAME)
    * @return List<String> - Strings with the API names of the fields
    */
    public static List<String> getObjectFields(String objectName)
    {
        SObjectType accountType = Schema.getGlobalDescribe().get(objectName);
        Map<String,Schema.SObjectField> mfields = accountType.getDescribe().fields.getMap();
        
        List<String> listOfFields = new List<String>();

        listOfFields.addAll(mfields.keySet());

        return listOfFields;
    }
    
    /**
    * generateRandomString 
    * 
    * Function which allows for parallel processing in all test classes
    *
    * @param len - whole integer representing the number of characters the rnadom string should contain
    * @return String - random string, length based on param len
    *
    * Inspiration: https://salesforce.stackexchange.com/questions/43823/how-do-i-generate-a-random-string
    */
    public static String generateRandomString(Integer len) 
    {
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        String randStr = '';
        while (randStr.length() < len)
        {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        return randStr; 
    }

    /**
    * generateRandomNumbersOnly 
    * 
    * Function which allows for parallel processing in all test classes
    *
    * @param len - whole integer representing the number of characters the rnadom string should contain
    * @return String - random string, length based on param len
    *
    * Inspiration: https://salesforce.stackexchange.com/questions/43823/how-do-i-generate-a-random-string
    */
    public static String generateRandomNumbersOnly(Integer len) 
    {
        final String chars = '0123456789';
        String randStr = '';
        while (randStr.length() < len)
        {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            randStr += chars.substring(idx, idx+1);
        }
        return randStr; 
    }

    /**
    * isBetweenDates
    *
    * Funciton which decides if the date provided
    * (evalDate) is between Start and End Dates
    *
    * @param startDate - Date, the start of the Date bound
    * @param endDate - Date, the end of the Date bound
    * @param evalDate - Date being evaluated by the other two
    *
    * @return Boolean - True if Eval is between Start and End. False otherwise
    */
    public static Boolean isBetweenDates(Date startDate, Date endDate, Date evalDate)
    {
        if(startDate == null || endDate == null || evalDate == null)
        {
            return false;
        }

        if(evalDate >= startDate && evalDate <= endDate)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
    * isBetweenDates
    *
    * Funciton which decides if the date provided
    * (evalDate) is between Start and End Dates
    *
    * @param startDate - Date, the start of the Date bound
    * @param endDate - Date, the end of the Date bound
    * @param evalDate - Date being evaluated by the other two
    *
    * @return Boolean - True if Eval is between Start and End. False otherwise
    */
    public static Boolean isBetweenDates(DateTime startDate, DateTime endDate, DateTime evalDate)
    {
        if(startDate == null || endDate == null || evalDate == null)
        {
            return false;
        }

        if(evalDate >= startDate && evalDate <= endDate)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}