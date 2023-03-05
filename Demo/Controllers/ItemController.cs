using Demo.Models;
using Demo.Service;
using Google.Protobuf.Reflection;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Demo.Factory;

namespace Demo.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemController : ControllerBase
    {
        private readonly IServiceFactory _serviceFactory;

        public ItemController(IServiceFactory serviceFactory)
        {
            _serviceFactory = serviceFactory;
        }
        

        [HttpPut("changeitem/{inventoryid}/{status}")]
        public IActionResult ChangeStatus (int inventoryid, int status)
        {
            var itemservice = _serviceFactory.GetInstance("sv1");
            dynamic res = itemservice.ChangeStatus(inventoryid, status);
            return Ok( res);
        }
    }
}
