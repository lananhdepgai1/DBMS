namespace Nhom8_QLTV
{
    partial class QuanLyThongKe
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(QuanLyThongKe));
            this.tp_ThongKeDocGia = new System.Windows.Forms.TabPage();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.rbt_ThongKeDocGia_TraTreHan = new System.Windows.Forms.RadioButton();
            this.rbt_ThongKeDocGia_Hu = new System.Windows.Forms.RadioButton();
            this.rbt_ThongKeDocGia_Mat = new System.Windows.Forms.RadioButton();
            this.dgv_ThongKeDocGia = new System.Windows.Forms.DataGridView();
            this.tp_ThongKeSach = new System.Windows.Forms.TabPage();
            this.dgv_ThongKeSach = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rbt_ThongKeSach_SachMuonNhieuNhat = new System.Windows.Forms.RadioButton();
            this.rbt_ThongKeSach_TacGia = new System.Windows.Forms.RadioButton();
            this.rbt_ThongKeSach_TheLoai = new System.Windows.Forms.RadioButton();
            this.tbc_QuanLyThongKe = new System.Windows.Forms.TabControl();
            this.tp_ThongKeDocGia.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ThongKeDocGia)).BeginInit();
            this.tp_ThongKeSach.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ThongKeSach)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.tbc_QuanLyThongKe.SuspendLayout();
            this.SuspendLayout();
            // 
            // tp_ThongKeDocGia
            // 
            this.tp_ThongKeDocGia.Controls.Add(this.dgv_ThongKeDocGia);
            this.tp_ThongKeDocGia.Controls.Add(this.groupBox4);
            resources.ApplyResources(this.tp_ThongKeDocGia, "tp_ThongKeDocGia");
            this.tp_ThongKeDocGia.Name = "tp_ThongKeDocGia";
            this.tp_ThongKeDocGia.UseVisualStyleBackColor = true;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.rbt_ThongKeDocGia_Mat);
            this.groupBox4.Controls.Add(this.rbt_ThongKeDocGia_Hu);
            this.groupBox4.Controls.Add(this.rbt_ThongKeDocGia_TraTreHan);
            resources.ApplyResources(this.groupBox4, "groupBox4");
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.TabStop = false;
            // 
            // rbt_ThongKeDocGia_TraTreHan
            // 
            resources.ApplyResources(this.rbt_ThongKeDocGia_TraTreHan, "rbt_ThongKeDocGia_TraTreHan");
            this.rbt_ThongKeDocGia_TraTreHan.Name = "rbt_ThongKeDocGia_TraTreHan";
            this.rbt_ThongKeDocGia_TraTreHan.UseVisualStyleBackColor = true;
            this.rbt_ThongKeDocGia_TraTreHan.CheckedChanged += new System.EventHandler(this.rbt_ThongKeDocGia_TraTreHan_CheckedChanged_1);
            // 
            // rbt_ThongKeDocGia_Hu
            // 
            resources.ApplyResources(this.rbt_ThongKeDocGia_Hu, "rbt_ThongKeDocGia_Hu");
            this.rbt_ThongKeDocGia_Hu.Name = "rbt_ThongKeDocGia_Hu";
            this.rbt_ThongKeDocGia_Hu.UseVisualStyleBackColor = true;
            this.rbt_ThongKeDocGia_Hu.CheckedChanged += new System.EventHandler(this.rbt_ThongKeDocGia_Hu_CheckedChanged_1);
            // 
            // rbt_ThongKeDocGia_Mat
            // 
            resources.ApplyResources(this.rbt_ThongKeDocGia_Mat, "rbt_ThongKeDocGia_Mat");
            this.rbt_ThongKeDocGia_Mat.Name = "rbt_ThongKeDocGia_Mat";
            this.rbt_ThongKeDocGia_Mat.UseVisualStyleBackColor = true;
            this.rbt_ThongKeDocGia_Mat.CheckedChanged += new System.EventHandler(this.rbt_ThongKeDocGia_Mat_CheckedChanged);
            // 
            // dgv_ThongKeDocGia
            // 
            this.dgv_ThongKeDocGia.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            resources.ApplyResources(this.dgv_ThongKeDocGia, "dgv_ThongKeDocGia");
            this.dgv_ThongKeDocGia.Name = "dgv_ThongKeDocGia";
            this.dgv_ThongKeDocGia.RowTemplate.Height = 24;
            // 
            // tp_ThongKeSach
            // 
            this.tp_ThongKeSach.Controls.Add(this.groupBox1);
            this.tp_ThongKeSach.Controls.Add(this.dgv_ThongKeSach);
            resources.ApplyResources(this.tp_ThongKeSach, "tp_ThongKeSach");
            this.tp_ThongKeSach.Name = "tp_ThongKeSach";
            this.tp_ThongKeSach.UseVisualStyleBackColor = true;
            // 
            // dgv_ThongKeSach
            // 
            this.dgv_ThongKeSach.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv_ThongKeSach.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            resources.ApplyResources(this.dgv_ThongKeSach, "dgv_ThongKeSach");
            this.dgv_ThongKeSach.Name = "dgv_ThongKeSach";
            this.dgv_ThongKeSach.RowTemplate.Height = 24;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbt_ThongKeSach_TheLoai);
            this.groupBox1.Controls.Add(this.rbt_ThongKeSach_TacGia);
            this.groupBox1.Controls.Add(this.rbt_ThongKeSach_SachMuonNhieuNhat);
            resources.ApplyResources(this.groupBox1, "groupBox1");
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.TabStop = false;
            // 
            // rbt_ThongKeSach_SachMuonNhieuNhat
            // 
            resources.ApplyResources(this.rbt_ThongKeSach_SachMuonNhieuNhat, "rbt_ThongKeSach_SachMuonNhieuNhat");
            this.rbt_ThongKeSach_SachMuonNhieuNhat.Name = "rbt_ThongKeSach_SachMuonNhieuNhat";
            this.rbt_ThongKeSach_SachMuonNhieuNhat.UseVisualStyleBackColor = true;
            this.rbt_ThongKeSach_SachMuonNhieuNhat.CheckedChanged += new System.EventHandler(this.rbt_ThongKeSach_SachMuonNhieuNhat_CheckedChanged_1);
            // 
            // rbt_ThongKeSach_TacGia
            // 
            resources.ApplyResources(this.rbt_ThongKeSach_TacGia, "rbt_ThongKeSach_TacGia");
            this.rbt_ThongKeSach_TacGia.Name = "rbt_ThongKeSach_TacGia";
            this.rbt_ThongKeSach_TacGia.UseVisualStyleBackColor = true;
            this.rbt_ThongKeSach_TacGia.CheckedChanged += new System.EventHandler(this.rbt_ThongKeSach_TacGia_CheckedChanged_1);
            // 
            // rbt_ThongKeSach_TheLoai
            // 
            resources.ApplyResources(this.rbt_ThongKeSach_TheLoai, "rbt_ThongKeSach_TheLoai");
            this.rbt_ThongKeSach_TheLoai.Name = "rbt_ThongKeSach_TheLoai";
            this.rbt_ThongKeSach_TheLoai.UseVisualStyleBackColor = true;
            this.rbt_ThongKeSach_TheLoai.CheckedChanged += new System.EventHandler(this.rbt_ThongKeSach_TheLoai_CheckedChanged_1);
            // 
            // tbc_QuanLyThongKe
            // 
            this.tbc_QuanLyThongKe.Controls.Add(this.tp_ThongKeSach);
            this.tbc_QuanLyThongKe.Controls.Add(this.tp_ThongKeDocGia);
            resources.ApplyResources(this.tbc_QuanLyThongKe, "tbc_QuanLyThongKe");
            this.tbc_QuanLyThongKe.Name = "tbc_QuanLyThongKe";
            this.tbc_QuanLyThongKe.SelectedIndex = 0;
            // 
            // QuanLyThongKe
            // 
            resources.ApplyResources(this, "$this");
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.tbc_QuanLyThongKe);
            this.ForeColor = System.Drawing.Color.Black;
            this.Name = "QuanLyThongKe";
            this.tp_ThongKeDocGia.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ThongKeDocGia)).EndInit();
            this.tp_ThongKeSach.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ThongKeSach)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.tbc_QuanLyThongKe.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabPage tp_ThongKeDocGia;
        private System.Windows.Forms.DataGridView dgv_ThongKeDocGia;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.RadioButton rbt_ThongKeDocGia_Mat;
        private System.Windows.Forms.RadioButton rbt_ThongKeDocGia_Hu;
        private System.Windows.Forms.RadioButton rbt_ThongKeDocGia_TraTreHan;
        private System.Windows.Forms.TabPage tp_ThongKeSach;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rbt_ThongKeSach_TheLoai;
        private System.Windows.Forms.RadioButton rbt_ThongKeSach_TacGia;
        private System.Windows.Forms.RadioButton rbt_ThongKeSach_SachMuonNhieuNhat;
        private System.Windows.Forms.DataGridView dgv_ThongKeSach;
        private System.Windows.Forms.TabControl tbc_QuanLyThongKe;
    }
}
