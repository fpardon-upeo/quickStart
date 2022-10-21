# Settings for Quick Start Orgs


<a href="https://githubsfdeploy.herokuapp.com?owner=fpardon-upeo&repo=quickStart&ref=master">
  <img alt="Deploy to Salesforce Prod"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

**Contents**

- Apex Classes
  * CleanNewOrg
    * cleanTrialDate > Cleans up Opportunities, Cases, Accounts and Contacts that were loaded as part of the Trial Org (aka ACME stuff)
    * createIntegrationUser > Creates a user with the Integration User profile
  * CleanNewOrgTest
    * testCleanTrialDate > Tests the cleanTrialDate method
    * testCreateIntegrationUser > Tests the createIntegrationUser method
- Settings (abridged)
  * Apex.settings
    * enableApexApprovalUnlock (true)> Allows Apex to lock and unlock approval processes
  * DevHub.settings
    * enableDevHub (true)> Enables the DevHub
  * Flow.settings
    * canDebugFlowAsAnotherUser (true)> Allows admins to debug flows as other users
  * Lead.settings
    * enableConversionsOnMobile (false)> disables the option for Users to convert leads on mobile (it's broken)
  * Name.settings
    * enableMiddleName (false) > disables the option for Users to enter a middle name
    * enableNameSuffix (false) > disables the option for Users to enter a name suffix
  * Security.settings
    * enableAdminLoginAsAnyUser (true) > Allows admins to login as any user
    * forceRelogin (false) > Forces users to relogin after logging out as a different user
  * SourceTracking.settings
    * enableSourceTrackingSandboxes (true) > Enables source tracking in sandboxes for Salesforce DX
  * UserInteface.settings
    * enableAsyncRelatedLists (true) > Enables asynchronous loading of related lists
  * UserManagement.settings
    * enableEnhancedPermsetMgmt (true) > Enables enhanced permission set management
    * enableEnhancedProfileMgmt (true) > Enables enhanced profile management
    * enableNewProfileUI (true) > Enables the new profile UI
- Custom Settings
  * Automation Bypass > Allows you to define per user or profile which automation should be bypassed (use it in fresh 
  sandboxes to add a condition to every automation that checks for these settings)
- Custom Field on User
  * Ignore Duplicate Rules > Allows you to ignore duplicate rules for a specific user
- Standard Duplicate and Matching Rules > take into account the Ignore Duplicate Rules field on user
- Profiles
  * Custom Integration profile to be used for Integrations