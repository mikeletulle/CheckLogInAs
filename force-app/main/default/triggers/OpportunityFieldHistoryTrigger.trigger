trigger OpportunityFieldHistoryTrigger on Opportunity (after update) {
    List<Field_Change__c> changes = new List<Field_Change__c>();
    for (Opportunity opp : Trigger.new) {
            Field_Change__c change = new Field_Change__c(); 
            change.Opportunity__c = opp.Id;
            change.Field_Name__c = 'StageName';
            change.Previous_Value__c = Trigger.oldMap.get(opp.Id).StageName;
            change.New_Value__c = opp.StageName;
            change.Actual_User__c = checkLoggedInAs.getSubstituteUserId();
            change.Logged_In_User__c= UserInfo.getUserId();
            changes.add(change);
        }
    
    if (!changes.isEmpty()) {
        insert changes;
    }
}