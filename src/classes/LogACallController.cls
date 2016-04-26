public class LogACallController {    
    //method to create task    
    @AuraEnabled
    public static void saveTask(Task task) {
        
            insert new Task(
                Subject = task.Subject, 
                Type = task.Type,                   
                ActivityDate = task.ActivityDate, 
                Description = task.Description,
                Status = 'Open');      
            //return 'Task Created Successfully';
    }
}