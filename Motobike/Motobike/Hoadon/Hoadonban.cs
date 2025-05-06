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

namespace Motobike.Hoadon
{
    public partial class Hoadonban : Form
    {
        public Hoadonban()
        {
            InitializeComponent();
        }

        private void Hoadonban_Load(object sender, EventArgs e)
        {
            NapMaKh();
            NapManv();
            NapMaHang();
            NapMaHD();
            int maend = Getma();
            txtmahd.Text = (maend + 1).ToString();
        }
        public void NapMaKh()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaKH(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbnmakhach.Items.Add(reader["MaKH"].ToString());
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
                cbnmanv.Items.Add(reader["MaNV"].ToString());
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
                cbnmahang.Items.Add(reader["MaHang"].ToString());
            }
            reader.Close();
        }
        public void NapMaHD()
        {
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.FillMaHD2(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                cbnmahd.Items.Add(reader["SoDDH"].ToString());
            }
            reader.Close();
        }
        private void cbnmanv_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select TenNV from NhanVien
                             where MaNV='" + cbnmanv.Text + "'";
            cmd.Connection = conn;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                txttennv.Text = reader.GetString(0);
            }
            reader.Close();
        }

        private void cbnmakhach_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select TenKH,DiaChi,DienThoai from KhachHang
                              where MaKH='" + cbnmakhach.Text + "'";
            cmd.Connection = conn;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read()) { 
                txttenkhach.Text = reader.GetString(0);
                txtdchi.Text = reader.GetString(1);
                txtdienthoai.Text = reader.GetString(2);
            }
            reader.Close();
        }

        private void cbnmahang_SelectedIndexChanged(object sender, EventArgs e)
        {

            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select TenHang,DonGiaBan from DMHang
                               where MaHang='" + cbnmahang.Text + "'";
            cmd.Connection = conn;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                txttenhang.Text = reader.GetString(0);
                txtgiatien.Text = reader.GetInt32(1).ToString();

            }
            reader.Close();
        }

        private void txtsolg_Leave(object sender, EventArgs e)
        {
            int gia = int.Parse(txtgiatien.Text);
            int slg = int.Parse(txtsolg.Text);
            txtthanhtien.Text = (gia * slg).ToString();
        }

        private void cbngiamgia_Leave(object sender, EventArgs e)
        {
            int giam = int.Parse(cbngiamgia.Text);
            int thanhtien = int.Parse(txtthanhtien.Text);
            if (giam == 0)
            {
                txttongtien.Text = thanhtien.ToString();
            }
            else
            {
                double tongtien = thanhtien - (thanhtien * (giam / 100.0));
                txttongtien.Text = tongtien.ToString();
            }
        }

        private void txtthue_Leave(object sender, EventArgs e)
        {
            int vat = int.Parse(txtthue.Text);
            int thanhtien = int.Parse(txttongtien.Text);
            double tongtien = thanhtien + (thanhtien * (vat / 100.0));
            txttongtien.Text = tongtien.ToString();
        }
        private int Getma()
        {
            int maend = 0;
            SqlCommand cmd = null;
            CONECT.FillData fillData = new CONECT.FillData();
            cmd = fillData.Macuoi2(cmd);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (!reader.IsDBNull(0))
                {
                    int value;
                    if (int.TryParse(reader[0].ToString(), out value))
                    {
                        maend += value;
                    }
                    else
                    {

                        maend += 0;
                    }
                }
            }
            reader.Close();
            return maend;
        }
        private void btnin_Click(object sender, EventArgs e)
        {
            Inhoadonban inhoadonban = new Inhoadonban();
            inhoadonban.Hoadonban(txtmahd.Text,txtngaymua.Text,cbnmanv.Text,txttennv.Text,cbnmakhach.Text,txttenkhach.Text,
                txtdchi.Text,txtdienthoai.Text,cbnmahang.Text,txttenhang.Text,int.Parse(txtsolg.Text),int.Parse(cbngiamgia.Text),
                int.Parse(txtgiatien.Text),int.Parse(txtthanhtien.Text),int.Parse(txtthue.Text),int.Parse(txttongtien.Text));
        }

        private void btnluu_Click(object sender, EventArgs e)
        {

            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"INSERT INTO DonDatHang (MaNV, NgayMua, MaKH, Thue, TongTien)
                                    VALUES 
                                    ('"+cbnmanv.Text+
                                    "','" + txtngaymua.Text + "'" +
                                    ",'"+cbnmakhach.Text+
                                    "',"+txtthue.Text +","+txttongtien.Text+");";
                              
            cmd.Connection = conn;
            int x = cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = @"INSERT INTO CTDonDatHang (MaHang, SoLuong, GiaBan,GiamGia ,ThanhTien)
                                VALUES 
                                (
                                '" + cbnmahang.Text +
                                "'," + int.Parse(txtsolg.Text)
                                + " ," + int.Parse(txtgiatien.Text) +
                                 " ," + int.Parse(cbngiamgia.Text) +
                                " ," + int.Parse(txtthanhtien.Text)+ ");";
            cmd1.Connection = conn;
            int y = cmd1.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "UPDATE DMHang " +
                    "SET SoLuong = SoLuong - @soluong " +
                    "WHERE MaHang = @mahang";

            cmd2.Parameters.AddWithValue("@soluong", int.Parse(txtsolg.Text));
            cmd2.Parameters.AddWithValue("@mahang", cbnmahang.Text);
            cmd2.Connection = conn;  
            int z = cmd2.ExecuteNonQuery();
            if (x > 0 && y > 0 && z>0)
            {
                MessageBox.Show("Lưu Hóa Đơn Thành Công");
            }
        }
        public void hienthi()
        {
            SqlConnection conn = null;
            CONECT.KetNoiXE ketNoi = new CONECT.KetNoiXE();
            conn = ketNoi.CON();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"select MaHang,SoLuong,GiaBan,GiamGia,ThanhTien from CTDonDatHang
                              where SoDDH='"+cbnmahd.Text+"'";

            cmd.Connection = conn;
            SqlDataReader sqlDataReader = cmd.ExecuteReader();
            List<HoadonbanCT> ds = new List<HoadonbanCT>();
            HoadonbanCT hd;
            while (sqlDataReader.Read())
            {
                string mah = sqlDataReader.GetString(0);
                string slg = sqlDataReader.GetInt32(1).ToString();
                string dongia = sqlDataReader.GetInt32(2).ToString();
                string giamgia = sqlDataReader.GetInt32(3).ToString();
                string thanhtien = sqlDataReader.GetInt32(4).ToString();
                hd = new HoadonbanCT() { SoDDH = cbnmahd.Text, MaHang = mah, SoLuong = slg, GiaBan = dongia, Gimagia = giamgia, ThanhTien = thanhtien };
                ds.Add(hd);
            }
            databanxe.DataSource = ds;
            sqlDataReader.Close();
        }

        private void btntimkiem_Click(object sender, EventArgs e)
        {
            hienthi();
        }

      
    }
}
