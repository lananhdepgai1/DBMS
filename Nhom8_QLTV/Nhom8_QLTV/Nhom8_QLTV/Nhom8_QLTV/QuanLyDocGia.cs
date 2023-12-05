using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Nhom8_QLTV
{
    public partial class QuanLyDocGia : UserControl
    {
        public QuanLyDocGia()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();

        public void LoadDocGia()
        {
            string sql = "SELECT * FROM view_CTThongTinDocGia";
            dgv_DocGia.DataSource = sqlConnect.ExecuteQuery(sql);
        }
        public void XemDocGia()
        {
            try
            {
                sqlConnect.OpenConnection();
                string sql = "SELECT * FROM view_CTThongTinDocGia";
                dgv_DocGia.DataSource = sqlConnect.ExecuteQuery(sql);
                sqlConnect.CloseConnection();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void ThemDocGia()
        {
            try
            {
                string maDocGia = txt_DocGia_MaDocGia.Text.Trim();
                string tenDocGia = txt_DocGia_TenDocGia.Text.Trim();
                string gioiTinh = cbo_DocGia_GioiTinh.Text.Trim();
                string cccd = txt_DocGia_CCCD.Text.Trim();
                string diaChi = txt_DocGia_DiaChi.Text.Trim();
                string sdt = txt_DocGia_SDT.Text.Trim();
                if (string.IsNullOrEmpty(maDocGia) || string.IsNullOrEmpty(tenDocGia) || string.IsNullOrEmpty(gioiTinh) ||
                    string.IsNullOrEmpty(cccd) || string.IsNullOrEmpty(diaChi) || string.IsNullOrEmpty(sdt))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThemDocGia", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaDocGia", SqlDbType.NVarChar).Value = txt_DocGia_MaDocGia.Text.Trim();
                cmd.Parameters.Add("@TenDocGia", SqlDbType.NVarChar).Value = txt_DocGia_TenDocGia.Text.Trim();
                cmd.Parameters.Add("@GioiTinh", SqlDbType.NVarChar).Value = cbo_DocGia_GioiTinh.Text.Trim();
                cmd.Parameters.Add("@CCCD", SqlDbType.NVarChar).Value = txt_DocGia_CCCD.Text.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = txt_DocGia_DiaChi.Text.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.NVarChar).Value = txt_DocGia_SDT.Text.Trim();
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txt_DocGia_Email.Text.Trim();
                DialogResult result = MessageBox.Show("Xác nhận thêm?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Thêm thành công");
                        LoadDocGia();
                    }
                    else
                    {
                        MessageBox.Show("Thêm thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void XoaDocGia()
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_XoaDocGia", sqlConnect.con);
                cmd.Parameters.Add("@MaDocGia", SqlDbType.NVarChar).Value = txt_DocGia_MaDocGia.Text.Trim();
                cmd.CommandType = CommandType.StoredProcedure;
                DialogResult result = MessageBox.Show("Xác nhận xóa", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Xóa thành công");
                        LoadDocGia();
                    }
                }
                else
                {
                    MessageBox.Show("Xóa thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void SuaDocGia()
        {
            try
            {
                string maDocGia = txt_DocGia_MaDocGia.Text.Trim();
                string tenDocGia = txt_DocGia_TenDocGia.Text.Trim();
                string gioiTinh = cbo_DocGia_GioiTinh.Text.Trim();
                string cccd = txt_DocGia_CCCD.Text.Trim();
                string diaChi = txt_DocGia_DiaChi.Text.Trim();
                string sdt = txt_DocGia_SDT.Text.Trim();
                if (string.IsNullOrEmpty(maDocGia) || string.IsNullOrEmpty(tenDocGia) || string.IsNullOrEmpty(gioiTinh) ||
                    string.IsNullOrEmpty(cccd) || string.IsNullOrEmpty(diaChi) || string.IsNullOrEmpty(sdt))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_SuaDocGia", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaDocGia", SqlDbType.NVarChar).Value = txt_DocGia_MaDocGia.Text.Trim();
                cmd.Parameters.Add("@TenDocGia", SqlDbType.NVarChar).Value = txt_DocGia_TenDocGia.Text.Trim();
                cmd.Parameters.Add("@GioiTinh", SqlDbType.NVarChar).Value = cbo_DocGia_GioiTinh.Text.Trim();
                cmd.Parameters.Add("@CCCD", SqlDbType.NVarChar).Value = txt_DocGia_CCCD.Text.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = txt_DocGia_DiaChi.Text.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.NVarChar).Value = txt_DocGia_SDT.Text.Trim();
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txt_DocGia_Email.Text.Trim();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    DialogResult result = MessageBox.Show("Xác nhận sửa?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (result == DialogResult.Yes)
                    {
                        MessageBox.Show("Sửa thành công");
                        LoadDocGia();
                    }
                }
                else
                {
                    MessageBox.Show("Sửa thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void TimKiemDocGia()
        {
            string tuKhoa = txt_DocGia_TimKiem.Text.Trim();
            if (string.IsNullOrEmpty(tuKhoa))
            {
                MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (rbt_DocGia_MaDocGia.Checked)
            {
                string query = "SELECT * FROM dbo.func_TimDocGiaTheoMa(@TuKhoa)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TuKhoa", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_DocGia.DataSource = dt;
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy độc giả phù hợp: " + tuKhoa, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else if (rbt_DocGia_TenDocGia.Checked)
            {
                string query = "SELECT * FROM dbo.func_TimDocGiaTheoTen(@TuKhoa)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TuKhoa", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_DocGia.DataSource = dt;
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy độc giả phù hợp: " + tuKhoa, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else if (rbt_DocGia_SDT.Checked)
            {
                string query = "SELECT * FROM dbo.func_TimDocGiaTheoSDT(@TuKhoa)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TuKhoa", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_DocGia.DataSource = dt;
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy độc giả phù hợp: " + tuKhoa, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Không tìm thấy độc giả phù hợp!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void btn_XemDocGia_Click(object sender, EventArgs e)
        {
            XemDocGia();
        }
        
        private void btn_ThemDocGia_Click(object sender, EventArgs e)
        {
            ThemDocGia();
        }

        private void btn_ChinhSuaDocGia_Click(object sender, EventArgs e)
        {
            SuaDocGia();
        }

        private void btn_XoaDocGia_Click(object sender, EventArgs e)
        {
            XoaDocGia();
        }

        private void btn_TimKiemDocGia_Click(object sender, EventArgs e)
        {
            TimKiemDocGia();
        }

        private void btn_DocGia_Reset_Click(object sender, EventArgs e)
        {
            txt_DocGia_MaDocGia.ResetText();
            txt_DocGia_TenDocGia.ResetText();
            cbo_DocGia_GioiTinh.ResetText();
            txt_DocGia_CCCD.ResetText();
            txt_DocGia_DiaChi.ResetText();
            txt_DocGia_SDT.ResetText();
            txt_DocGia_Email.ResetText();
            txt_DocGia_TimKiem.ResetText();
            rbt_DocGia_MaDocGia.Checked = false;
            rbt_DocGia_TenDocGia.Checked = false;
            rbt_DocGia_SDT.Checked = false;
            lbl_DocGia_TimKiemDocGia.Text = "Nhập Từ Khóa:";
        }

        private void rbt_DocGia_MaDocGia_CheckedChanged(object sender, EventArgs e)
        {
            lbl_DocGia_TimKiemDocGia.Text = "Nhập Mã Độc Giả:";
        }
        private void rbt_DocGia_TenDocGia_CheckedChanged(object sender, EventArgs e)
        {
            lbl_DocGia_TimKiemDocGia.Text = "Nhập Tên Độc Giả:";
        }

        private void rbt_DocGia_SDT_CheckedChanged(object sender, EventArgs e)
        {
            lbl_DocGia_TimKiemDocGia.Text = "Nhập SĐT:";
        }

        private void dgv_DocGia_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_DocGia_MaDocGia.Text = dgv_DocGia.CurrentRow.Cells[0].Value.ToString();
            txt_DocGia_TenDocGia.Text = dgv_DocGia.CurrentRow.Cells[1].Value.ToString();
            cbo_DocGia_GioiTinh.Text = dgv_DocGia.CurrentRow.Cells[2].Value.ToString();
            txt_DocGia_CCCD.Text = dgv_DocGia.CurrentRow.Cells[3].Value.ToString();
            txt_DocGia_DiaChi.Text = dgv_DocGia.CurrentRow.Cells[4].Value.ToString();
            txt_DocGia_SDT.Text = dgv_DocGia.CurrentRow.Cells[5].Value.ToString();
            txt_DocGia_Email.Text = dgv_DocGia.CurrentRow.Cells[6].Value.ToString();
        }
    }
}
