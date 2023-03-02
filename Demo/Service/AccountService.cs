using Demo.Models;
using Demo.Utils;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Asn1.Ocsp;
using Org.BouncyCastle.Crypto;
using System;
using System.Collections.Generic;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Net.NetworkInformation;
using System.Security.Claims;
using System.Text;

namespace Demo.Service
{
    public interface IAccountService
    {

        DbResult<dynamic> BuyItem(Transaction item);
        DbResult<dynamic> GetShop();
        DbResult<dynamic> GetAccountInfo(int idacc);
        DbResult<dynamic> GetInventory(int idacc);
        string CheckLogin(User request);
        string GenerateToken(User user);
        DbResult<dynamic> ReceiveGiftVip(int idacc);
        dynamic ConvertCoin(TienTe convert);
        DbResult<dynamic> GetGiftVip(int idacc);
    }
    public class AccountService : IAccountService
    {
        private IConfiguration _config;

        public AccountService(IConfiguration config)
        {
            _config = config;
        }
        public DbResult<dynamic> BuyItem(Transaction item)
        {

            MySqlDataReader rd;

            DbResult<dynamic> res = new DbResult<dynamic>();   
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("BuyItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", JsonConvert.SerializeObject(item.idacc));
                cmd.Parameters.AddWithValue("@p_ItemId", JsonConvert.SerializeObject(item.iditem));
                cmd.Parameters.AddWithValue("@p_Days", JsonConvert.SerializeObject(item.songaythue));
                cmd.Parameters.Add("@p_ResponseText", MySqlDbType.VarChar);
                cmd.Parameters["@p_ResponseText"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_ResponseStatus", MySqlDbType.Int32);
                cmd.Parameters["@p_ResponseStatus"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                int _status = (int)(cmd.Parameters["@p_ResponseStatus"].Value);
                string _mess = Convert.ToString(cmd.Parameters["@p_ResponseText"].Value);
                res.Status = _status;
                res.Data = _mess;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return res;
        }

        public string CheckLogin(User request)
        {
            MySqlDataReader rd;
            
            string res = null;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("checklogin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", request.Username);
                cmd.Parameters.AddWithValue("@passwd", request.Password);
                cmd.Parameters.Add("@_result", MySqlDbType.VarChar);
                cmd.Parameters["@_result"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                res = Convert.ToString(cmd.Parameters["@_result"].Value);
                con.Close();
                return res;
            }
            catch (Exception ex)
            {
                res = "Error : "+ex.Message;
                Console.WriteLine(ex.Message);
            }
            return res;
        }

        public DbResult<dynamic> GetShop()
        {
            MySqlDataReader rd;
            DbResult<dynamic> res = new DbResult<dynamic>();
            res.Status = -1;
            res.Data = "Shop rỗng";

            List<ShopItem> shopitems = new List<ShopItem>();
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("getshop", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                rd = cmd.ExecuteReader();
                if(rd.HasRows)
                {
                    while (rd.Read())
                    {
                        ShopItem row = new ShopItem();
                        row.ItemId =  rd.GetInt32("id");
                        row.NameItem= rd.GetString("name");
                        row.DescriptionItem = rd.GetString("description");
                        row.BuyPrize = rd.GetInt32("gold");
                        row.BrrPrize = rd.GetInt32("brrgold");
                        row.Type = rd.GetString("type");
                        shopitems.Add(row);
                    }
                    res.Status = 1;
                    res.Data = shopitems;

                }    
                con.Close();
                return res;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return res;
        }



        public DbResult<dynamic> GetInventory(int idacc)
        {
            MySqlDataReader rd;
            DbResult<dynamic> res = new DbResult<dynamic>();
            res.Status = -1;
            res.Data = "Rương đồ rỗng";

            List<InventoryItem> _listInventory= new List<InventoryItem>();
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("getinventory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", idacc);
                con.Open();
                rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        InventoryItem row = new InventoryItem();
                        row.Idinventory = rd.GetInt32("id");
                        row.Iditem = rd.GetInt32("iditem");
                        row.Status = rd.GetInt32("status");
                        row.Name = rd.GetString("name");
                        row.Description = rd.GetString("description");
                        if (!DBNull.Value.Equals(rd["expired"]))
                        {
                            row.Expired = rd.GetDateTime("expired");
                        }
                        else
                        {
                            row.Expired = null;
                        }
                        _listInventory.Add(row);
                    }
                    res.Status = 1;
                    res.Data = _listInventory;

                }
                con.Close();
                return res;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return res;
        }

        public string GenerateToken(User user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[] {
                   new Claim("Username", user.Username)
            };

            var token = new JwtSecurityToken(null,null,
                claims,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        public dynamic ConvertCoin (TienTe chuyendoi)
        {
           
            
            MySqlDataReader rd;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ConvertCoin", con);
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.AddWithValue("@p_accountId", chuyendoi.Idacc);
                cmd.Parameters.AddWithValue("@p_number_coin", chuyendoi.numbers);
                cmd.Parameters.Add("@p_ResponseText", MySqlDbType.VarChar);
                cmd.Parameters["@p_ResponseText"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_ResponseStatus", MySqlDbType.Int32);
                cmd.Parameters["@p_ResponseStatus"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                string res = Convert.ToString(cmd.Parameters["@p_ResponseText"].Value);
                int code = (int)(cmd.Parameters["@p_ResponseStatus"].Value);
                con.Close();
                var obj = new
                {
                    status = code,
                    data = res
                };
                return obj;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public DbResult<dynamic> ReceiveGiftVip(int idacc)
        {
            DbResult<dynamic> res = new DbResult<dynamic>();
            MySqlDataReader rd;
            MySqlConnection con = DbUtil.GetDBConnection();
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("ReceiveGiftVip", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", idacc);
                cmd.Parameters.Add("@p_ResponseText", MySqlDbType.VarChar);
                cmd.Parameters["@p_ResponseText"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_ResponseStatus", MySqlDbType.Int32);
                cmd.Parameters["@p_ResponseStatus"].Direction = ParameterDirection.Output;
                rd = cmd.ExecuteReader();
                string mess = Convert.ToString(cmd.Parameters["@p_ResponseText"].Value);
                int code = (int)cmd.Parameters["@p_ResponseStatus"].Value;
                res.Status= code;
                res.Data = mess;
            } 
            catch(Exception ex) 
            {
                Console.WriteLine(ex.Message);
            }
            return res;
        }

        public DbResult<dynamic> GetAccountInfo(int idacc)
        {
            MySqlDataReader rd;
            DbResult<dynamic> res = new DbResult<dynamic>();
            res.Status = -1;
            res.Data = "Tài khoản không tồn tại";

            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("GetUserInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", idacc);
                con.Open();
                rd = cmd.ExecuteReader();
                Account row = new Account();
                if(rd.HasRows)
                {
                    while (rd.Read())
                    {
                        row.accountid = rd.GetInt32("id");
                        row.name = rd.GetString("Name");
                        row.dob =  rd.GetDateTime("Dob").ToString();
                        row.sex = rd.GetString("Sex");
                        row.gold = rd.GetInt32("Gold");
                        row.level = rd.GetInt32("Level");
                        row.viplevel = rd.GetInt32("VipLevel");
                        row.vipgift = rd.GetInt32("GiftVip");
                        row.rank = rd.GetString("CurRank");
                    }
                    res.Status = 1;
                    res.Data = row;
                }
                con.Close();
                return res; 
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return res;
        }

        public DbResult<dynamic> GetGiftVip(int idacc)
        {
            MySqlDataReader rd;
            List<GiftVipItem> _listvipitem = new List<GiftVipItem>();
            DbResult<dynamic> res= new DbResult<dynamic>();
            res.Status = -99;
            res.Data = "Lỗi không xác định";
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("GetVipBonus", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", idacc);
                cmd.Parameters.Add("@p_ResponseStatus", MySqlDbType.Int32);
                cmd.Parameters["@p_ResponseStatus"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_ResponseText", MySqlDbType.VarChar);
                cmd.Parameters["@p_ResponseText"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_Goldvip", MySqlDbType.Int32);
                cmd.Parameters["@p_Goldvip"].Direction = ParameterDirection.Output;
                con.Open();
                using (rd = cmd.ExecuteReader())
                {
                    if (rd.HasRows)
                    {
                        while (rd.Read())
                        {
                            GiftVipItem row = new GiftVipItem();
                            row.IdItem = rd.GetInt32("id");
                            row.Name = rd.GetString("name");
                            row.Description = rd.GetString("description");
                            _listvipitem.Add(row);
                        }
                    }     
                }
                int _status = (int)cmd.Parameters["@p_ResponseStatus"].Value;
                string _message = Convert.ToString(cmd.Parameters["@p_ResponseText"].Value);
                int _gold = (int)cmd.Parameters["@p_Goldvip"].Value;
                if (_status == 1)
                {
                    res.Status= _status;
                    res.Data = new 
                    { 
                        Gold = _gold,
                        ListItem = _listvipitem
                    };
                }
                else
                {
                    res.Status = _status;
                    res.Data = _message;
                }
                    

                con.Close();
                return res;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return res;
        }
    }
}
