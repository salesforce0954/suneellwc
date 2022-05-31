trigger updateCity on Account(after update) {

set<Id> accountIds = new set<Id>();
for(Account acc : Trigger.New){
  if(acc.city__c != trigger.oldMap.get(acc.id).city__c){
   accountIds.add(acc.id);
  }
}

List<Opportunity> oppList = [select id,accountId,city__c from Opportunity where accountId in :accountIds];




List<Account> accList = [select id,city__c from Account where id in :accountIds];
Map<id,Account> accOpp = new Map<id,Account>(accList);

/** for(Account accnt:accList){
  accOpp.put(accnt.id,accnt);
} */

for(opportunity opp:oppList){
  opp.city__c = accOpp.get(opp.accountId).city__c;
}

/**for(Opportunity opp : oppList){
  opp.city__c = trigger.newMap.get(opp.accountId).city__c;

} */
update oppList;

}