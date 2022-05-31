public class calculator {
    
   // public integer x;
   // public integer y;
      public static integer z;
    
    public static integer add(integer x,integer y){
        
        z = x + y;
        return z;
    }
    
    public static void sub(integer x,integer y){
       
        z = x - y;
        system.debug('The value of Z is '+z);
        //return z;
    }
    
    public static integer mul(integer x,integer y){
        
        z = x * y;
        return z;
    }
    
    public static string getHelloMessage(){
        return 'Hello World';
    }
    
}