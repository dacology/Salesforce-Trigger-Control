/************************************************************************************
Name: Account Trigger
=====================================================================================
Purpose
-------
An example Trigger, to demonstrate the isActive control from a custom object setting.
Custom Object: TriggeraActive needs to be present, with entries for the object

************************************************************************************/
trigger AccountTrigger on Account ( after insert, after update, before insert, before update) {
	
	//first check to see if this objects trigger deactivated in the custom setting
	CS_TriggerControl__c triggerControl = CS_TriggerControl__c.getValues(trigger.new.getSObjectType().getDescribe().name);
    if( (triggerControl == null) || ( (triggerControl != null) && (triggerControl.deactivate__c == false)) ) {   	    
          
		// ## BEGIN: Actual Trigger Code --------------------------------------------------------------------------------
			if(trigger.isBefore) {		
				list<Account> accounts = trigger.new;
		   		for (Account a : trigger.new){        	
		            a.Description = 'The trigger is active';			
				}
			}
			if(trigger.isAfter) {	
				//TODO: trigger after
			}
			
		// ## END: Actual Trigger Code	 --------------------------------------------------------------------------------
	}
}