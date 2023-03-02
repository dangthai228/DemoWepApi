using Microsoft.AspNetCore.Hosting.Server;
using MySql.Data.MySqlClient;
using System;

namespace Demo.Utils
{
    public class DbConnection
    {
        public static MySqlConnection
                 GetDBConnection(string host, int port, string database, string username, string password)
        {
            // Connection String.
            string connString = "Server=" + host + ";Database=" + database
                + ";port=" + port + ";User Id=" + username + ";password=" + password;

            MySqlConnection conn = new MySqlConnection(connString);

            return conn;
        }
    }

}
