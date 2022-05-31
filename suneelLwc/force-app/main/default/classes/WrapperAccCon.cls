public class WrapperAccCon{

   List<wrapperHandler> whList = new List<wrapperHandler>();
   
      public List<Account> getAccountList(){
      
      whList = new List<WrapperHandler>();
      List<Account> accList = [select id,name,phone from Account];
      
      for(Account acc:accList){
        whList.add(new WrapperHandler(acc));
      }
        return accList;
      }
      public List<Contact> getContactList(){
     
      List<Contact> conList = [select id,name from Contact];
      whList = new List<WrapperHandler>();
      
      for(contact c: conList){
        whList.add(new WrapperHandler(conList));
      }
        
        return conList;
      }

   public class wrapperHandler{
   
       public Account acc;
       public List<Contact> con;
       
       public wrapperHandler(Account a){
         this.acc = a;
       }
       
       public wrapperHandler(List<Contact> c){
        this.con = c;
       }
     
   }
}