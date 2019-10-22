/**  
* Chicago Cloud Group (c) - 2019
*
* Primary Utility class for all repetitive functions
* in the org
*
* Created By: Alexander Miller
* Created Date: 6/25/2019
*
* Modified By                       Alias                Modified Date              Reason
* -------------------------------------------------------------------------------------------
* 
*/
@isTest
public class UtilityTest {


    public static TestMethod void testGetObjectFields()
    {    
        Test.startTest();
        
        System.AssertNotEquals(null, Utility.getObjectFields('Account'));

        Test.stopTest();
    }

    public static TestMethod void testGenerateRandomString()
    {    
        Test.startTest();
        
        System.AssertNotEquals(null, Utility.generateRandomString(10));

        Test.stopTest();
    }

    public static TestMethod void testGenerateRandomNumbersOnly()
    {    
        Test.startTest();
        
        System.AssertNotEquals(null, Utility.generateRandomNumbersOnly(10));

        Test.stopTest();
    }

    public static TestMethod void testIsBetweenDates()
    {    
        Test.startTest();
        
        System.AssertEquals(true, Utility.isBetweenDates(System.Today().addDays(-1), System.Today().addDays(1), System.Today()));

        System.AssertEquals(false, Utility.isBetweenDates(System.Today().addDays(1), System.Today(), System.Today().addDays(2)));

        System.AssertEquals(false, Utility.isBetweenDates(null, System.Today().addDays(1), System.Today()));

        System.AssertEquals(false, Utility.isBetweenDates(System.Today().addDays(-1), null, System.Today()));

        System.AssertEquals(false, Utility.isBetweenDates(System.Today().addDays(-1), System.Today().addDays(1), null));

        Test.stopTest();
    }
    
    public static TestMethod void testIsBetweenDatesDateTime()
    {    
        Test.startTest();
        
        System.AssertEquals(true, Utility.isBetweenDates(System.Now().addDays(-1), System.Now().addDays(1), System.Now()));

        System.AssertEquals(false, Utility.isBetweenDates(System.Now().addDays(1), System.Now(), System.Now().addDays(2)));

        System.AssertEquals(false, Utility.isBetweenDates(null, System.Now().addDays(1), System.Now()));

        System.AssertEquals(false, Utility.isBetweenDates(System.Now().addDays(-1), null, System.Now()));

        System.AssertEquals(false, Utility.isBetweenDates(System.Now().addDays(-1), System.Now().addDays(1), null));

        Test.stopTest();
    }
}