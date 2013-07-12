/************************************************************************************
Name: Account Trigger
=====================================================================================
Purpose
-------
An example Trigger Template:
Utilises trigger control to allow the trigger to be turned off
Custom Setting Object: TriggeraActive needs to be present, with entries for the object

************************************************************************************/
trigger AccountTrigger on Account ( after insert, after update, before insert, before update) {
	
 // ### first check to see if this objects trigger deactivated in the custom setting 
 CS_TriggerControl__c triggerControl = CS_TriggerControl__c.getValues(trigger.new.getSObjectType().getDescribe().name);
 if( (triggerControl == null) || ( (triggerControl != null) && (triggerControl.deactivate__c == false)) ) {   	    
          
	// ## BEGIN: Actual Trigger Code ### --------------------------------------------------------------------------------
	
	//create instances of helper classes 
	afu = accountFieldUpdatesHelper = new accountFieldUpdatesHelper();
	
	if(trigger.isBefore) {	
		if(trigger.isInsert){
			//TODO: add calls to helper methods
			afu.accountBefore(trigger.new); 
		}
		if(trigger.isUpdate){
			//TODO: add calls to helper methods
			afu.accountBefore(trigger.new);  
		}
	}
	
	if(trigger.isAfter) {	
		if(trigger.isInsert){
			//TODO: add calls to helper methods 
		}
		if(trigger.isUpdate){
			//TODO: add calls to helper methods 
		}	
	}
				
	// #### END: Actual Trigger Code ### --------------------------------------------------------------------------------
 }
}