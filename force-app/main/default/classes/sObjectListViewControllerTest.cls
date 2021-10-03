@isTest(seeAllData=true)
private class sObjectListViewControllerTest {
    
    
    @isTest 
    static void testGetRecords() {
        Account acct = new Account(name='Test Account', Description='Test Account Description');
        insert acct;
        Contact cnt1 = new Contact(FirstName='Test', LastName='Contact1', Description='https://upload.wikimedia.org/wikipedia/commons/6/67/Sydney_NSW_2000%2C_Australia_-_panoramio_%28291%29_adj.jpg', AccountId=acct.Id);
        insert cnt1;
        Contact cnt2 = new Contact(FirstName='Test', LastName='Contact2', Description='https://upload.wikimedia.org/wikipedia/commons/6/67/Sydney_NSW_2000%2C_Australia_-_panoramio_%28291%29_adj.jpg', AccountId=acct.Id);
        insert cnt2;

        String searchString = 'SELECT Name, Description FROM Contact';
        String nameField = 'Name';
        String imageField = 'Description';
        List<sObjectListViewController.record> records = new List<sObjectListViewController.record>();
        Test.startTest();
        records = sObjectListViewController.getRecords(searchString, nameField, imageField);
        Test.stopTest();
        System.assert(records.size() > 0, 'No Contacts');
    }
}