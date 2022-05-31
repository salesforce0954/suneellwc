public class abstractChild extends abstractExample{

  public override void methodOne(){
    system.debug('Method One');
  }
  
  public override void methodTwo(){
     super.methodTwo();
     system.debug('child class Method Two');
   }
   
   
   
}