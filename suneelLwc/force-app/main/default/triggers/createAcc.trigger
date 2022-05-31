trigger createAcc on Account (before insert) {
   
   for(Account acc:Trigger.new){
       acc.name = 'Suneel';
   }
}