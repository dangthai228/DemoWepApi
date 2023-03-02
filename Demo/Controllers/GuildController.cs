using Demo.Models;
using Demo.Service;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Org.BouncyCastle.Crypto.Engines;
using System;
using System.Collections.Generic;

namespace Demo.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GuildController : ControllerBase
    {
        private IGuildServices _guildservice;

        public GuildController(IGuildServices guildservice)
        {
            _guildservice = guildservice;
        }

        [HttpPost("taoconghoi")]
        public IActionResult CreateGuild( CreateGuild guild)
        {
            string res = _guildservice.CreateGuild(guild.AccIdCreate,guild.Name,guild.Description);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }
        [HttpPost("joinguild")]
        public IActionResult JoinInGuild(int accid, int guildid)
        {
            string res = _guildservice.JoinGuild(accid,guildid);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("rejectjoin/{accid}/{accid_join}")]
        public IActionResult RejectRegister(int accid, int accid_join)
        {
            string res = _guildservice.RejectjoinGuild(accid, accid_join);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("changeguildname")]
        public IActionResult ChangeGuildName(int accid, string name)
        {
            string res = _guildservice.Changename(accid, name);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("changenofi")]
        public IActionResult ChangeNoficationGuild(int accid, string nofi)
        {
            string res = _guildservice.ChangeNofi(accid, nofi);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("changeguilddescription")]
        public IActionResult ChangeDescription(int accid, string descrip)
        {
            string res = _guildservice.ChangeDescrip(accid, descrip);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("expandtable")]
        public IActionResult ExpandGuildTable(int accid)
        {
            string res = _guildservice.ExpandTable(accid);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("expandmaxmembers")]
        public IActionResult ExpandGuildMaxMembers(int accid)
        {
            string res = _guildservice.ExpandMaxMembers(accid);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("acceptjoin")]
        public IActionResult AcceptJoinGuild(int accid,int accid_join)
        {
            string res = _guildservice.ApproveJoin(accid,accid_join);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("kickmember")]
        public IActionResult KickGuildMembers(int accid, int accid_kick)
        {
            string res = _guildservice.KickMember(accid, accid_kick);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }
        [HttpPost("leaveguild")]
        public IActionResult LeaveGuild(int accid)
        {
            string res = _guildservice.LeaveGuild(accid);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("inviteguild")]
        public IActionResult InviteGuild(int accid, int accid_invite)
        {
            string res = _guildservice.InviteGuild(accid, accid_invite);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("handleinvite")]
        public IActionResult HandleInvite(int accid, int guildid, int status)
        {
            string res = _guildservice.HandleInvite(accid, guildid, status);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpPost("setroll")]
        public IActionResult SetRollMember(int accid, int accid_invite, int status)
        {
            string res = _guildservice.SetRollMembers(accid, accid_invite, status);
            string[] result = res.Split(':');
            int _code = int.Parse(result[0]);
            string mess = result[1];
            return Ok(new { code = _code, message = mess });
        }

        [HttpGet("guildmember/{accid}")]
        public IActionResult GetListMembersGuild(int accid)
        {
            string res = _guildservice.GetMemberesGuild(accid);
            if (res != null)
            {
                string[] result = res.Split(" : ", 2);

                int _code = int.Parse(result[0]);

                string mess = res.Substring(result[0].Length + 3);
                if (_code == 0 )
                {
                    var json = JsonConvert.DeserializeObject<List<MembersGuild>>(mess);
                    return Ok(new { code = _code, data = json });
                }
                return Ok(new { code = _code, data = mess });
            }
            else
            {
                return BadRequest(new {code = -999,date = "Lỗi không xác định"});
            }    
        }

        [HttpGet("getguild")]
        public IActionResult GetGuildTop50()
        {
            string res = _guildservice.GetGuildTop50();
            if (res != null)
            {
                string[] result = res.Split(" : ",2);
                
                int _code = int.Parse(result[0]);
              
                string mess = res.Substring(result[0].Length + 3);
                if (_code == 0)
                {
                    var json = JsonConvert.DeserializeObject<List<Guild>>(mess);
                    return Ok(new { code = _code, data = json });
                }
                return Ok(new { code = _code, data = mess });
            }
            else
            {
                return BadRequest(new { code = -999, date = "Lỗi không xác định" });
            }
        }

        [HttpGet("searchguild")]
        public IActionResult SearchGuild(string name)
        {
            string res = _guildservice.SearchGuild(name);
            if (res != null)
            {
                string[] result = res.Split(" : ", 2);

                int _code = int.Parse(result[0]);

                string mess = res.Substring(result[0].Length + 3);
                if (_code == 0)
                {
                    var json = JsonConvert.DeserializeObject<List<Guild>>(mess);
                    return Ok(new { code = _code, data = json });
                }
                return Ok(new { code = _code, data = mess });
            }
            else
            {
                return BadRequest(new { code = -999, date = "Lỗi không xác định" });
            }
        }

        [HttpGet("getjoinguild/{accid}")]
        public IActionResult GetListJoinGuild(int accid)
        {
            string res = _guildservice.GetListJoin(accid);
            if (res != null)
            {
                string[] result = res.Split(" : ", 2);

                int _code = int.Parse(result[0]);

                string mess = res.Substring(result[0].Length + 3);
                if (_code == 0)
                {
                    var json = JsonConvert.DeserializeObject<List<JoinGuild>>(mess);
                    return Ok(new { code = _code, data = json });
                }
                return Ok(new { code = _code, data = mess });
            }
            else
            {
                return BadRequest(new { code = -999, date = "Lỗi không xác định" });
            }
        }

        [HttpGet("getinviteguild/{accid}")]
        public IActionResult GetListInviteGuild(int accid)
        {
            string res = _guildservice.GetInviteGuild(accid);
            if (res != null)
            {
                string[] result = res.Split(" : ", 2);

                int _code = int.Parse(result[0]);

                string mess = res.Substring(result[0].Length + 3);
                if (_code == 0)
                {
                    var json = JsonConvert.DeserializeObject<List<InviteGuild>>(mess);
                    return Ok(new { code = _code, data = json });
                }
                return Ok(new { code = _code, data = mess });
            }
            else
            {
                return BadRequest(new { code = -999, date = "Lỗi không xác định" });
            }
        }

    }
}
