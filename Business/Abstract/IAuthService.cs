using Core.Entities.Concrete;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Security.JWT;
using Entities.Concrete;
using Entities.Dtos;

namespace Business.Abstract
{
    public interface IAuthService
    {
        IDataResult<UserCompanyDto> Register(UserForRegisterDto userForRegister, string password, Company company);
        IDataResult<User> RegisterSecondAccount(UserForRegisterDto userForRegister, string password);

        IDataResult<User> Login(UserForLoginDto userForLogin);

        IResult UserExists(string email);
        IResult CompanyExists(Company company);
        IDataResult<AccessToken> CreateAccesToken(User user,int companyId);
    }
}
