using Business.Abstract;
using Business.Constant;
using Core.Utilities.Result.Abstract;
using Core.Utilities.Result.Concrete;
using DataAccess.Abstract;
using Entities.Concrete;

namespace Business.Concrete
{
    public class MailTemplateManager : IMailTemplateService
    {
        private readonly IMailTemplateDal _mailTemplateDal;

        public MailTemplateManager(IMailTemplateDal mailTemplateDal)
        {
            _mailTemplateDal = mailTemplateDal;
        }

        public IResult Add(MailTemplate entity)
        {
            _mailTemplateDal.Add(entity);
            return new SuccessResult(Messages.MailTemplateAdded);
        }

        public IResult Delete(MailTemplate entity)
        {
            _mailTemplateDal.Delete(entity);
            return new SuccessResult(Messages.MailTemplateDeleted);
        }

        public IDataResult<MailTemplate> Get(int id)
        {
            return new SuccessDataResult<MailTemplate>(_mailTemplateDal.Get(m => m.Id == id));
        }

        public IDataResult<List<MailTemplate>> GetAll(int companyId)
        {
            return new SuccessDataResult<List<MailTemplate>>(_mailTemplateDal.GetList(m => m.CompanyId == companyId));
        }

        public IDataResult<MailTemplate> GetByTemplateName(string name, int companyId)
        {
            return new SuccessDataResult<MailTemplate>(_mailTemplateDal.Get(m => m.CompanyId == companyId && m.Type == name));
        }

        public IResult Update(MailTemplate entity)
        {
            _mailTemplateDal.Update(entity);
            return new SuccessResult(Messages.MailTemplateUpdated);
        }
    }
}
