using Business.Abstract;
using DataAccess.Abstract;

namespace Business.Concrete
{
    public class BaBsReconciliationManager : IBaBsReconciliationService
    {
        private readonly IBaBsReconciliationDal _babsReconciliation;

        public BaBsReconciliationManager(IBaBsReconciliationDal babsReconciliation)
        {
            _babsReconciliation = babsReconciliation;
        }
    }
}
