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

namespace Nhom8_QLTV
{
    public partial class QuanLyNhanVien : UserControl
    {
        public QuanLyNhanVien()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();
        private void tp_NhanVien_Click(object sender, EventArgs e)
        {

        }
        public void LoadNhanVien()
        {
            string sql = "SELECT * FROM view_CTThongTinNV";
            dgv_NhanVien.DataSource = sqlConnect.ExecuteQuery(sql);

        }
        public void XemNhanVien()
        {
            try
            {
                sqlConnect.OpenConnection();
                LoadNhanVien();
                sqlConnect.CloseConnection();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void ThemNhanVien()
        {
            try
            {
                string maNhanVien = txt_NhanVien_MaNhanVien.Text.Trim();
                string hoTen = txt_NhanVien_HoTen.Text.Trim();
                string cccd = txt_NhanVien_CCCD.Text.Trim();
                string diaChi = txt_NhanVien_DiaChi.Text.Trim();
                string sdt = txt_NhanVien_SDT.Text.Trim();
                if (string.IsNullOrEmpty(maNhanVien) || string.IsNullOrEmpty(hoTen) ||
                    string.IsNullOrEmpty(cccd) || string.IsNullOrEmpty(diaChi) || string.IsNullOrEmpty(sdt))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThemNhanVien", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaNhanVien", SqlDbType.NVarChar).Value = txt_NhanVien_MaNhanVien.Text.Trim();
                cmd.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = txt_NhanVien_HoTen.Text.Trim();
                cmd.Parameters.Add("@CCCD", SqlDbType.NVarChar).Value = txt_NhanVien_CCCD.Text.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = txt_NhanVien_DiaChi.Text.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.NVarChar).Value = txt_NhanVien_SDT.Text.Trim();
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txt_NhanVien_Email.Text.Trim();
                DialogResult result = MessageBox.Show("Xác nhận thêm?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Thêm thành công");
                        LoadNhanVien();
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
        public void SuaNhanVien()
        {
            try
            {
                string maNhanVien = txt_NhanVien_MaNhanVien.Text.Trim();
                string hoTen = txt_NhanVien_HoTen.Text.Trim();
                string cccd = txt_NhanVien_CCCD.Text.Trim();
                string diaChi = txt_NhanVien_DiaChi.Text.Trim();
                string sdt = txt_NhanVien_SDT.Text.Trim();
                if (string.IsNullOrEmpty(maNhanVien) || string.IsNullOrEmpty(hoTen) ||
                    string.IsNullOrEmpty(cccd) || string.IsNullOrEmpty(diaChi) || string.IsNullOrEmpty(sdt))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_SuaNhanVien", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaNhanVien", SqlDbType.NVarChar).Value = txt_NhanVien_MaNhanVien.Text.Trim();
                cmd.Parameters.Add("@HoTen", SqlDbType.NVarChar).Value = txt_NhanVien_HoTen.Text.Trim();
                cmd.Parameters.Add("@CCCD", SqlDbType.NVarChar).Value = txt_NhanVien_CCCD.Text.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar).Value = txt_NhanVien_DiaChi.Text.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.NVarChar).Value = txt_NhanVien_SDT.Text.Trim();
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txt_NhanVien_Email.Text.Trim();
                DialogResult result = MessageBox.Show("Xác nhận sửa?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Sửa thành công");
                        LoadNhanVien();
                    }
                    else
                    {
                        MessageBox.Show("Sửa thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void XoaNhanVien()
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_XoaNhanVien", sqlConnect.con);
                cmd.Parameters.Add("@MaNhanVien", SqlDbType.NVarChar).Value = txt_NhanVien_MaNhanVien.Text.Trim();
                cmd.CommandType = CommandType.StoredProcedure;
                DialogResult result = MessageBox.Show("Xác nhận xóa", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Xóa nhân viên thành công");
                        LoadNhanVien();
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

        public void XoaTaiKhoan()
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_XoaTaiKhoan", sqlConnect.con);
                cmd.Parameters.Add("@TenDangNhap", SqlDbType.NVarChar).Value = txt_NhanVien_MaNhanVien.Text.Trim();
                cmd.CommandType = CommandType.StoredProcedure;
                if (cmd.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Xóa tài khoản thành công");
                    LoadNhanVien();
                }
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void TimKiemNhanVien()
        {
            string tuKhoa = txt_NhanVien_TimKiem.Text.Trim();
            if (string.IsNullOrEmpty(tuKhoa))
            {
                MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (rbt_NhanVien_MaNhanVien.Checked)
            {
                string query = "SELECT * FROM func_TimNhanVienTheoMa(@TuKhoa)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TuKhoa", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_NhanVien.DataSource = dt;
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else if (rbt_NhanVien_TenNhanVien.Checked)
            {
                string query = "SELECT * FROM func_TimNhanVienTheoTen(@TuKhoa)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TuKhoa", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_NhanVien.DataSource = dt;
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else if (rbt_NhanVien_SDT.Checked)
            {
                string query = "SELECT * FROM func_TimNhanVienTheoSDT(@TuKhoa)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TuKhoa", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_NhanVien.DataSource = dt;
                    }
                    else
                    {
                        MessageBox.Show("Không tìm thấy!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Không tìm thấy!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void dgv_NhanVien_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_NhanVien_MaNhanVien.Text = dgv_NhanVien.CurrentRow.Cells[0].Value.ToString();
            txt_NhanVien_HoTen.Text = dgv_NhanVien.CurrentRow.Cells[1].Value.ToString();
            txt_NhanVien_CCCD.Text = dgv_NhanVien.CurrentRow.Cells[2].Value.ToString();
            txt_NhanVien_DiaChi.Text = dgv_NhanVien.CurrentRow.Cells[4].Value.ToString();
            txt_NhanVien_SDT.Text = dgv_NhanVien.CurrentRow.Cells[3].Value.ToString();
            txt_NhanVien_Email.Text = dgv_NhanVien.CurrentRow.Cells[5].Value.ToString();

        }

        private void btn_ThemNhanVien_Click(object sender, EventArgs e)
        {
            ThemNhanVien();
        }

        private void btn_XemNhanVien_Click(object sender, EventArgs e)
        {
            XemNhanVien();
        }

        private void btn_ChinhSuaNhanVien_Click(object sender, EventArgs e)
        {
            SuaNhanVien();
        }

        private void btn_XoaNhanVien_Click(object sender, EventArgs e)
        {
            XoaNhanVien();
            XoaTaiKhoan();
        }

        private void btn_TimKienNhanVien_Click(object sender, EventArgs e)
        {
            TimKiemNhanVien();
        }

        private void btn_ResetNhanVien_Click(object sender, EventArgs e)
        {
            txt_NhanVien_MaNhanVien.ResetText();
            txt_NhanVien_HoTen.ResetText();
            txt_NhanVien_CCCD.ResetText();
            txt_NhanVien_DiaChi.ResetText();
            txt_NhanVien_SDT.ResetText();
            txt_NhanVien_Email.ResetText();
            txt_NhanVien_TimKiem.ResetText();
            rbt_NhanVien_MaNhanVien.Checked = false;
            rbt_NhanVien_TenNhanVien.Checked = false;
            rbt_NhanVien_SDT.Checked = false;
            lbl_NhanVien_TimKiem.Text = "Nhập Từ Khóa:";
        }

        private void rbt_NhanVien_MaNhanVien_CheckedChanged(object sender, EventArgs e)
        {
            lbl_NhanVien_TimKiem.Text = "Nhập Mã Nhân Viên:";
        }

        private void rbt_NhanVien_TenNhanVien_CheckedChanged(object sender, EventArgs e)
        {
            lbl_NhanVien_TimKiem.Text = "Nhập Tên Nhân Viên: ";
        }

        private void rbt_NhanVien_SDT_CheckedChanged(object sender, EventArgs e)
        {
            lbl_NhanVien_TimKiem.Text = "Nhập SĐT: ";
        }
    }
}
