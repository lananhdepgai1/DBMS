using DA;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static Nhom8_QLTV.SQLConnect;

namespace Nhom8_QLTV
{
    public partial class TaiKhoan : UserControl
    {
        public TaiKhoan()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();

        private void btn_CapNhat_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = txt_userName.Text;
                string password = txt_password.Text;
                string comfirmpassword = txt_comfirmpassword.Text;
                if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(comfirmpassword))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                if (password != comfirmpassword)
                {
                    MessageBox.Show("Mật khẩu không trùng khớp, vui lòng nhập lại!.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThayDoiMatKhau", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TenDangNhap", SqlDbType.NVarChar).Value = txt_userName.Text.Trim();
                cmd.Parameters.Add("@MatKhau", SqlDbType.NVarChar).Value = txt_comfirmpassword.Text.Trim();
                DialogResult result = MessageBox.Show("Xác nhận đổi mật khẩu?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Đổi mật khẩu thành công");
                    }
                    else
                    {
                        MessageBox.Show("Thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                sqlConnect.CloseConnection();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btn_DangXuat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
