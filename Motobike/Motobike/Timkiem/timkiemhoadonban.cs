using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Motobike.Timkiem
{
    public partial class timkiemhoadonban : Form
    {
        public timkiemhoadonban()
        {
            InitializeComponent();
        }

        private void timkiemhoadonban_Load(object sender, EventArgs e)
        {
            NapMaHD();
            NapMaKh();
            NapManv();
        }
        public void NapMaHD()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaHD2(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cboshd.Items.Add(reader["SoDDH"].ToString());
            }
            reader.Close();
        }
        public void NapManv()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillManv(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomanv.Items.Add(reader["MaNV"].ToString());
            }
            reader.Close();
        }
        public void NapMaKh()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaKH(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomakh.Items.Add(reader["MaKH"].ToString());
            }
            reader.Close();
        }
        public void hienthiSoDDH()
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select a.SoDDH, a.MaNV, a.NgayMua, a.MaKH, 
                              b.MaHang, b.SoLuong,b.GiaBan,b.ThanhTien,a.Thue, b.GiamGia, a.TongTien
                              from DonDatHang a
                              join CTDonDatHang b on a.SoDDH = b.SoDDH
                              where a.SoDDH='"+cboshd.Text+"'";
            cmd.Connection = conn;
            List<Thongtindonban> ds= new List<Thongtindonban>();
            Thongtindonban donban;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int sohd=reader.GetInt32(0);
                string manv= reader.GetString(1);
                DateTime ngaymua= reader.GetDateTime(2);
                string makh= reader.GetString(3);
                string mahang= reader.GetString(4);
                int soluong=reader.GetInt32(5);
                int giaban=reader.GetInt32(6);
                int thanhtien=reader.GetInt32(7);
                int thue=reader.GetInt32(8);
                int giamgia=reader.GetInt32(9);
                int tongtien=reader.GetInt32(10);
               
                donban = new Thongtindonban() {SoHDD=sohd,MaNV=manv,NgayMua=ngaymua,MaKH=makh,MaHang=mahang,SoLuong=soluong
                ,GiaBan=giaban,ThanhTien=thanhtien,Thue=thue,GiamGia=giamgia,TongTien=tongtien};
                ds.Add(donban);
            }
            dgvhoadon.DataSource = ds;
            reader.Close();

        }
        public void hienthijoin(string tencot,string value)
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select a.SoDDH, a.MaNV, a.NgayMua, a.MaKH, 
                                       b.MaHang, b.SoLuong,b.GiaBan,b.ThanhTien,a.Thue, b.GiamGia, a.TongTien
                                from DonDatHang a
                                join CTDonDatHang b on a.SoDDH = b.SoDDH
                                where a.SoDDH in (
                                    select SoDDH
                                    from DonDatHang
                                    where "+tencot+"='"+value+"')";
            cmd.Connection = conn;
            List<Thongtindonban> ds = new List<Thongtindonban>();
            Thongtindonban donban;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int sohd = reader.GetInt32(0);
                string manv = reader.GetString(1);
                DateTime ngaymua = reader.GetDateTime(2);
                string makh = reader.GetString(3);
                string mahang = reader.GetString(4);
                int soluong = reader.GetInt32(5);
                int giaban = reader.GetInt32(6);
                int thanhtien = reader.GetInt32(7);
                int thue = reader.GetInt32(8);
                int giamgia = reader.GetInt32(9);
                int tongtien = reader.GetInt32(10);

                donban = new Thongtindonban()
                {
                    SoHDD = sohd,
                    MaNV = manv,
                    NgayMua = ngaymua,
                    MaKH = makh,
                    MaHang = mahang,
                    SoLuong = soluong,
                    GiaBan = giaban,
                    ThanhTien = thanhtien,
                    Thue = thue,
                    GiamGia = giamgia,
                    TongTien = tongtien
                };
                ds.Add(donban);
            }
            dgvhoadon.DataSource = ds;
            reader.Close();

        }

        private void btntimlai_Click(object sender, EventArgs e)
        {
            cboshd.SelectedIndex = -1;
            cbomakh.SelectedIndex = -1;
            cbomanv.SelectedIndex = -1;
            cbothang.SelectedIndex = -1;
            cbonam.SelectedIndex = -1;
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            if (cboshd.Text != "")
            {
                hienthiSoDDH();
                return;
            }
            if (cbomanv.Text != "")
            {
                hienthijoin("MaNV",cbomanv.Text);
                return;
            }
            if (cbomakh.Text != "")
            {
                hienthijoin("MaKH", cbomakh.Text);
                return;
            }
            if (cbonam.Text != "")
            {
                hienthijoin("YEAR(NgayMua)",cbonam.Text);
            }
            if (cbothang.Text != "")
            {
                hienthijoin("MONTH(NgayMua)",cbothang.Text);
            }
           
        }

        
    }
}
