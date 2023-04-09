using Business.Abstract;
using Business.Constant;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Abstract;
using Entities.Dtos;
using System.Runtime.CompilerServices;

namespace Business.Concrete
{
    public class MailManager : IMailService
    {
        private readonly IMailDal _mailDal;

        public MailManager(IMailDal mailDal)
        {
            _mailDal = mailDal;
        }

        public IResult SendMail(SendMailDto sendMailDto)
        {
            _mailDal.SendMail(sendMailDto);
            return new SuccessResult(Messages.MailSendSuccessfull);
        }
    }
}
