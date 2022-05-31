public class retrieveAccounts{
  
    public static List<Account> getActiveAccounts(){
    List<Account> acclist = [select id,Name,Phone from Account];
    return acclist;
    }
}