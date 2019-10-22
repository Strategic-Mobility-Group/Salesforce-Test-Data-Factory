/**   
* Chicago Cloud Group (c) - 2019
*
* Primary Test data factory and utility class 
* for Apex development
*
* Following objects included in this Test Data Factory:
* 
* - Account
* - Contact
* - Opportunity
* - Campaign
* - Campaign Member
* - Product
* - Price Book Entry
* - Task
* - Event
* - Lead
* - Opportunity Product (line)
* - User (Sales & System Administrator)
*
* Created By: Alexander Miller
* Created Date: 6/25/2019
*
* Modified By                       Alias                Modified Date              Reason
* -------------------------------------------------------------------------------------------
*
*/
@isTest
public class TestDataFactory {

    /**
    * createAccount
    *
    * Function which creates a single Account with manual data allowed
    * if any of the optional fields (name) are null, then 
    * they will be assigned generic system versions
    *
    * @param name - Name of the Account
    * @param phone - Phone number of the Account
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Account
    */
    public static Account createAccount(String name, String phone, Boolean isInsert) {
        
        Account tempAccount = new Account();

        // Set Name
        if(name == null)
        {
            tempAccount.Name = Utility.generateRandomString(10);
        }
        else 
        {
            tempAccount.Name = name;
        }
        
        // Set Name
        if(phone == null)
        {
            tempAccount.Phone = Utility.generateRandomNumbersOnly(10);
        }
        else 
        {
            tempAccount.Phone = phone;
        }

        if(isInsert)
        {
            insert tempAccount;
        }

        return tempAccount;
    }

    /**
    * createOpportunity
    *
    * Function which creates a single Opportunity with manual data allowed
    * if any of the optional fields (name, stage, closeDate) are null, then 
    * they will be assigned generic system versions
    *
    * @param name - Name of the Opportunity
    * @param stage - Picklist value stage for the Opportunity
    * @param closeDate - Date the Opportunity is expected to close
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Opportunity
    */
    public static Opportunity createOpportunity(String name, String stage, Date closeDate, Boolean isInsert) {
        
        //createPriceBookEntry();

        Opportunity tempOpportunity = new Opportunity();

        // Set Name
        if(name == null)
        {
            tempOpportunity.Name = Utility.generateRandomString(10);
        }
        else 
        {
             tempOpportunity.Name = name;
        }
        
        // Set Stage
        if(stage == null)
        {
            tempOpportunity.StageName = 'Prospecting';
        }
        else
        {
            tempOpportunity.StageName = stage;
        }
        
        // Set Close Date
        if(closeDate == null)
        {
            tempOpportunity.CloseDate = System.Today();
        }
        else
        {
            tempOpportunity.CloseDate = closeDate;
        }

        if(isInsert)
        {
            insert tempOpportunity;
        }

        return tempOpportunity;
    }

    /**
    * createCampaign
    *
    * Function which creates a single Campaign with manual data allowed
    * if any of the optional fields (name, Start Date, End Date) are null, then 
    * they will be assigned generic system versions
    *
    * @param name - Name of the Campaign
    * @param startDate - Date the Campaign is expected to start
    * @param endDate - Date the Campaign is expected to close
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Campaign
    */
    public static Campaign createCampaign(String name, Date startDate, Date endDate, Boolean isInsert) 
    {
        Campaign tempCampaign = new Campaign();

        // Set Name
        if(name == null)
        {
            tempCampaign.Name = Utility.generateRandomString(10);
        }
        else 
        {
             tempCampaign.Name = name;
        }
        
        // Set Start Date
        if(startDate == null)
        {
            tempCampaign.StartDate = System.Today();
        }
        else
        {
            tempCampaign.StartDate = startDate;
        }
        
        // Set Close Date
        if(endDate == null)
        {
            tempCampaign.EndDate = System.Today();
        }
        else
        {
            tempCampaign.EndDate = endDate;
        }

        if(isInsert)
        {
            insert tempCampaign;
        }

        return tempCampaign;
    }

    /**
    * createCampaignMember
    *
    * Function which creates a single Campaign Member with manual data allowed
    *
    * @param campaignId - Id of the Campaign
    * @param contactId - Id of the related Contact
    * @param leadId - Id of the related Lead
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return CampaignMember
    */
    public static CampaignMember createCampaignMember(Id campaignId, Id contactId, Id leadId, Boolean isInsert) 
    {
        CampaignMember tempMember = new CampaignMember();

        tempMember.CampaignId = campaignId;
        tempMember.ContactId = contactId;
        tempMember.LeadId = leadId;

        if(isInsert)
        {
            insert tempMember;
        }

        return tempMember;
    }

    /**
    * createPriceBookEntry
    *
    * Function which creates a single Product and PriceBookEntry for processing later
    */
    public static void createPriceBookEntry() {
        
        Id pricebookId = Test.getStandardPricebookId();

        //Create your product
        Product2 prod = createProduct(true, null, null, true);

        //Create your pricebook entry
        PricebookEntry pbEntry = new PricebookEntry(
            Pricebook2Id = pricebookId,
            Product2Id = prod.Id,
            UnitPrice = 100.00,
            IsActive = true
        );
        insert pbEntry;
    }

    /**
    * createContact
    *
    * Function which creates a single Contact with manual data allowed
    * if any of the optional fields (LastName) are null, then 
    * they will be assigned generic system versions
    *
    * @param lastName - Name of the Contact
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Contact
    */
    public static Contact createContact(String lastName, Boolean isInsert) {
        
        Contact tempContact = new Contact();

        // Set Name
        if(lastName == null)
        {
            tempContact.LastName = Utility.generateRandomString(10);
        }
        else 
        {
             tempContact.LastName = lastName;
        }

        if(isInsert)
        {
            insert tempContact;
        }

        return tempContact;
    }

    /**
    * createTask
    *
    * Function which creates a single Task with manual data allowed
    * if any of the optional fields (subject, ActivityDate) are null, then 
    * they will be assigned generic system versions
    *
    * @param subject - subject of the Task
    * @param taskDate - ActivityDate of the Task
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Task
    */
    public static Task createTask(String subject, Date taskDate, Boolean isInsert) {
        
        Task tempTask = new Task();

        // Set Subject
        if(subject == null)
        {
            tempTask.Subject = Utility.generateRandomString(10);
        }
        else 
        {
            tempTask.Subject = subject;
        }

        // Set Date
        if(taskDate == null)
        {
            tempTask.ActivityDate = System.Today();
        }
        else 
        {
            tempTask.ActivityDate = taskDate;
        }

        if(isInsert)
        {
            insert tempTask; 
        }

        return tempTask;
    }

    /**
    * createEvent
    *
    * Function which creates a single Event with manual data allowed
    * if any of the optional fields (subject, ActivityDate) are null, then 
    * they will be assigned generic system versions
    *
    * @param subject - Subject of the Event
    * @param eventDate - ActivityDate of the Event
    * @param duration - Number of minutes the event will last
    * @param activityDateTime - Date time of the activity
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Event
    */
    public static Event createEvent(String subject, Date eventDate, Integer duration, DateTime activityDateTime, Boolean isInsert) {
        
        Event tempEvent = new Event();

        // Set Subject
        if(subject == null)
        {
            tempEvent.Subject = Utility.generateRandomString(10);
        }
        else 
        {
            tempEvent.Subject = subject;
        }

        // Set Date
        if(eventDate == null)
        {
            tempEvent.ActivityDate = System.Today();
        }
        else 
        {
            tempEvent.ActivityDate = eventDate;
        }

        // Set Duration
        if(duration == null)
        {
            tempEvent.DurationInMinutes = 60;
        }
        else 
        {
            tempEvent.DurationInMinutes = duration;
        }

        // Set Duration
        if(activityDateTime == null)
        {
            tempEvent.ActivityDateTime = System.now();
        }
        else 
        {
            tempEvent.ActivityDateTime = activityDateTime;
        }

        if(isInsert)
        {
            insert tempEvent; 
        }

        return tempEvent;
    }

    /**
    * createLead
    *
    * Function which creates a single Lead with manual data allowed
    * if any of the optional fields (Company/Account, LastName, Status) are null, then 
    * they will be assigned generic system versions
    *
    * @param Company - String name of the company
    * @param lastName - Name of the Lead
    * @param status - Status of the Lead
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Lead
    */
    public static Lead createLead(String company, String lastName, String status, Boolean isInsert) {
        
        Lead tempLead = new Lead();

        // Set Company
        if(company == null)
        {
            tempLead.Company = Utility.generateRandomString(10);
        }
        else 
        {
             tempLead.Company = company;
        }
        
        // Set Name
        if(lastName == null)
        {
            tempLead.LastName = Utility.generateRandomString(10);
        }
        else 
        {
             tempLead.LastName = lastName;
        }

        // Set Status
        if(status == null)
        {
            tempLead.Status = 'Contacted';
        }
        else
        {
            tempLead.Status = status;
        }

        if(isInsert)
        {
            insert tempLead;
        }

        return tempLead;
    }

    /**
    * createProduct
    *
    * Function which creates a single Product with manual data allowed
    * if any of the optional fields (Company/Account, LastName, Status) are null, then 
    * they will be assigned generic system versions
    *
    * @param isActive - Boolean deciding if the Product should be active
    * @param name - Name of the Procuct
    * @param productCode - String of the ProductCode
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return Product2
    */
    public static Product2 createProduct(Boolean isActive, String name, String productCode, Boolean isInsert) {
        
        Product2 tempProduct = new Product2();

        // Set Name
        if(name == null)
        {
            tempProduct.Name = Utility.generateRandomString(10);
        }
        else 
        {
             tempProduct.Name = name;
        }
        
        // Set Active Status
        tempProduct.IsActive = isActive;

        // Set Product Code
        if(name == null)
        {
            tempProduct.ProductCode = Utility.generateRandomString(10);
        }
        else 
        {
             tempProduct.ProductCode = productCode;
        }

        tempProduct.Description = Utility.generateRandomString(10);
        
        if(isInsert)
        {
            insert tempProduct;
        }

        return tempProduct;
    }

    /**
    * createOpportunityProduct
    *
    * Function which creates a single Opportunity Product with manual data allowed
    * if any of the optional fields (Company/Account, LastName, Status) are null, then 
    * they will be assigned generic system versions
    *
    * @param opportunityId - Id of the Opportunity
    * @param totalPrice - Total price of the product line
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return OpportunityLineItem
    */
    public static OpportunityLineItem createOpportunityProduct(Id opportunityId, Double totalPrice, Boolean isInsert) {
        
        OpportunityLineItem tempOppProd = new OpportunityLineItem();

        // Set Name
        if(opportunityId == null)
        {
            tempOppProd.OpportunityId = createOpportunity(null, null, null, true).Id;
        }
        else 
        {
             tempOppProd.OpportunityId = opportunityId;
        }
        
        // Set Total Price
        if(totalPrice == null)
        {
            tempOppProd.TotalPrice = 1.0;
        }
        else
        {   
            tempOppProd.TotalPrice = totalPrice;
        }

        tempOppProd.Quantity = 1; 
        
        if(isInsert)
        {
            insert tempOppProd;
        }

        return tempOppProd;
    }

    /**
    * createSalesUser
    *
    * Function which creates a single User with a Sales setup 
    *
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return User - Sales User
    */
    public static User createSalesUser(Boolean isInsert) {
    
        Map<String,ID> profiles = new Map<String,ID>();
        List<Profile> ps = [SELECT Id, Name FROM Profile WHERE Name = 'Sales'];

        for(Profile p : ps){
            profiles.put(p.name, p.id);
        }
    
        String uniqueString = Utility.generateRandomString(10);

        User standard = new User(
            alias = 'standt', 
            email='standarduser' + uniqueString + '@testorg.com', 
            emailencodingkey='UTF-8', 
            lastname='Testing' + uniqueString, 
            languagelocalekey='en_US', 
            localesidkey='en_US', 
            profileid = profiles.get('Sales'), 
            timezonesidkey='America/Los_Angeles', 
            username='standarduser' + uniqueString + '@testorg.com');

        if(isInsert)
        {
            insert standard;
        }

        return standard;
    }

    /**
    * createSystemAdminUser
    *
    * Function which creates a single User with a System Administrator profle
    *
    * @param isInsert - Boolean deciding if insert should happen (true) or not (false)
    *
    * @return User - Sys Admin User
    */
    public static User createSystemAdminUser(Boolean isInsert) {
    
        Map<String,ID> profiles = new Map<String,ID>();
        List<Profile> ps = [SELECT Id, Name FROM Profile WHERE Name = 'System Administrator'];

        for(Profile p : ps){
            profiles.put(p.name, p.id);
        }
    
        String uniqueString = Utility.generateRandomString(10);

        User sysAdmin = new User(
            alias = 'sysAdm', 
            email='sysAdminuser' + uniqueString + '@testorg.com', 
            emailencodingkey='UTF-8', 
            lastname='Testing' + uniqueString, 
            languagelocalekey='en_US', 
            localesidkey='en_US', 
            profileid = profiles.get('System Administrator'), 
            timezonesidkey='America/Los_Angeles', 
            username='sysAdm' + uniqueString + '@testorg.com');


        if(isInsert)
        {
            insert sysAdmin;
        }

        return sysAdmin;
    }
}