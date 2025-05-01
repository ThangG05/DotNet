using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;

namespace Motobike.Timkiem
{
    public partial class timkiemhanghoa : Form
    {
        public timkiemhanghoa()
        {
            InitializeComponent();
        }

        private void timkiemhanghoa_Load(object sender, EventArgs e)
        {
            NapHangXe();
            NapMaDongCo();
            NapMaHang();
            NapMaLoai();
            NapMaMau();
            NapMaNuocXS();
            NapMaPhanh();
            NapMaTinhTrang();
            NapTenHang();

        }
        public void NapTenHang()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillTenhang(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbotenhang.Items.Add(reader["TenHang"].ToString());
            }
            reader.Close();
        }
        public void NapMaHang()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaHang(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomah.Items.Add(reader["MaHang"].ToString());
            }
            reader.Close();
        }
        public void NapMaMau()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMamau(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomamau.Items.Add(reader["MaMau"].ToString());
            }
            reader.Close();
        }
        public void NapMaPhanh()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaPhanh(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomaphanh.Items.Add(reader["MaPhanh"].ToString());
            }
            reader.Close();
        }
        public void NapMaLoai()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaLoai(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomaloai.Items.Add(reader["MaLoai"].ToString());
            }
            reader.Close();
        }
        public void NapMaDongCo()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaDongCo(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomadc.Items.Add(reader["MaDongCo"].ToString());
            }
            reader.Close();

        }
        public void NapHangXe()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaHangXe(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomahx.Items.Add(reader["MaHangSX"].ToString());
            }
            reader.Close();
        }
        public void NapMaNuocXS()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaNuocSx(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomansx.Items.Add(reader["MaNuocSX"].ToString());
            }
            reader.Close();
        }
        public void NapMaTinhTrang()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaTinhTrang(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomatt.Items.Add(reader["MaTinhTrang"].ToString());
            }
            reader.Close();
        }
        public void hienthi(string tencot,string value)
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select *from DMHang
                               where "+tencot+"='"+value+"'";
            cmd.Connection = conn;
            SqlDataReader reader = cmd.ExecuteReader();
            List<Thongtinhang> ds = new List<Thongtinhang>();
            Thongtinhang hang;
            while (reader.Read())
            {
                string mah=reader.GetString(0);
                string tenh=reader.GetString(1);
                string mal=reader.GetString(2);
                string manuocsx=reader.GetString(3);
                string mahsx=reader.GetString(4);
                string maphanh=reader.GetString(5);
                string mamau=reader.GetString(6);
                string madc=reader.GetString(7);
                string matt=reader.GetString(8);
                string dungtich=reader.GetString(9);
                string anh=reader.GetString(10);
                int slg=reader.GetInt32(11);
                int dongianhap=reader.GetInt32(12);
                int dongiaban=reader.GetInt32(13);
               string thoigianbh=reader.GetString(14);
                hang = new Thongtinhang() {MaHang=mah,TenHang=tenh,MaLoai=mal,MaNuocSX=manuocsx,MaHangSX=mahsx,MaPhanh=maphanh
                ,MaMau=mamau,MaDongCo=madc,MaTinhTrang=matt,DungTichKhoang=dungtich,Anh=anh,SoLuong=slg,DonGiaNhap=dongianhap,DonGiaBan=dongiaban,ThoiGianBaoHanh=thoigianbh};
                ds.Add(hang);
            }
            dgvhanghoa.DataSource = ds;
            reader.Close();  
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            if (cbomah.Text != "")
            {
                hienthi("MaHang",cbomah.Text);
                return;
            }
            if (cbotenhang.Text != "")
            {
                hienthi("TenHang", cbotenhang.Text);
                return;
            }
            if (cbomatt.Text != "")
            {
                hienthi("MaTinhTrang", cbomatt.Text);
                return;
            }
            if (cbomaphanh.Text != "")
            {
                hienthi("MaPhanh", cbomaphanh.Text);
                return;
            }
            if (cbomansx.Text != "")
            {
                hienthi("MaNuocSX", cbomansx.Text);
                return;
            }
            if (cbomaloai.Text != "")
            {
                hienthi("MaLoai", cbomaloai.Text);
                return;
            }
            if (cbomamau.Text != "")
            {
                hienthi("MaMau", cbomamau.Text);
                return;
            }
            if (cbomahx.Text != "")
            {
                hienthi("MaHangSX", cbomahx.Text);
                return;
            }
            if (cbomadc.Text != "")
            {
                hienthi("MaDongCo", cbomadc.Text);
                return;
            }
        }

        private void btntimlai_Click(object sender, EventArgs e)
        {
            cbomah.SelectedIndex = -1;
            cbotenhang.SelectedIndex = -1;
            cbomatt.SelectedIndex = -1;
            cbomaphanh.SelectedIndex = -1;
            cbomansx.SelectedIndex = -1;
            cbomaloai.SelectedIndex = -1;
            cbomamau.SelectedIndex = -1;
            cbomahx.SelectedIndex = -1;
            cbomadc.SelectedIndex = -1;
        }
    }
}
