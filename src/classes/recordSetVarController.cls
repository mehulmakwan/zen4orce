public class recordSetVarController {
    public List<Campaign> obj{get;set;}
    public string str{get;set;}
    public recordSetVarController(ApexPages.StandardSetController controller) {
        obj = (List<Campaign>) controller.getSelected();
    }
}