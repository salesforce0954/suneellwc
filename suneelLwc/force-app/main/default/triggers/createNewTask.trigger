trigger createNewTask on Account (after insert) {
  List<Task> tList = new List<Task>();
  
  for(Account a:Trigger.New){
   Task t = new Task();
   t.whatId = a.id;
   t.subject = 'FollowupTask';
   tList.add(t);
  }
  insert tList;
}