trigger createTaskEvent on Account (after insert) {

  List<Task> taskList = new List<Task>();
  
  for(Account acc:Trigger.new){
    Task t = new Task();
    t.subject = 'Test';
    t.whatId = acc.id;
    taskList.add(t);
  }
  insert taskList;
}