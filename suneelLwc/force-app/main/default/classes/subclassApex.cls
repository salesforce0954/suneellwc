public class subclassApex extends superApex {
    
    public subclassApex(){
       super('Suneel','Desiraju');
    }
 /**   public override void methodOne(){
        super.methodOne(); 
        system.debug('Test');
        system.debug('My First Name '+super.getFirstLastName());
    } */
    
    public override void methodThree(integer a,integer b){
        integer c = a * b;
        system.debug('Method Three from sub class' + c);
    }
    public void getSuperMethod(){
        super.methodTwo();
        //super.getFirstLastName();
    }
    public string getname(){
        return super.getFirstLastName();
    }
}