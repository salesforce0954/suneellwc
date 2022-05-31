trigger LeadTrigger on Lead (before insert) {
     system.debug('Firt Lead Trigger');
    for(Lead LeadTrigger: Trigger.New){
        if(String.isBlank(LeadTrigger.LeadSource)){
            LeadTrigger.LeadSource = 'Other';
        }
        if(LeadTrigger.LeadSource == 'Web'){
            LeadTrigger.Rating = 'cold';
        }else{
            LeadTrigger.Rating = 'hot';
        }
        if(String.isBlank(LeadTrigger.Industry)){
            LeadTrigger.addError('Please select the Industry');
        }
        
    }
}