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
    public partial class QuanLyThongKe : UserControl
    {
        public QuanLyThongKe()
        {
            InitializeComponent();
        }
        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();

        private void rbt_ThongKeDocGia_TraTreHan_CheckedChanged_1(object sender, EventArgs e)
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("SELECT * FROM func_ThongKeDocGiaTraSachTreHan()", sqlConnect.con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv_ThongKeDocGia.DataSource = dt;
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void rbt_ThongKeDocGia_Hu_CheckedChanged_1(object sender, EventArgs e)
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("SELECT * FROM func_ThongKeDocGiaLamHuSach()", sqlConnect.con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv_ThongKeDocGia.DataSource = dt;
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void rbt_ThongKeDocGia_Mat_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("SELECT * FROM func_ThongKeDocGiaLamMatSach()", sqlConnect.con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv_ThongKeDocGia.DataSource = dt;
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void rbt_ThongKeSach_SachMuonNhieuNhat_CheckedChanged_1(object sender, EventArgs e)
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThongKeSachDuocMuonNhieuNhat", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv_ThongKeSach.DataSource = dt;
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void rbt_ThongKeSach_TheLoai_CheckedChanged_1(object sender, EventArgs e)
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThongKeSachTheoTheLoai", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv_ThongKeSach.DataSource = dt;
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void rbt_ThongKeSach_TacGia_CheckedChanged_1(object sender, EventArgs e)
        {
            try
            {
                sqlConnect.OpenConnection();
                SqlCommand cmd = new SqlCommand("proc_ThongKeSachTheoTacGia", sqlConnect.con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dgv_ThongKeSach.DataSource = dt;
                sqlConnect.CloseConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
