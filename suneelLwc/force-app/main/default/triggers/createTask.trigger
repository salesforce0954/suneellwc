trigger createTask on opportunity(after insert){
  
   List<Task> taskList = new List<Task>();
   
   for(Opportunity opp:Trigger.New){
   if(opp.stageName == 'Closed won'){
     Task t = new Task();
     t.whatId = opp.id;
     taskList.add(t);
    }
   }
   
   insert taskList;
}