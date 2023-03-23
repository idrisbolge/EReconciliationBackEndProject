using Business.Abstract;

namespace Business.Concrete
{
    public class MailParameterManager : IMailParameterService
    {
        private readonly IMailParameterService _mailParameterService;

        public MailParameterManager(IMailParameterService mailParameterService)
        {
            _mailParameterService = mailParameterService;
        }
    }
}
