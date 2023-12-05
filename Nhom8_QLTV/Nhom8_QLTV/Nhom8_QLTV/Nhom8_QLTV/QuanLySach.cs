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
    public partial class QuanLySach : UserControl
    {
        public QuanLySach()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();
        public void LoadSach()
        {
            string sql = "SELECT * FROM view_CTThongTinSach";
            dgv_Sach.DataSource = sqlConnect.ExecuteQuery(sql);
        }
        public void XemSach()
        {
            try
            {
                sqlConnect.OpenConnection();
                string sql = "SELECT * FROM view_CTThongTinSach";
                dgv_Sach.DataSource = sqlConnect.ExecuteQuery(sql);
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void ThemSach()
        {
            try
            {
                string maSach = txt_DauSach_MaSach.Text.Trim();
                string tenSach = txt_DauSach_TenSach.Text.Trim();
                string maTacGia = txt_DauSach_MaTacGia.Text.Trim();
                string maNXB = txt_DauSach_MaNXB.Text.Trim();
                string maTheLoai = txt_DauSach_MaTheLoai.Text.Trim();
                string gia = txt_DauSach_DonGia.Text.Trim();
                string soLuong = txt_DauSach_SoLuong.Text.Trim();
                if (string.IsNullOrEmpty(maSach) || string.IsNullOrEmpty(tenSach) || string.IsNullOrEmpty(maTacGia) ||
                    string.IsNullOrEmpty(maNXB) || string.IsNullOrEmpty(maTheLoai))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThemSach", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaSach", SqlDbType.NVarChar).Value = txt_DauSach_MaSach.Text.Trim();
                cmd.Parameters.Add("@TenSach", SqlDbType.NVarChar).Value = txt_DauSach_TenSach.Text.Trim();
                cmd.Parameters.Add("@MaTacGia", SqlDbType.NVarChar).Value = txt_DauSach_MaTacGia.Text.Trim();
                cmd.Parameters.Add("@NXB", SqlDbType.NVarChar).Value = txt_DauSach_MaNXB.Text.Trim();
                cmd.Parameters.Add("@TheLoai", SqlDbType.NVarChar).Value = txt_DauSach_MaTheLoai.Text.Trim();
                cmd.Parameters.Add("@DonGia", SqlDbType.NVarChar).Value = txt_DauSach_DonGia.Text.Trim();
                cmd.Parameters.Add("@SoLuong", SqlDbType.NVarChar).Value = txt_DauSach_SoLuong.Text.Trim();
                DialogResult result = MessageBox.Show("Xác nhận thêm?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Thêm thành công");
                        LoadSach();
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
        public void SuaSach()
        {
            try
            {
                string maSach = txt_DauSach_MaSach.Text.Trim();
                string tenSach = txt_DauSach_TenSach.Text.Trim();
                string maTacGia = txt_DauSach_MaTacGia.Text.Trim();
                string maNXB = txt_DauSach_MaNXB.Text.Trim();
                string maTheLoai = txt_DauSach_MaTheLoai.Text.Trim();
                string gia = txt_DauSach_DonGia.Text.Trim();
                string soLuong = txt_DauSach_SoLuong.Text.Trim();
                if (string.IsNullOrEmpty(maSach) || string.IsNullOrEmpty(tenSach) || string.IsNullOrEmpty(maTacGia) ||
                    string.IsNullOrEmpty(maNXB) || string.IsNullOrEmpty(maTheLoai))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_SuaSach", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaSach", SqlDbType.NVarChar).Value = txt_DauSach_MaSach.Text.Trim();
                cmd.Parameters.Add("@TenSach", SqlDbType.NVarChar).Value = txt_DauSach_TenSach.Text.Trim();
                cmd.Parameters.Add("@MaTacGia", SqlDbType.NVarChar).Value = txt_DauSach_MaTacGia.Text.Trim();
                cmd.Parameters.Add("@NXB", SqlDbType.NVarChar).Value = txt_DauSach_MaNXB.Text.Trim();
                cmd.Parameters.Add("@TheLoai", SqlDbType.NVarChar).Value = txt_DauSach_MaTheLoai.Text.Trim();
                cmd.Parameters.Add("@DonGia", SqlDbType.NVarChar).Value = txt_DauSach_DonGia.Text.Trim();
                cmd.Parameters.Add("@SoLuong", SqlDbType.NVarChar).Value = txt_DauSach_SoLuong.Text.Trim();
                DialogResult result = MessageBox.Show("Xác nhận sửa?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Sửa thành công");
                        LoadSach();
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
        public void XoaSach()
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_XoaSach", sqlConnect.con);
                cmd.Parameters.Add("@MaSach", SqlDbType.NVarChar).Value = txt_DauSach_MaSach.Text.Trim();
                cmd.CommandType = CommandType.StoredProcedure;
                DialogResult result = MessageBox.Show("Xác nhận xóa", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Xóa thành công");
                        LoadSach();
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
        public void TimKiemSach()
        {
            string tuKhoa = txt_DauSach_TimKiem.Text.Trim();
            if (string.IsNullOrEmpty(tuKhoa))
            {
                MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (rbt_DauSach_TenSach.Checked)
            {
                string query = "SELECT * FROM func_TimSachTheoTenSach(@TenSach)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TenSach", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_Sach.DataSource = dt;
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
            else if (rbt_DauSach_TenTacGia.Checked)
            {
                string query = "SELECT * FROM func_TimSachTheoTenTacGia(@TenTacGia)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TenTacGia", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_Sach.DataSource = dt;
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
            else if (rbt_DauSach_TheLoai.Checked)
            {
                string query = "SELECT * FROM func_TimSachTenTheLoai(@TenTheLoai)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@TenTheLoai", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_Sach.DataSource = dt;
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
                MessageBox.Show("Không tìm thấy nhân viên phù hợp!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void btn_XemSach_Click(object sender, EventArgs e)
        {
            XemSach();
        }
        private void btn_ThemSach_Click(object sender, EventArgs e)
        {
            ThemSach();
        }

        private void btn_ChinhSuaSach_Click(object sender, EventArgs e)
        {
            SuaSach();
        }

        private void btn_XoaSach_Click(object sender, EventArgs e)
        {
            XoaSach();
        }
        private void btn_TimKiemSach_Click(object sender, EventArgs e)
        {
            TimKiemSach();
        }
        private void dgv_Sach_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_DauSach_MaSach.Text = dgv_Sach.CurrentRow.Cells["Col_MaSach"].Value.ToString();
            txt_DauSach_TenSach.Text = dgv_Sach.CurrentRow.Cells["Col_TenSach"].Value.ToString();
            txt_DauSach_MaTacGia.Text = dgv_Sach.CurrentRow.Cells["Col_MaTG"].Value.ToString();
            txt_DauSach_MaNXB.Text = dgv_Sach.CurrentRow.Cells["Col_MaNXB"].Value.ToString();
            txt_DauSach_MaTheLoai.Text = dgv_Sach.CurrentRow.Cells["Col_MaTL"].Value.ToString();
            decimal giaValue = Convert.ToDecimal(dgv_Sach.CurrentRow.Cells["Col_Gia"].Value);
            string giaFormatted = giaValue.ToString("0.##");
            txt_DauSach_DonGia.Text = giaFormatted;
            txt_DauSach_SoLuong.Text = dgv_Sach.CurrentRow.Cells["Col_SoLuong"].Value.ToString();
        }
        private void rbt_DauSach_TenSach_CheckedChanged(object sender, EventArgs e)
        {
            lbl_DauSach_TimKiem.Text = "Nhập Tên Sách:";
        }

        private void rbt_DauSach_TenTacGia_CheckedChanged(object sender, EventArgs e)
        {
            lbl_DauSach_TimKiem.Text = "Nhập Tên Tác Giả:";
        }

        private void rbt_DauSach_TheLoai_CheckedChanged(object sender, EventArgs e)
        {
            lbl_DauSach_TimKiem.Text = "Nhập Tên Thể Loại:";
        }

        private void btn_ResetSach_Click(object sender, EventArgs e)
        {
            txt_DauSach_MaSach.ResetText();
            txt_DauSach_TenSach.ResetText();
            txt_DauSach_MaTacGia.ResetText();
            txt_DauSach_MaNXB.ResetText();
            txt_DauSach_MaTheLoai.ResetText();
            txt_DauSach_DonGia.ResetText();
            txt_DauSach_SoLuong.ResetText();
            txt_DauSach_TimKiem.ResetText();
            rbt_DauSach_TenSach.Checked = false;
            rbt_DauSach_TenTacGia.Checked = false;
            rbt_DauSach_TheLoai.Checked = false;
            lbl_DauSach_TimKiem.Text = "Nhập Từ Khóa:";
        }
    }
}
