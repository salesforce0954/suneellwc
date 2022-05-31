trigger firstCaseTrigger on Case (before insert) {
    for(Case c:Trigger.New){
        if(c.Origin == 'Email'){
            c.Status = 'New';
            c.Priority = 'Normal';
        }
    }
}