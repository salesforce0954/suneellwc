public virtual class super_poly {

    public super_poly(){
        system.debug('This is the constructor from super class');
    }
    
   
    
     public void methodOne(string x,integer y){
  
    }
    
    public virtual void methodFour(integer x){
        
    }
  
     public virtual void methodOne(integer x,integer y){
         
         system.debug('The value of x from super class '+x);
         system.debug('The value of y from super class '+y);
         system.debug('This is MethodOne from Super class');
     }
    
    public virtual void test(){
        system.debug('This is test method');
    }
}