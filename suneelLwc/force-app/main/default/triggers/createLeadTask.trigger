trigger createLeadTask on Lead (after insert) {
   List<Task> tList = new List<Task>();
  
  for(Lead l:Trigger.New){
   Task t = new Task();
   t.whoId = l.id;
   t.subject = 'FollowupTask';
   tList.add(t);
  }
  insert tList;
}