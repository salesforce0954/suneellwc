trigger conTask on Contact (after insert) {
List<Task> tList = new List<Task>();
  
  for(Contact c:Trigger.New){
   Task t = new Task();
   t.whoId = c.id;
   t.subject = 'FollowupTask';
   tList.add(t);
  }
  insert tList;
}