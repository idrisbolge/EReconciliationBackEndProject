
using Business.Abstract;
using Business.Constant;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class CompanyManager : ICompanyService
    {
        private readonly ICompanyDal _companyDal;

        public CompanyManager(ICompanyDal companyDal)
        {
            _companyDal = companyDal;
        }

        public IResult Add(Company company)
        {
            _companyDal.Add(company);
            return new SuccessResult("Kayıt İşlemi başarıyla gerçekleşti.");
        }

        public IResult CompanyExists(Company company)
        {
            var result = _companyDal.Get(c => c.Name == company.Name
                                            && c.TaxDepartment == company.TaxDepartment
                                            && c.TaxIdNumber == company.TaxIdNumber
                                            && c.IdentityNumber == company.IdentityNumber);

            if (result != null)
                return new ErrorResult(Messages.CompanyAlreadyExists);
            return new SuccessResult();

        }

        public IDataResult<List<Company>> GetList()
        {
            return new SuccessDataResult<List<Company>>(_companyDal.GetList());
        }

        public IResult UserCompanyAdd(int userId, int companyId)
        {
            _companyDal.UserCompanyAdd(userId, companyId);
            return new SuccessResult();
        }
    }
}
