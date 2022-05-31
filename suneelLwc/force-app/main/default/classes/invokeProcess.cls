public class invokeProcess{
  
   @invocablemethod(label='delete contacts')
   public static void deleteAccount(List<id> accountids){
   
      List<Account> accList = [select id,name from account where id =:accountids];
      
      List<Contact> conList = [select accountId from contact where accountId =:accountIds];
      
      if(conList.size() > 0){
         system.debug('Before : Contact size '+conList.size());
         delete conList;
         system.debug('After : Contact size '+conList.size());
      }
   }
}