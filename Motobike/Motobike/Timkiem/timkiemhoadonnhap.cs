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

namespace Motobike.Timkiem
{
    public partial class timkiemhoadonnhap : Form
    {
        public timkiemhoadonnhap()
        {
            InitializeComponent();
        }
        private void timkiemhoadonnhap_Load_1(object sender, EventArgs e)
        {
            NapMaHD();
            NapManv();
            NapMaNCC();
        }
        public void NapMaHD()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaHD(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomahd.Items.Add(reader["SoHDN"].ToString());
            }
            reader.Close();
        }
        public void NapMaNCC()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaNCC(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbomancc.Items.Add(reader["MaNCC"].ToString());
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
        public void hienthiSoHDN()
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"SELECT 
                                a.SoHDN,
                                a.MaNV, 
                                a.NgayNhap, 
                                a.MaNCC, 
                                b.MaHang, 
                                b.SoLuong, 
                                b.DonGia, 
                                b.ThanhTien, 
                                b.GiamGia,
	                            a.TongTien
                            FROM HoaDonNhap_New a 
                            JOIN CTHoaDonNhap b ON a.SoHDN = b.SoHDN
                            where a.SoHDN ='"+cbomahd.Text+"'";
            cmd.Connection = conn;
            List<Thongtindonnhap> ds = new List<Thongtindonnhap>();
            Thongtindonnhap donhap;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int sohd = reader.GetInt32(0);
                string manv = reader.GetString(1);
                DateTime ngaynhap = reader.GetDateTime(2);
                string mancc = reader.GetString(3);
                string mahang = reader.GetString(4);
                int soluong = reader.GetInt32(5);
                int giaban = reader.GetInt32(6);
                int thanhtien = reader.GetInt32(7);
                int giamgia = reader.GetInt32(8);
                int tongtien = reader.GetInt32(9);

                donhap = new Thongtindonnhap()
                {
                    SoHDN = sohd,
                    MaNV = manv,
                    NgayNhap = ngaynhap,
                    MaNCC = mancc,
                    MaHang = mahang,
                    SoLuong = soluong
                ,
                    DonGia = giaban,
                    ThanhTien = thanhtien,
                    GiamGia = giamgia,
                    TongTien = tongtien
                };
                ds.Add(donhap);
            }
            dgvhoadonnhap.DataSource = ds;
            reader.Close();

        }
        public void hienthijoin(string tencot, string value)
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"SELECT 
                                a.SoHDN,
                                a.MaNV, 
                                a.NgayNhap, 
                                a.MaNCC, 
                                b.MaHang, 
                                b.SoLuong, 
                                b.DonGia, 
                                b.ThanhTien, 
                                b.GiamGia,
	                            a.TongTien
                            FROM HoaDonNhap_New a 
                            JOIN CTHoaDonNhap b ON a.SoHDN = b.SoHDN
                            where "+tencot+"='"+value+"'";
            cmd.Connection = conn;
            List<Thongtindonnhap> ds = new List<Thongtindonnhap>();
            Thongtindonnhap donhap;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int sohd = reader.GetInt32(0);
                string manv = reader.GetString(1);
                DateTime ngaynhap = reader.GetDateTime(2);
                string mancc = reader.GetString(3);
                string mahang = reader.GetString(4);
                int soluong = reader.GetInt32(5);
                int giaban = reader.GetInt32(6);
                int thanhtien = reader.GetInt32(7);
                int giamgia = reader.GetInt32(8);
                int tongtien = reader.GetInt32(9);

                donhap = new Thongtindonnhap()
                {
                    SoHDN = sohd,
                    MaNV = manv,
                    NgayNhap = ngaynhap,
                    MaNCC = mancc,
                    MaHang = mahang,
                    SoLuong = soluong
                ,
                    DonGia = giaban,
                    ThanhTien = thanhtien,
                    GiamGia = giamgia,
                    TongTien = tongtien
                };
                ds.Add(donhap);
            }
            dgvhoadonnhap.DataSource = ds;
            reader.Close();

        }
        private void btntimkiem_Click_1(object sender, EventArgs e)
        {
            if (cbomahd.Text != "")
            {
                hienthiSoHDN();
                return;
            }
            if (cbomanv.Text != "")
            {
                hienthijoin("MaNV", cbomanv.Text);
                return;
            }
            if (cbonam.Text != "")
            {
                hienthijoin("Year(NgayNhap)", cbonam.Text);
                return;
            }
        }
       
    }
}
