using Core.Entities;
using Entities.Concrete;

namespace Entities.Dtos
{
    public class UserAndCompanyRegisterDto : IDto
    {
        public UserForRegisterDto UserForRegister { get; set; }
        public Company company { get; set; }
    }
}
