public class subclass_poly extends super_poly {
    
    public subclass_poly(){
        //super();
    }
   
   
    
    public override void methodOne(integer x,integer y){
        super.methodOne(10,5);
        system.debug('The value of x '+ x);
        system.debug('The value of y ' + y);
        system.debug('This is MethodOne from subclass');
    }
    
    
    public override void methodFour(integer y){
        
    }
        
        
    
}