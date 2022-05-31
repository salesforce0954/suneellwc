public class wrapperSelectedAccounts{

   public List<wrapperAccount> waList {get;set;}
   public List<Account> selectedAccs {get;set;}
   
   public wrapperSelectedAccounts(){
      waList = new List<wrapperAccount>();

    for(Account acc : [select id,name,phone from Account]){
      waList.add(new wrapperAccount(acc));
    }
   }
   
   public void recordsSelected(){
   
     selectedAccs = new List<Account>();
     
     for(wrapperAccount wa : waList){
     if(wa.isSelected == true){
       selectedAccs.add(wa.acc);
      }
     }
   }
    
    public pageReference deleteSelectedAccounts(){
    
   
       delete selectedAccs;
       return null;
       
    }
    public class wrapperAccount{
      
        public Account acc {get;set;}
        public boolean isSelected {get;set;}
        
        public wrapperAccount(Account a){
          this.acc = a;
        }
    }
}