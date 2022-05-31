public class queueableExample implements Queueable {
  
    public void execute(QueueableContext qc){
       system.debug('Queueable Apex');
        list<contact> conList = new List<Contact>();
        List<Account> accList = [select id,Name from account where id='0015e00000jBVCl'];
        for(Account acc:accList){
        Contact c = new contact();
        c.accountId = acc.id;
        c.lastName = 'QueueableRecord';
        conList.add(c);
        }
        insert conList;
        system.debug('Contactid '+conList[0].id);
    }
}