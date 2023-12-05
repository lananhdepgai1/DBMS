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
    public partial class QuanLyMuonTra : UserControl
    {
        public QuanLyMuonTra()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();



        /*PHIẾU MƯỢN*/
        public void LoadPhieuMuon()
        {
            string sql = "SELECT * FROM view_ThongTinPhieuMuon";
            dgv_PhieuMuon.DataSource = sqlConnect.ExecuteQuery(sql);

        }
        public void XemPhieuMuon()
        {
            try
            {
                sqlConnect.OpenConnection();
                LoadPhieuMuon();
                sqlConnect.CloseConnection();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void ThemPhieuMuon()
        {
            try
            {
                string maPhieu = txt_PhieuMuon_MaPhieu.Text.Trim();
                string maDocGia = txt_PhieuMuon_MaDocGia.Text.Trim();
                string maMaNhanVien = txt_PhieuMuon_MaNhanVien.Text.Trim();
                
                if (string.IsNullOrEmpty(maPhieu) || string.IsNullOrEmpty(maDocGia) || string.IsNullOrEmpty(maMaNhanVien))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThemPhieuMuon", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaPhieu", SqlDbType.NVarChar).Value = txt_PhieuMuon_MaPhieu.Text.Trim();
                cmd.Parameters.Add("@MaDocGia", SqlDbType.NVarChar).Value = txt_PhieuMuon_MaDocGia.Text.Trim();
                cmd.Parameters.Add("@MaNhanVien", SqlDbType.NVarChar).Value = txt_PhieuMuon_MaNhanVien.Text.Trim();
                cmd.Parameters.Add("@NgayMuon", SqlDbType.Date).Value = dtp_PhieuMuon_NgayMuon.Value;
                dtp_PhieuMuon_NgayHetHan.Value = dtp_PhieuMuon_NgayMuon.Value.AddDays(30);
                DialogResult result = MessageBox.Show("Xác nhận thêm?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Thêm thành công");
                        LoadPhieuMuon();
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
        public void SuaPhieuMuon()
        {
            try
            {
                string maPhieu = txt_PhieuMuon_MaPhieu.Text.Trim();
                string maDocGia = txt_PhieuMuon_MaDocGia.Text.Trim();
                string maMaNhanVien = txt_PhieuMuon_MaNhanVien.Text.Trim();
              

                if (string.IsNullOrEmpty(maPhieu) || string.IsNullOrEmpty(maDocGia) || string.IsNullOrEmpty(maMaNhanVien) )
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_SuaPhieuMuon", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaPhieu", SqlDbType.NVarChar).Value = txt_PhieuMuon_MaPhieu.Text.Trim();
                cmd.Parameters.Add("@MaDocGia", SqlDbType.NVarChar).Value = txt_PhieuMuon_MaDocGia.Text.Trim();
                cmd.Parameters.Add("@MaNhanVien", SqlDbType.NVarChar).Value = txt_PhieuMuon_MaNhanVien.Text.Trim();
                cmd.Parameters.Add("@NgayMuon", SqlDbType.Date).Value = dtp_PhieuMuon_NgayMuon.Value;
                dtp_PhieuMuon_NgayHetHan.Value = dtp_PhieuMuon_NgayMuon.Value.AddDays(30);
                DialogResult result = MessageBox.Show("Xác nhận thêm?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Sửa thành công");
                        LoadPhieuMuon();
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
        public void TimKiemPhieuMuon()
        {
            if (rbt_PhieuMuon_NgayMuon.Checked)
            {
                DateTime date = dtp_PhieuMuon_TimKiem.Value;
                string query = "SELECT * FROM func_TimPhieuMuonTheoNgayMuon(@NgayMuon)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@NgayMuon", date));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_PhieuMuon.DataSource = dt;
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
                string tuKhoa = txt_PhieuMuon_TimKiem.Text.Trim();
                if (string.IsNullOrEmpty(tuKhoa))
                {
                    MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;

                }
                if (rbt_PhieuMuon_MaPhieu.Checked)
                {
                    string query = "SELECT * FROM func_TimPhieuMuonTheoMaPhieu(@MaPhieu)";
                    SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                    cmd.Parameters.Add(new SqlParameter("@MaPhieu", tuKhoa));
                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            dgv_PhieuMuon.DataSource = dt;
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
                else if (rbt_PhieuMuon_TenDocGia.Checked)
                {
                    string query = "SELECT * FROM func_TimPhieuMuonTheoTenDocGia(@TenDocGia)";
                    SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                    cmd.Parameters.Add(new SqlParameter("@TenDocGia", tuKhoa));
                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            dgv_PhieuMuon.DataSource = dt;
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
                else if (rbt_PhieuMuon_TenNhanVien.Checked)
                {
                    string query = "SELECT * FROM func_TimPhieuMuonTheoTenNhanVien(@TenNhanVien)";
                    SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                    cmd.Parameters.Add(new SqlParameter("@TenNhanVien", tuKhoa));
                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            dgv_PhieuMuon.DataSource = dt;
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
        }
        private void btn_XemPhieuMuon_Click(object sender, EventArgs e)
        {
            XemPhieuMuon();
        }

        private void btn_ThemPhieuMuon_Click(object sender, EventArgs e)
        {
            ThemPhieuMuon();
        }

        private void btn_ChinhSuaPhieuMuon_Click(object sender, EventArgs e)
        {
            SuaPhieuMuon();
        }

        private void btn_TimKiemPhieuMuon_Click(object sender, EventArgs e)
        {
            TimKiemPhieuMuon();
        }

        private void btn_ResetPhieuMuon_Click(object sender, EventArgs e)
        {
            txt_PhieuMuon_MaPhieu.ResetText();
            txt_PhieuMuon_MaDocGia.ResetText();
            txt_PhieuMuon_MaNhanVien.ResetText();
            dtp_PhieuMuon_NgayMuon.Value = DateTime.Now;
            dtp_PhieuMuon_NgayHetHan.Value = dtp_PhieuMuon_NgayMuon.Value.AddDays(30);
            dtp_PhieuMuon_TimKiem.Value = DateTime.Now;
            rbt_PhieuMuon_MaPhieu.Checked = false;
            rbt_PhieuMuon_TenDocGia.Checked = false;
            rbt_PhieuMuon_TenNhanVien.Checked = false;
            rbt_PhieuMuon_NgayMuon.Checked = false;
            lbl_PhieuMuon_TimKiem.Text = "Nhập Từ Khóa:";
        }

        private void dgv_PhieuMuon_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_PhieuMuon_MaPhieu.Text = dgv_PhieuMuon.CurrentRow.Cells["col_MaPhieu"].Value.ToString();
            txt_PhieuMuon_MaDocGia.Text = dgv_PhieuMuon.CurrentRow.Cells["col_MaDocGia"].Value.ToString();
            txt_PhieuMuon_MaNhanVien.Text = dgv_PhieuMuon.CurrentRow.Cells["col_MaNhanVien"].Value.ToString();
            dtp_PhieuMuon_NgayMuon.Text = dgv_PhieuMuon.CurrentRow.Cells["col_NgayMuon"].Value.ToString();
            dtp_PhieuMuon_NgayHetHan.Text = dgv_PhieuMuon.CurrentRow.Cells["col_NgayHetHan"].Value.ToString();
        }

        private void dtp_PhieuMuon_NgayMuon_ValueChanged(object sender, EventArgs e)
        {
            dtp_PhieuMuon_NgayHetHan.Value = dtp_PhieuMuon_NgayMuon.Value.AddDays(30);
        }

        private void rbt_PhieuMuon_MaPhieu_CheckedChanged(object sender, EventArgs e)
        {
            dtp_PhieuMuon_TimKiem.Visible = false;
            lbl_PhieuMuon_TimKiem.Text = "Nhập Mã Phiếu:";
        }

        private void rbt_PhieuMuon_TenDocGia_CheckedChanged(object sender, EventArgs e)
        {
            dtp_PhieuMuon_TimKiem.Visible = false;
            lbl_PhieuMuon_TimKiem.Text = "Nhập Tên Độc Giả:";
        }

        private void rbt_PhieuMuon_TenNhanVien_CheckedChanged(object sender, EventArgs e)
        {
            dtp_PhieuMuon_TimKiem.Visible = false;
            lbl_PhieuMuon_TimKiem.Text = "Nhập Tên Nhân Viên:";
        }

        private void rbt_PhieuMuon_NgayMuon_CheckedChanged(object sender, EventArgs e)
        {
            dtp_PhieuMuon_TimKiem.Visible = true;
            lbl_PhieuMuon_TimKiem.Text = "Nhập Ngày Mượn:";
        }


        /*PHIẾU TRẢ*/
        public void LoadPhieuTra()
        {
            string sql = "SELECT * FROM CT_MuonTra";
            dgv_PhieuTra.DataSource = sqlConnect.ExecuteQuery(sql);

        }
        public void XemPhieuTra()
        {
            try
            {
                sqlConnect.OpenConnection();
                LoadPhieuTra();
                sqlConnect.CloseConnection();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void ThemPhieuTra()
        {
            try
            {
                string maPhieu = txt_PhieuTra_MaPhieu.Text.Trim();
                string maCuon = txt_PhieuTra_MaCuon.Text.Trim();
                DateTime ngayTra = dtp_PhieuTra_NgayTra.Value;
                DateTime ngayHetHan = dtp_PhieuMuon_NgayHetHan.Value;
                string tinhTrang=cmb_PhieuTra_TinhTrang.Text.Trim();
                string ghiChu=txt_PhieuTra_GhiChu.Text.Trim();
                string thanhToan=txt_PhieuTra_ThanhToan.Text.Trim();
                int soNgayQuaHan = (int)(ngayTra - ngayHetHan).TotalDays;

                if (string.IsNullOrEmpty(maPhieu) || string.IsNullOrEmpty(maCuon) || string.IsNullOrEmpty(tinhTrang)|| string.IsNullOrEmpty(ghiChu) || string.IsNullOrEmpty(thanhToan))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThemPhieuTra", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaPhieu", SqlDbType.NVarChar).Value = txt_PhieuTra_MaPhieu.Text.Trim();
                cmd.Parameters.Add("@MaCuon", SqlDbType.NVarChar).Value = txt_PhieuTra_MaCuon.Text.Trim();
                cmd.Parameters.Add("@NgayTra", SqlDbType.Date).Value = dtp_PhieuTra_NgayTra.Value;
                cmd.Parameters.Add("@TinhTrang", SqlDbType.NVarChar).Value = cmb_PhieuTra_TinhTrang.Text.Trim();
                cmd.Parameters.Add("@GhiChu", SqlDbType.NVarChar).Value=txt_PhieuTra_GhiChu.Text.Trim();    
                cmd.Parameters.Add("@ThanhToan",SqlDbType.NVarChar).Value=txt_PhieuTra_ThanhToan.Text.Trim();
                txt_PhieuTra_SoNgayQuaHan.Text = soNgayQuaHan.ToString();
                DialogResult result = MessageBox.Show("Xác nhận thêm?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Thêm thành công");
                        LoadPhieuTra();
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
        public void SuaPhieuTra()
        {
            try
            {
                string maPhieu = txt_PhieuTra_MaPhieu.Text.Trim();
                string maCuon = txt_PhieuTra_MaCuon.Text.Trim();
                DateTime ngayTra = dtp_PhieuTra_NgayTra.Value;
                DateTime ngayHetHan = dtp_PhieuMuon_NgayHetHan.Value;
                string tinhTrang = cmb_PhieuTra_TinhTrang.Text.Trim();
                string ghiChu = txt_PhieuTra_GhiChu.Text.Trim();
                string thanhToan = txt_PhieuTra_ThanhToan.Text.Trim();
                int soNgayQuaHan = (int)(ngayTra - ngayHetHan).TotalDays;
                if (string.IsNullOrEmpty(maPhieu) || string.IsNullOrEmpty(maCuon) || string.IsNullOrEmpty(tinhTrang) || string.IsNullOrEmpty(ghiChu) || string.IsNullOrEmpty(thanhToan))
                {
                    MessageBox.Show("Vui lòng điền đầy đủ thông tin.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return;
                }
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_SuaPhieuTra", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaPhieu", SqlDbType.NVarChar).Value = txt_PhieuTra_MaPhieu.Text.Trim();
                cmd.Parameters.Add("@MaCuon", SqlDbType.NVarChar).Value = txt_PhieuTra_MaCuon.Text.Trim();
                cmd.Parameters.Add("@NgayTra", SqlDbType.Date).Value = dtp_PhieuTra_NgayTra.Value;
                cmd.Parameters.Add("@TinhTrang", SqlDbType.NVarChar).Value = cmb_PhieuTra_TinhTrang.Text.Trim();
                cmd.Parameters.Add("@GhiChu", SqlDbType.NVarChar).Value = txt_PhieuTra_GhiChu.Text.Trim();
                cmd.Parameters.Add("@ThanhToan", SqlDbType.NVarChar).Value = txt_PhieuTra_ThanhToan.Text.Trim();
                txt_PhieuTra_SoNgayQuaHan.Text = soNgayQuaHan.ToString();
                DialogResult result = MessageBox.Show("Xác nhận sửa?", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Sửa thành công");
                        LoadPhieuMuon();
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

        public void XoaPhieuTra()
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_XoaPhieuTra", sqlConnect.con);
                cmd.Parameters.Add("@MaCuon", SqlDbType.NVarChar).Value = txt_PhieuTra_MaCuon.Text.Trim();
                cmd.CommandType = CommandType.StoredProcedure;
                DialogResult result = MessageBox.Show("Xác nhận xóa", "Xác nhận", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (result == DialogResult.Yes)
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Xóa thành công");
                        LoadPhieuTra();
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
        public void TimKiemPhieuTra()
        {
            string tuKhoa = txt_PhieuTra_TimKiem.Text.Trim();
            if (string.IsNullOrEmpty(tuKhoa))
            {
                MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (rbt_PhieuTra_MaCuon.Checked)
            {
                string query = "SELECT * FROM func_TimPhieuTraTheoMaCuon(@MaCuon)";
                SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                cmd.Parameters.Add(new SqlParameter("@MaCuon", tuKhoa));
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        dgv_PhieuTra.DataSource = dt;
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

                if (rbt_PhieuTra_MaPhieu.Checked)
                {
                    string query = "SELECT * FROM func_TimPhieuTraTheoMaPhieu(@MaPhieu)";
                    SqlCommand cmd = new SqlCommand(query, sqlConnect.con);
                    cmd.Parameters.Add(new SqlParameter("@MaPhieu", tuKhoa));
                    try
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            dgv_PhieuTra.DataSource = dt;
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
               
            }
        }
        private void dgv_PhieuTra_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_PhieuTra_MaCuon.Text = dgv_PhieuTra.CurrentRow.Cells["col_MaCuon"].Value.ToString();
            txt_PhieuTra_MaPhieu.Text = dgv_PhieuTra.CurrentRow.Cells["col_MaPhieuTra"].Value.ToString();
            txt_PhieuTra_SoNgayQuaHan.Text = dgv_PhieuTra.CurrentRow.Cells["col_SoNgayQuaHan"].Value.ToString();
            dtp_PhieuTra_NgayTra.Text = dgv_PhieuTra.CurrentRow.Cells["col_NgayTra"].Value.ToString();
            txt_PhieuTra_ThanhToan.Text = dgv_PhieuTra.CurrentRow.Cells["col_ThanhToan"].Value.ToString();
            txt_PhieuTra_TienPhat.Text = dgv_PhieuTra.CurrentRow.Cells["col_TienPhat"].Value.ToString();
            txt_PhieuTra_GhiChu.Text = dgv_PhieuTra.CurrentRow.Cells["col_GhiChu"].Value.ToString();
            cmb_PhieuTra_TinhTrang.Text = dgv_PhieuTra.CurrentRow.Cells["col_TinhTrang"].Value.ToString();
        }
        private void btn_XemPhieuTra_Click(object sender, EventArgs e)
        {
            XemPhieuTra();
        }
        private void btn_ThemPhieuTra_Click(object sender, EventArgs e)
        {
            ThemPhieuTra();
        }
        private void btn_ChinhSuaPhieuTra_Click(object sender, EventArgs e)
        {
            SuaPhieuTra();
        }
        private void btn_TimKiemPhieuTra_Click(object sender, EventArgs e)
        {
            TimKiemPhieuTra();
        }
        private void btn_XoaPhieuTra_Click(object sender, EventArgs e)
        {
            XoaPhieuTra();
        }
        private void rbt_PhieuTra_MaPhieu_CheckedChanged(object sender, EventArgs e)
        {
            lbl_PhieuTra_TimKiem.Text = "Nhập Mã Phiếu:";
        }
        private void rbt_PhieuTra_MaCuon_CheckedChanged(object sender, EventArgs e)
        {
            lbl_PhieuTra_TimKiem.Text = "Nhập Mã Cuốn:";
        }
        private void btn_ResetPhieuTra_Click(object sender, EventArgs e)
        {
            txt_PhieuTra_MaCuon.ResetText();
            txt_PhieuTra_MaPhieu.ResetText();
            txt_PhieuTra_SoNgayQuaHan.ResetText();
            dtp_PhieuTra_NgayTra.Value = DateTime.Now;
            txt_PhieuTra_ThanhToan.ResetText();
            txt_PhieuTra_TienPhat.ResetText();
            txt_PhieuTra_GhiChu.ResetText();
            cmb_PhieuTra_TinhTrang.ResetText();
            txt_PhieuTra_TimKiem.ResetText();
            rbt_PhieuTra_MaCuon.Checked = false;
            rbt_PhieuTra_MaPhieu.Checked = false;
            lbl_PhieuTra_TimKiem.Text = "Nhập Từ Khóa:";
        }
    }
}
