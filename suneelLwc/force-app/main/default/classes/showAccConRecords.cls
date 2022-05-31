public class showAccConRecords{
   
   public List<Account> accList {get;set;}
   Public List<Contact> conList {get;set;}
   public string id;

 public showAccConRecords(){
     id = ApexPages.currentPage().getParameters().get('id'); 
 }
 
 public List<Account> getAccountinfo(){
   accList = [select id,name from Account where id=:id];
   return accList;
 }
 
 public List<Contact> getContactInfo(){
   conList = [select id,name from Contact where accountId=:id];
   return conList;
 }
 
 public void deleteContact(){
   system.debug('Entered');
   Contact con = [select id,name from Contact where Id =:conList[0].id];
   system.debug('Before '+con);
   delete con;
   system.debug('After '+con);
   //pageReference pageRef = new pageReference('/apex/showAccConRecords');
   //pageRef.getParameters().put('id',accList[0].id);
 }
}