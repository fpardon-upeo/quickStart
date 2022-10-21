/**
 * Created by fpardon on 21/10/2022.
 */

public with sharing class CleanNewOrg {

    public static void cleanTrialData(){

        List<Entitlement> entitlements = [SELECT Id FROM Entitlement];
        List<Case> cases = [SELECT Id FROM Case];
        List<Opportunity> opportunities = [SELECT Id FROM Opportunity];
        List<Account> accounts = [SELECT Id FROM Account];

        delete entitlements;
        delete cases;
        delete opportunities;
        delete accounts;

    }

    public static void createIntegrationUser() {

        Profile profile = [SELECT Id FROM Profile WHERE Name = 'Integration'];

        User u = new User();
        u.Username = 'integration.user@upeo.com';
        u.FirstName = 'Integration';
        u.LastName = 'User';
        u.Email = 'info@upeoconsulting.com';
        u.ProfileId = profile.Id;
        u.Alias = 'IntUser';
        u.TimeZoneSidKey = 'Europe/Paris';
        u.LocaleSidKey = 'fr_BE';
        u.EmailEncodingKey = 'ISO-8859-1';
        u.LanguageLocaleKey = 'en_US';

        insert u;
    }

}