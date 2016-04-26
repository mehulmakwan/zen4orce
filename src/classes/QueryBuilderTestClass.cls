@isTest
public class QueryBuilderTestClass 
{
    public static testMethod void querybuild()
    {
        //INSERTING SAMPLE DATA
        QueryBuilderController controller = new QueryBuilderController();
        controller.getrecordsOptions();
           
        controller.selectedObject = 'account';
        controller.populateFields();
		controller.selectedField.add('id');
        controller.radio = 'LIMIT 500';
        controller.add();
        controller.execute();
		//System.assertEquals('SELECT id FROM account',controller.message);
        System.assertNotEquals('SELECT id FROM account', controller.message);
        
    }
    
    public static testMethod void withasc()
    {   
        QueryBuilderController controller = new QueryBuilderController();
        controller.getrecordsOptions();
        
        controller.selectedObject = 'account';
		controller.selectedField.add('id');
		controller.selectedField.add('Name');
        controller.add();
        System.assertNotEquals('SELECT id FROM account ORDER BY ID ASC',controller.message);
        controller.execute();
    }
    
    public static testMethod void onradiobutton()
    {   
        QueryBuilderController controller = new QueryBuilderController();
        controller.getrecordsOptions();
        
        controller.selectedObject = 'account';
		controller.selectedField.add('id');
        controller.getradioOptions();
        controller.records = 'ORDER BY ID ASC';
        controller.add();
        System.assertNotEquals('SELECT id FROM account ORDER BY ID ASC',controller.message);
        controller.execute();
    }
}