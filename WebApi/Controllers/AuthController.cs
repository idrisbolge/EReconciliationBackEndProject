using Business.Abstract;
using Entities.Concrete;
using Entities.Dtos;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("register")]
        public IActionResult Register(UserAndCompanyRegisterDto userAndCompanyRegister)
        {
            var userExists = _authService.UserExists(userAndCompanyRegister.UserForRegister.Email);
            if (!userExists.Success)
                return BadRequest(userExists.Message);

            var companyExists = _authService.CompanyExists(userAndCompanyRegister.company);
            if (!userExists.Success)
                return BadRequest(userExists.Message);


            var registerResult = _authService.Register(userAndCompanyRegister.UserForRegister, userAndCompanyRegister.UserForRegister.Password, userAndCompanyRegister.company);
           
            var result = _authService.CreateAccesToken(registerResult.Data, registerResult.Data.CompanyId);
            
            if (result.Success)
                return Ok(result.Data);

            return BadRequest(registerResult.Message);
        }

        [HttpPost("registerSecondAccount")]
        public IActionResult RegisterSecondAccount(UserForRegisterDto userForRegister, int companyId)
        {
            var userExists = _authService.UserExists(userForRegister.Email);
            if (!userExists.Success)
                return BadRequest(userExists.Message);

            var registerResult = _authService.RegisterSecondAccount(userForRegister, userForRegister.Password);
            var result = _authService.CreateAccesToken(registerResult.Data, companyId);
            if (result.Success)
                return Ok(result.Data);

            return BadRequest(registerResult.Message);
        }

        [HttpPost("login")]
        public IActionResult Login(UserForLoginDto userForLogin)
        {
            var userToLogin = _authService.Login(userForLogin);
            if (!userToLogin.Success)
                return BadRequest(userToLogin.Message);
            var result = _authService.CreateAccesToken(userToLogin.Data, 0);

            if (result.Success)
                return Ok(result.Data);
            return BadRequest(result.Message);
        }

    }
}
