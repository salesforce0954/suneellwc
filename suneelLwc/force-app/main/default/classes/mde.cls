public class mde {
/*------------------Setup operation----------------------*/
    public void create(){
        profile p=[select id from profile where name='Force.com - App Subscription User'];
        userrole u1=[select id from userrole where name='CFO'];
        user u=new user();
        u.alias='aparna';
        u.Email='aparna09540909@gmail.com';
        u.emailencodingkey='UTF-8';
        u.LanguageLocaleKey='en_US';
        u.Localesidkey='en_US';
        u.ProfileId=p.id;
        u.userroleid=u1.id;
        u.timezonesidkey='America/Los_Angeles';
        u.username='aparna09540909@gmail.com';
        u.lastname='aapu';
        insert u;
        futurecall();
    }
/*------------------Non-Setup operation----------------------*/
    
    public static void futurecall(){
        account a=new account();
        a.name='aparna';
        insert a;
    }
}