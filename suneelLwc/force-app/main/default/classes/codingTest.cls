public class codingTest{

  
  public static integer z;
  public static integer m;
  
  public codingTest(){
  }
  
  public static integer addNumbers(integer x,integer y){
  
     z = x + y;
     
     return z;
   
  }
  
  public static void addition(integer x,integer y){
    z = x + y;
    system.debug('The value of Z is '+z);
  }
  
  public static void multiplication(integer x,integer y){
    addition(x,y);
    m = x * y + z;
    system.debug('The value of m is '+m);
  }
}