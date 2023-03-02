using Demo.Models;
using Demo.Service;
using Google.Protobuf.Reflection;
using Microsoft.AspNetCore.Mvc;
using MySqlX.XDevAPI.Common;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Demo.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        private IAccountService _accountService;
        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        /*[HttpPost("login")]
        public IActionResult CheckLogin(User u)
        {
            var res = _accountService.CheckLogin(u);
            if (res.StartsWith("E"))
            {
                return BadRequest(new { message = res});
            }
            string Token = _accountService.GenerateToken(u);
            return Ok(new { token = Token });
        }*/

        [HttpPost("cointogold")]
        public IActionResult convertcoin(TienTe item)
        {
            dynamic _response = _accountService.ConvertCoin(item);
            return Ok(_response);
        }
        [HttpGet("info/{idacc}")]
        public IActionResult getAccountInfo(int idacc)
        {
            var response = _accountService.GetAccountInfo(idacc);
            return Ok(response);
        }

        [HttpGet("shop")]
        public IActionResult getShopitem()
        {
            var response = _accountService.GetShop();
            if (String.IsNullOrEmpty(Convert.ToString(response)))
            {
                return BadRequest(new { message = "Shop rỗng" });
            }
            return Ok(response);
        }
        [HttpPost("buyitem")]
        public IActionResult BuyItem(Transaction item)
        {
            dynamic res = _accountService.BuyItem(item);
            return Ok(res);
        }
        [HttpGet("inventory/{idacc}")]
        public IActionResult getInventory(int idacc)
        {
            dynamic res = _accountService.GetInventory(idacc);
            if (String.IsNullOrEmpty(Convert.ToString(res)))
            {
                return BadRequest(new { message = "Túi đồ hiện tại đang rỗng !" });
            }
            return Ok(res);
        }
        [HttpPost("ReceiveVipGift/{idacc}")]
        public IActionResult ReceiveVipGift(int idacc)
        {
            dynamic res = _accountService.ReceiveGiftVip(idacc);
            
            return Ok(res);
        }

        [HttpGet("GetVipGift/{idacc}")]
        public IActionResult GetVipGift(int idacc)
        {
            dynamic res = _accountService.GetGiftVip(idacc);
            return Ok(res);
        }
    }
}
