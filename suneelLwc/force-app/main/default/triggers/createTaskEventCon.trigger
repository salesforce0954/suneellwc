trigger createTaskEventCon on Contact (after insert) {
   List<Task> taskList = new List<Task>();
  
  for(Contact con:Trigger.new){
    Task t = new Task();
    t.subject = 'Test';
    t.whoId = con.id;
    taskList.add(t);
  }
  insert taskList;
}