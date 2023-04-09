﻿using Business.Abstract;
using Business.Constant;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class MailParameterManager : IMailParameterService
    {
        private readonly IMailParameterDal _mailParameterDal;

        public MailParameterManager(IMailParameterDal mailParameterDal)
        {
            _mailParameterDal = mailParameterDal;
        }


        public IDataResult<MailParameter> Get(int companyId)
        {
            return new SuccessDataResult<MailParameter>(_mailParameterDal.Get(m => m.CompanyId == companyId));
        }

        public IResult Update(MailParameter mailParameter)
        {
            var result = Get(mailParameter.CompanyId);

            if(result.Data == null) 
                _mailParameterDal.Add(mailParameter);
            else
            {
                result.Data.SMTP = mailParameter.SMTP;
                result.Data.Port = mailParameter.Port;
                result.Data.SSL = mailParameter.SSL;
                result.Data.Email = mailParameter.Email;
                result.Data.Password = mailParameter.Password;
                Update(mailParameter);
            }
            return new SuccessResult(Messages.MailParameterUpdated);
        }
    }
}
