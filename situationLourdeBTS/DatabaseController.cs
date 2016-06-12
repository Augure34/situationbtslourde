using System;
using System.Collections.Generic;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;

namespace situationLourdeBTS
{
    static class DatabaseController
    {
        public static bool CreateNewConnection(string title, string servName, string dbName, string userId, string userPassword, out string exception)
        {
            
            //Check if connections have ever been added
            if(Properties.Settings.Default.Connections == null)
            {
                Properties.Settings.Default.Connections = new AppDatabase();
            }

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder()
            {
                DataSource = servName,
                InitialCatalog = dbName,
                IntegratedSecurity = false,
                UserID = userId,
                Password = userPassword,


            };

            SqlConnection connection = new SqlConnection(builder.ConnectionString);

            //Check if connection can be opened
            try
            {
                connection.Open();
            }
            catch (SqlException e)
            {
                exception = e.Message;
                return false;
            }
            finally
            {
                connection.Close();
            }

            if (!Properties.Settings.Default.Connections.ContainsKey(title))
            {
                Properties.Settings.Default.Connections.Add(title, builder.ConnectionString);
                Properties.Settings.Default.Save();
                exception = "";
                return true;
            }
            else
            {
                Properties.Settings.Default.Connections[title] = builder.ConnectionString;
                exception = "";
                return true;
            }
        }

        public static string GetConnection(string dbKey)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(Properties.Settings.Default.Connections[dbKey]);

            string connectionString = new EntityConnectionStringBuilder

            {

                Metadata = "res://*",

            Provider = "System.Data.SqlClient",

            ProviderConnectionString = builder.ConnectionString

        }.ConnectionString;

        return connectionString;
        }
    }
}
