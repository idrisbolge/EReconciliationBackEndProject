﻿using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    public class CompanyController : Controller
    {
        private readonly ICompanyService _companyService;

        public CompanyController(ICompanyService companyService)
        {
            _companyService = companyService;
        }

        [HttpGet("getcompanylist")]
        public IActionResult Index()
        {
            var result = _companyService.GetList();
            if (result.Success)
            {
                return Ok(result);
            }
            else
                return BadRequest(result.Message);
        }

        [HttpPost("addcompany")]
        public IActionResult AddCompany(Company company)
        {
            var result = _companyService.Add(company);
            if (result.Success)
                return Ok(result);
            else
                return BadRequest(result.Message);
        }
    }
}
