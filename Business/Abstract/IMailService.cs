using Core.Utilities.Result.Abstract;
using Entities.Dtos;

namespace Business.Abstract
{
    public interface IMailService
    {
        IResult SendMail(SendMailDto sendMailDto);
    }
}
