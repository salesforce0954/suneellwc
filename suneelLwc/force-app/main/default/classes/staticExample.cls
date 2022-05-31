public class staticExample{
  public Integer jedisDefeated = 0;
  public static  Integer totalJedisDefeated = 0;

  public void executeJedi() {
    // Wooosh vvvzzztt! AAHHHHH!
    jedisDefeated      = jedisDefeated + 1;
    system.debug('totalJedisDefeated before '+totalJedisDefeated);
    totalJedisDefeated = totalJedisDefeated + 1;
    system.debug('totalJedisDefeated after '+totalJedisDefeated);

  }
}