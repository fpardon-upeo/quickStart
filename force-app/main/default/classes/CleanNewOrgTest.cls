/**
 * Created by fpardon on 21/10/2022.
 */

@IsTest
public with sharing class CleanNewOrgTest {

    static void createTestData() {

        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Contact con = new Contact(LastName = 'Test Contact', AccountId = acc.Id);
        insert con;

        Opportunity opp = new Opportunity(Name = 'Test Opportunity', AccountId = acc.Id, CloseDate = Date.today(), StageName = 'New');
        insert opp;

        Case cas = new Case(Subject = 'Test Case', AccountId = acc.Id, Status = 'New');
        insert cas;

        Entitlement ent = new Entitlement(Name = 'Test Entitlement', AccountId = acc.Id);
        insert ent;

    }

    static testMethod void testCleanNewOrg() {

        createTestData();

        Test.startTest();
        CleanNewOrg.cleanTrialData();
        Test.stopTest();

        List<Account> accs = [SELECT Id FROM Account];
        List<Contact> cons = [SELECT Id FROM Contact];
        List<Opportunity> opps = [SELECT Id FROM Opportunity];
        List<Case> cass = [SELECT Id FROM Case];
        List<Entitlement> ents = [SELECT Id FROM Entitlement];

        System.assertEquals(0, accs.size());
        System.assertEquals(0, cons.size());
        System.assertEquals(0, opps.size());
        System.assertEquals(0, cass.size());
        System.assertEquals(0, ents.size());

    }

    static testMethod void createIntegrationUser(){
        Test.startTest();
        CleanNewOrg.createIntegrationUser();
        Test.stopTest();

        List<User> users = [SELECT Id FROM User WHERE Profile.Name = 'Integration'];
        System.assertEquals(1, users.size());
    }

}