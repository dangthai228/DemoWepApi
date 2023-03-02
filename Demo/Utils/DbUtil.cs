using MySql.Data.MySqlClient;

namespace Demo.Utils
{
    public class DbUtil
    {
        public static MySqlConnection GetDBConnection()
        {
            string host = "127.0.0.1";
            int port = 3306;
            string database = "demo";
            string username = "root";
            string password = "thai22820001";

            return DbConnection.GetDBConnection(host, port, database, username, password);
        }
    }
}
