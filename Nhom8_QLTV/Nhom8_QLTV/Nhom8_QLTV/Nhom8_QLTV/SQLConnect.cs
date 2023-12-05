using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nhom8_QLTV
{
    public class SQLConnect
    {
        public class SqlConnect
        {
            static public string connectionString = "Data Source=.;Initial Catalog=Nhom8_QLTV;Integrated Security=True";

            public SqlConnection con;

            public SqlConnect()
            {
                con = new SqlConnection(connectionString);
            }

            public void OpenConnection()
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
            }

            public void CloseConnection()
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }

            public DataTable ExecuteQuery(string query, SqlParameter[] parameters = null)
            {
                DataTable dt = new DataTable();
                OpenConnection();

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }

                CloseConnection();
                return dt;
            }
        }
    }
}
