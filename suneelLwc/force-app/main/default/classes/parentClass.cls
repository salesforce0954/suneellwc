public abstract class parentClass {   
    public virtual integer doDivide(integer x, integer y){
        return x/y;
    }
    public static integer doSum(integer x, integer y){
        return x+y;
    }
    public abstract integer doDifference(integer x, integer y);
}