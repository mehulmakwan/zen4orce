public class NewCaseListController
{
    public List<Case> getNewCases()
    {
       List<Case> newCases = new List<Case>([SELECT CaseNumber,Id FROM Case WHERE Status = 'New' LIMIT 1]);
        return newCases;
	}
    
}