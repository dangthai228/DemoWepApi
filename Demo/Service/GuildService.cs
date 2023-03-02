using Demo.Models;
using Demo.Utils;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System.Data;
using System;

using System.Collections;
using System.Collections.Generic;
using Org.BouncyCastle.Utilities;
using Google.Protobuf.Collections;
using System.Reflection.PortableExecutable;
using System.Xml.Linq;
using Microsoft.VisualBasic;

namespace Demo.Service
{

    public interface IGuildServices
    {
        string CreateGuild(int accountid , string name, string description );
        dynamic GetMemberesGuild(int accid);
        dynamic GetGuildTop50();
        string JoinGuild(int accid, int guildid);
        dynamic  GetListJoin(int accid);
        dynamic SearchGuild(string name);
        string RejectjoinGuild(int accid, int accid_join);
        string Changename(int accid, string name);
        string ChangeDescrip(int accid, string descrip);
        string ChangeNofi(int accid, string nofi);
        string ExpandTable(int accid);
        string ExpandMaxMembers(int accid);
        string ApproveJoin(int accid, int accid_join);
        string KickMember(int accid, int acckick);
        string LeaveGuild(int accid);
        string InviteGuild(int accid, int accid_is_invited);
        string HandleInvite(int accid, int guildid, int status);
        dynamic GetInviteGuild(int accid);
        string SetRollMembers(int accid , int accid_change,int status);
    }

    public class GuildService : IGuildServices
    {
        public string CreateGuild(int accountid, string name, string description)
        {
            MySqlDataReader rd;

            string kq = "";
            int code =0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("CreateGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accountid);
                cmd.Parameters.AddWithValue("@p_name_guild", name);
                cmd.Parameters.AddWithValue("@p_description", description);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return code + ":" + kq;
        }

        public dynamic GetMemberesGuild(int accid)
        {
            List<MembersGuild> dsmembers = new List<MembersGuild>();
            MySqlDataReader rd;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("GetMembersGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid );
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();

                using (rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        dsmembers.Add(new MembersGuild(int.Parse(rd["idaccount"].ToString()), rd["name"].ToString(), rd["Rollname"].ToString(), int.Parse(rd["Points"].ToString())));
                    }
                };
                int _code = (int)cmd.Parameters["@p_code"].Value;
                string kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                if (_code == 0)
                {
                    string json = JsonConvert.SerializeObject(dsmembers);
                    con.Close();
                    return _code + " : " + json;
                }
                else
                {
                    con.Close();
                    return _code +" : "+kq;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                
            }
            return null;
        }

        public dynamic GetGuildTop50()
        {
            MySqlDataReader rd;
            List<Guild> dsguild = new List<Guild>();
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("GetListGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                using (rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        dsguild.Add(new Guild(int.Parse(rd["id"].ToString()), int.Parse(rd["IdenCode"].ToString()), rd["GuildName"].ToString(), rd["Description"].ToString(), int.Parse(rd["CurMembers"].ToString()), int.Parse(rd["MaxMembers"].ToString()), int.Parse(rd["TotalPoint"].ToString())));
                    }
                };
                int _code = (int)cmd.Parameters["@p_code"].Value;
                string kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                if (_code == 0)
                {
                    string json = JsonConvert.SerializeObject(dsguild);
                    con.Close();
                    return _code + " : " + json;
                }
                else
                {
                    con.Close();
                    return _code + " : " + kq;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public dynamic GetListJoin(int accid)
        {
            MySqlDataReader rd;
            List<JoinGuild> dsjoin = new List<JoinGuild>();
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("GetListRegister", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                using (rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        dsjoin.Add(new JoinGuild(int.Parse(rd["idaccount"].ToString()),
                                                   rd["Name"].ToString(),
                                                   int.Parse(rd["Point"].ToString()),
                                                   DateTime.Parse(rd["TimeAdd"].ToString())
                            ));
                    }
                };
                int _code = (int)cmd.Parameters["@p_code"].Value;
                string kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                if (_code == 0)
                {
                    string json = JsonConvert.SerializeObject(dsjoin);
                    con.Close();
                    return _code + " : " + json;
                }
                else
                {
                    con.Close();
                    return _code + " : " + kq;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }
       
        public string JoinGuild(int accid, int guildid)
        {
            MySqlDataReader rd;

            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("JoinGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accId_join", accid);
                cmd.Parameters.AddWithValue("@p_guildId", guildid);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return code + ":" + kq;
        }

        public string RejectjoinGuild(int accid, int accid_join)
        {
            MySqlDataReader rd;

            string kq = "";
            int code = -1;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("RejectRegisterGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountid", accid);
                cmd.Parameters.AddWithValue("@p_accJoinId", accid_join);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return code + ":" + kq;
        }

        public dynamic SearchGuild(string name)
        {
            MySqlDataReader rd;
            List<Guild> dsguild = new List<Guild>();
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("Search_guild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("p_search", name);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                using (rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        dsguild.Add(new Guild(int.Parse(rd["id"].ToString()), int.Parse(rd["IdenCode"].ToString()), rd["GuildName"].ToString(), rd["Description"].ToString(), int.Parse(rd["CurMembers"].ToString()), int.Parse(rd["MaxMembers"].ToString()), int.Parse(rd["TotalPoint"].ToString())));
                    }
                };
                int _code = (int)cmd.Parameters["@p_code"].Value;
                string kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                if (_code == 0)
                {
                    string json = JsonConvert.SerializeObject(dsguild);
                    con.Close();
                    return _code + " : " + json;
                }
                else
                {
                    con.Close();
                    return _code + " : " + kq;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return null;
        }

        public string Changename(int accid, string name)
        {
            MySqlDataReader rd;

            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ChangeNameGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.AddWithValue("@p_nameguild", name);
                
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return code + ":" + kq;
        }

        public string ChangeDescrip(int accid, string descrip)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ChangeDescriptionGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.AddWithValue("@p_description", descrip);

                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string ChangeNofi(int accid, string nofi)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ChangeNoficationGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.AddWithValue("@p_nofi", nofi);

                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string ExpandTable(int accid)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ExpandTableGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);

                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string ExpandMaxMembers(int accid)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ExpendMaxMember", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);

                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string ApproveJoin(int accid, int accid_join)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("ApproveRegisterGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accId_approve", accid);
                cmd.Parameters.AddWithValue("@p_idacc", accid_join);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string KickMember(int accid, int accid_kicked)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("KickMember", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.AddWithValue("@p_kick_accId", accid_kicked);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string LeaveGuild(int accid)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("LeaveGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accId_leave", accid);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string InviteGuild(int accid, int accid_is_invited)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("InviteGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.AddWithValue("@p_accId_IsInvited", accid_is_invited);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public string HandleInvite(int accid, int guildid, int status)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("HandleInviteGuild", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountId", accid);
                cmd.Parameters.AddWithValue("@p_guildId", guildid);
                cmd.Parameters.AddWithValue("@p_status", status);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }

        public dynamic GetInviteGuild(int accid)
        {
            MySqlDataReader rd;
            List<InviteGuild> dsinvite = new List<InviteGuild>();
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("GetListInvite", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("p_idacc", accid);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                using (rd = cmd.ExecuteReader())
                {
                    while (rd.Read())
                    {
                        dsinvite.Add(new InviteGuild(int.Parse(rd["idguild"].ToString()),  rd["GuildName"].ToString(), rd["Description"].ToString(), int.Parse(rd["TotalPoint"].ToString()), DateTime.Parse(rd["TimeAdd"].ToString()) ));
                    }
                };
                int _code = (int)cmd.Parameters["@p_code"].Value;
                string kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                if (_code == 0)
                {
                    string json = JsonConvert.SerializeObject(dsinvite);
                    con.Close();
                    return _code + " : " + json;
                }
                else
                {
                    con.Close();
                    return _code + " : " + kq;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return null;
        }

        public string SetRollMembers(int accid, int accid_change, int status)
        {
            MySqlDataReader rd;
            string kq = "";
            int code = 0;
            try
            {
                MySqlConnection con = DbUtil.GetDBConnection();
                MySqlCommand cmd = new MySqlCommand("SetRollMember", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_accountid", accid);
                cmd.Parameters.AddWithValue("@p_accidchange", accid_change);
                cmd.Parameters.AddWithValue("@p_status", status);
                cmd.Parameters.Add("@p_code", MySqlDbType.Int32);
                cmd.Parameters["@p_code"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_message", MySqlDbType.VarChar);
                cmd.Parameters["@p_message"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                kq = Convert.ToString(cmd.Parameters["@p_message"].Value);
                code = (int)cmd.Parameters["@p_code"].Value;

                con.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return code + ":" + kq;
        }
    }

}
