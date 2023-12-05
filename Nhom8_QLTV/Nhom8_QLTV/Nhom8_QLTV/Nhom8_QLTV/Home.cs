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
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        SQLConnect.SqlConnect sqlConnect = new SQLConnect.SqlConnect();
        DataTable dt = new DataTable();
        private SqlTransaction transaction;

        private void btn_QuanLySach_Click(object sender, EventArgs e)
        {
            QuanLySach quanLySach = new QuanLySach();
            pnl_show.Controls.Clear();
            pnl_show.Controls.Add(quanLySach);
        }

        private void btn_QuanLyDocGia_Click(object sender, EventArgs e)
        {
            QuanLyDocGia quanLyDocGia = new QuanLyDocGia();
            pnl_show.Controls.Clear();
            pnl_show.Controls.Add(quanLyDocGia);
        }

        private void btn_QuanLyPhieuMuonTra_Click(object sender, EventArgs e)
        {
            QuanLyMuonTra quanLyMuonTra = new QuanLyMuonTra();
            pnl_show.Controls.Clear();
            pnl_show.Controls.Add(quanLyMuonTra);
        }

        private void btn_QuanLyNhanVien_Click(object sender, EventArgs e)
        {
            QuanLyNhanVien quanLyNhanVien = new QuanLyNhanVien();
            pnl_show.Controls.Clear();
            pnl_show.Controls.Add(quanLyNhanVien);
        }

        private void btn_QuanLyThongKe_Click(object sender, EventArgs e)
        {
            QuanLyThongKe quanLyThongKe = new QuanLyThongKe();
            pnl_show.Controls.Clear();
            pnl_show.Controls.Add(quanLyThongKe);

        }

        private void btn_Thoat_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                Application.Exit();
            }
        }

        private void btn_TaiKhoan_Click(object sender, EventArgs e)
        {
            TaiKhoan taiKhoan = new TaiKhoan();
            pnl_show.Controls.Clear();
            pnl_show.Controls.Add(taiKhoan);
        }
    }
}
