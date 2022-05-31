public virtual class superApex {
    
    public string myFirstName;
    public string myLastName;
    
    public superApex(){
            }
    
    public superApex(String firstName,String lastName){
        myFirstName = firstName;
        mylastName = lastName;
    }
   /** public virtual void methodOne(){
        system.debug('First Method');
    } */
    public void methodTwo(){
        system.debug('Second Method');
    }
   public virtual string getFirstLastName(){
        return myFirstName + '' + myLastName;
    }
    public virtual void methodThree(integer x,integer y){
        system.debug('Method Three from Super Class');
        integer z = x + y;
        system.debug('Total '+z);
    }
    /** public virtual double discountPrice(){
        system.debug('Discount price');
        return 0.10;
    } */
}