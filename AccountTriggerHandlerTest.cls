/**
* Chicago Cloud Group (c) - 2019
*
* AccountTriggerHandlerTest
*
* Created By: Alexander Miller
* Created Date: 08/09/2019
*
* Modified By             Alias             Modified Date              Reason
* ------------------------------------------------------------------------------
* 
*/
@isTest
public class AccountTriggerHandlerTest {

    @TestSetup
    static void makeData()
    {
        // Create one Account to work with for the rest of the tests
        TestDataFactory.createAccount(null, null, true);   
    }

    public static TestMethod void testAccountRetrieval()
    {
        Test.StartTest();

        List<Account> listOfAccounts = ([SELECT Id, Name, Phone FROM Account]);

        // [perform tests and updates here]

        // Assert logic here
        System.assertNotEquals(0, listOfAccounts.size());

        Test.StopTest();
    }
}