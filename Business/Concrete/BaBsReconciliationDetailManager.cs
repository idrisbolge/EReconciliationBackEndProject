using Business.Abstract;
using DataAccess.Abstract;

namespace Business.Concrete
{
    public class BaBsReconciliationDetailManager : IBaBsReconciliationDetailService
    {
        private readonly IBaBsReconciliationsDetailDal _babsReconciliationDetail;

        public BaBsReconciliationDetailManager(IBaBsReconciliationsDetailDal babsReconciliationDetail)
        {
            _babsReconciliationDetail = babsReconciliationDetail;
        }
    }
}
