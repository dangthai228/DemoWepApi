using Demo.Models;
using Demo.Service;
using Google.Protobuf.Reflection;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace Demo.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ItemController : ControllerBase
    {
        private IitemService _itemservice;

        public ItemController(IitemService itemservice)
        {
            _itemservice = itemservice;
        }

        [HttpPut("changeitem/{inventoryid}/{status}")]
        public IActionResult ChangeStatus (int inventoryid, int status)
        {
            dynamic res = _itemservice.ChangeStatus(inventoryid, status);
            return Ok( res);
        }
    }
}
