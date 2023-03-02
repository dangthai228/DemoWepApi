using Demo.Models;
using Demo.Utils;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Demo.Service
{
    public interface IitemService
    {
        DbResult<dynamic> ChangeStatus(int idtype, int status);
    }
    public class ItemServices : IitemService
    {
        public DbResult<dynamic> ChangeStatus (int id,int status )
        {
            DbResult<dynamic>  res = new DbResult<dynamic> ();
            MySqlDataReader rd;
            MySqlConnection con = DbUtil.GetDBConnection();
            try
            {
                MySqlCommand cmd = new MySqlCommand("UseItemInventory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@p_inventoryId", id);
                cmd.Parameters.AddWithValue("@p_status", status);
                cmd.Parameters.Add("@p_ResponseText", MySqlDbType.VarChar);
                cmd.Parameters["@p_ResponseText"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p_ResponseStatus", MySqlDbType.Int32);
                cmd.Parameters["@p_ResponseStatus"].Direction = ParameterDirection.Output;
                con.Open();
                rd = cmd.ExecuteReader();
                string mess= Convert.ToString( cmd.Parameters["@p_ResponseText"].Value);
                int code = (int)cmd.Parameters["@p_ResponseStatus"].Value;

                res.Status = code;
                res.Data = mess;
                rd.Close();
                con.Close();
            }
            catch (Exception ex)
            {
               
                Console.WriteLine(ex.Message);
            }

            return res;
        }

       
    }
}
