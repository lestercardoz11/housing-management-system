using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class ManageHouse : System.Web.UI.Page
    {
        int UID;
        char UT;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            string name = "";

            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT * FROM dbo.Users WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = Session["Username"].ToString();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    name = (dr["FName"].ToString()) + " " + (dr["LName"].ToString());
                    UID = Convert.ToInt32(dr["UID"]);
                    UT = Convert.ToChar(dr["Usertype"].ToString());
                }
            }
            BAccount.Text = name;
        }

        protected void MAccount_MenuItemClick(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            if (e.Item.Text == "Log Out")
            {
                Session.Abandon();
                Response.Redirect("~/Models/Home/Homepage.aspx");
            }
        }

        protected void BCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string sql = null;

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    string sql1 = "SELECT * FROM dbo.Users WHERE Username = @Username";
                    int UID = RetrieveUID(sql1, cnn);

                    string sql2 = "SELECT * FROM Society WHERE SocietyName = @SocietyName";
                    int SID = RetrieveSID(sql2, cnn);

                    if (fuImage.HasFile == true)
                        sql = "IF NOT EXISTS (SELECT * FROM House WHERE ApartmentNo=@ApartmentNo) INSERT INTO House ([UID], [SID], [ApartmentNo], [Wing], [ApartmentSize], [ApartmentType], [Bedrooms], [Image], [EntryDate]) values(@UID, @SID, @ApartmentNo, @Wing, @ApartmentSize, @ApartmentType, @Bedrooms, @Image, @EntryDate)";
                    else
                        sql = "IF NOT EXISTS (SELECT * FROM House WHERE ApartmentNo=@ApartmentNo) INSERT INTO House ([UID], [SID], [ApartmentNo], [Wing], [ApartmentSize], [ApartmentType], [Bedrooms], [EntryDate]) values(@UID, @SID, @ApartmentNo, @Wing, @ApartmentSize, @ApartmentType, @Bedrooms, @EntryDate)";

                    cnn.Open();
                    try
                    {

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                            cmd.Parameters.Add("@SID", SqlDbType.Int).Value = SID;

                            int house = int.Parse(tbHouse.Text);
                            cmd.Parameters.Add("@ApartmentNo", SqlDbType.Int).Value = house;

                            string wing = tbWing.Text;
                            cmd.Parameters.Add("@Wing", SqlDbType.NVarChar, 50).Value = wing;

                            string size = tbSize.Text;
                            cmd.Parameters.Add("@ApartmentSize", SqlDbType.NVarChar, 50).Value = size;

                            string AType = ddlAType.SelectedValue;
                            cmd.Parameters.Add("@ApartmentType", SqlDbType.NVarChar, 50).Value = AType;

                            string Bedrooms = ddlBedrooms.SelectedValue;
                            cmd.Parameters.Add("@Bedrooms", SqlDbType.NVarChar, 50).Value = Bedrooms;

                            if (fuImage.HasFile == true)
                            {
                                int length = fuImage.PostedFile.ContentLength;
                                byte[] displaypicture = new byte[length];
                                fuImage.PostedFile.InputStream.Read(displaypicture, 0, length);
                                cmd.Parameters.AddWithValue("@Image", displaypicture);
                            }

                            cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;

                            adapter.InsertCommand = cmd;

                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                Notification(cnn, UID, house);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Apartment could not be created");
                            }

                            cnn.Close();
                        }
                    }
                    catch (System.Data.SqlClient.SqlException sqlException)
                    {
                        System.Windows.Forms.MessageBox.Show(sqlException.Message);
                    }
                    catch (FormatException)
                    {
                    }
                }
            }
        }

        protected void BNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void BHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
        }

        public int RetrieveUID(string sql, SqlConnection cnn)
        {
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cnn.Open();
                int UID = new int();
                cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = (tbUsername.Text).ToString();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    UID = int.Parse(dr["UID"].ToString());
                }
                cnn.Close();
                return UID;
            }
        }

        public int RetrieveSID(string sql, SqlConnection cnn)
        {
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cnn.Open();
                int SID = new int();
                string societyname = ddlSocietyName.SelectedValue;
                cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar, 50).Value = societyname;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    SID = int.Parse(dr["SID"].ToString());
                }
                cnn.Close();
                return SID;
            }
        }

        public void Notification(SqlConnection cnn, int UID, int house)
        {
            char usertype = UT;
            string notiftype = "Apartment Created";
            string notif = "Apartment Number " + house + " has been created.";
            string sql = "INSERT INTO Notifications ([UID], [Usertype], [Notiftype], [Notification], [EntryDate]) values(@UID, @Usertype, @Notiftype, @Notification, @EntryDate)";
            SqlDataAdapter adapter = new SqlDataAdapter();
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;
                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;
                cmd.Parameters.Add("@Notiftype", SqlDbType.NVarChar, 50).Value = notiftype;
                cmd.Parameters.Add("@Notification", SqlDbType.NVarChar, 500).Value = notif;
                cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;
                adapter.InsertCommand = cmd;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    BCreate_ModalPopupExtender.Show();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Apartment could not be created");
                }
            }
        }
    }
}