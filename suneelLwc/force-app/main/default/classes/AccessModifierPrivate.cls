public virtual class AccessModifierPrivate {
  private static integer  firstNumber = 5;
  static final integer secondNumber = 10;
  static final Integer PRIVATE_INT_CONST = 200;
  
    public void getFirstNumber(){
        system.debug('First Number');
        firstNumber = 10;
        system.debug(firstNumber);
    }
    
    public void getSecondNumber(){
        system.debug('Second Number');
        system.debug(AccessModifierPrivate.secondNumber);
        system.debug(secondNumber);
    }
  
}