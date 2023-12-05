using Nhom8_QLTV;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DA
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();
        private void btn_login_Click(object sender, EventArgs e)
        {
            string username = this.txt_account.Text;
            string password = this.txt_password.Text;
            sqlConnect.OpenConnection();
            DataTable dt = new DataTable();
            string sql = "select * from DangNhap where TenDangNhap = @TenDangNhap";
            SqlCommand cmd = new SqlCommand(sql, sqlConnect.con);
            cmd.CommandType = CommandType.Text;
            SqlParameter _username = new SqlParameter("@TenDangNhap", SqlDbType.VarChar);
            _username.Value = username;
            cmd.Parameters.Add(_username);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["MatKhau"].ToString() == password)
                {

                    string strConnect = $"Data Source=.;Initial Catalog=Nhom8_QLTV;User ID={username};Password={password}";
                    SQLConnect.SqlConnect.connectionString= strConnect ;
                    this.Hide();
                    Home form1 = new Home();               
                    form1.ShowDialog();
                }
                else
                {
                    MessageBox.Show("Password không đúng!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                MessageBox.Show("UserName không tồn tại!", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            sqlConnect.CloseConnection();
        }
       
        private void btn_Thoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }
    }
}