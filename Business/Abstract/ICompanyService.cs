using Core.Utilities.Result.Abstract;
using Entities.Concrete;

namespace Business.Abstract
{
    public interface ICompanyService
    {
        IDataResult<List<Company>> GetList();

        IResult Add(Company company);
    }
}
