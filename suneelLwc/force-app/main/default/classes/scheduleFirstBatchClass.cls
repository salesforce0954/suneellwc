public class scheduleFirstBatchClass implements schedulable {
    public void execute(SchedulableContext sct){
        firstBatchClass fb = new firstBatchClass();
        database.executeBatch(fb);
    }
}