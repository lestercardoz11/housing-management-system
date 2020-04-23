using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models.Member
{
    public partial class PropertyRent : System.Web.UI.Page
    {
        int UID;
        char UT;
        int HID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            if (Session["HID"] == null)
                Response.Redirect("~/Models/Member/Property.aspx");

            retrieve();
            RetrieveData();
        }

        public void retrieve()
        {
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
                    UID = int.Parse(dr["UID"].ToString());
                    UT = Convert.ToChar(dr["Usertype"].ToString());
                }
            }
            BAccount.Text = name;
        }

        public void RetrieveData()
        {
            HID = Convert.ToInt32(Session["HID"]);
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT House.HID, House.UID, House.SID, House.ApartmentNo, House.Wing, House.ApartmentSize, House.ApartmentType, House.Bedrooms, House.Image, House.EntryDate, Users.UID AS Expr1, Society.SocietyName, Society.ProjectStatus, Society.Country, Society.City FROM House INNER JOIN Society ON House.SID = Society.SID INNER JOIN Users ON House.UID = Users.UID WHERE (House.HID = @HID)";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@HID", SqlDbType.Int).Value = HID;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblBedrooms.Text = (dr["Bedrooms"].ToString());
                    lblSociety.Text = (dr["SocietyName"].ToString());
                    lblCity.Text = (dr["City"].ToString());
                    lblCountry.Text = (dr["Country"].ToString());
                    lblApartmentSize.Text = (dr["ApartmentSize"].ToString());
                    lblWing.Text = (dr["ApartmentNo"].ToString());
                    lblApartmentNo.Text = (dr["ApartmentNo"].ToString());
                    lblApartmentType.Text = (dr["ApartmentType"].ToString());
                    lblStatus.Text = (dr["ProjectStatus"].ToString());
                }
            }
        }

        protected void MAccount_MenuItemClick(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            if (e.Item.Text == "Log Out")
            {
                Session.Abandon();
                Response.Redirect("~/Models/Home/Homepage.aspx");
            }
        }
        

        public int RetrieveSID(int HID, SqlConnection cnn)
        {
            string sql = "SELECT * FROM House WHERE HID = @HID";
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cnn.Open();
                int SID = new int();
                cmd.Parameters.Add("@HID", SqlDbType.NVarChar, 50).Value = HID;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    SID = int.Parse(dr["SID"].ToString());
                }
                cnn.Close();
                return SID;
            }
        }
        
        public void Notification(SqlConnection cnn, string notiftype, string notif)
        {
            char usertype = UT;
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
                if (cmd.ExecuteNonQuery() != 1)
                {
                    System.Windows.Forms.MessageBox.Show("Rent Ad could not be displayed.");
                }
            }
        }

        protected void BRent_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string sql = null;

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    int SID = RetrieveSID(HID, cnn);
                    sql = "IF NOT EXISTS (SELECT * FROM Rent WHERE HID=@HID) INSERT INTO Rent ([HID], [UID], [SID], [Price], [EntryDate]) values(@HID, @UID, @SID, @Price, @EntryDate)";
                    cnn.Open();
                    try
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.Add("@HID", SqlDbType.Int).Value = HID;

                            cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                            cmd.Parameters.Add("@SID", SqlDbType.Int).Value = SID;

                            float price = float.Parse(TextBoxPrice.Text, CultureInfo.InvariantCulture.NumberFormat);
                            cmd.Parameters.Add("@Price", SqlDbType.Float).Value = price;

                            cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;

                            adapter.InsertCommand = cmd;

                            InsertImage(cnn);

                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                string notiftype = "Property Rent Ad";
                                string notif = "Apartment " + lblApartmentNo.Text + " Rent Ad is being displayed.";
                                Notification(cnn, notiftype, notif);
                                Response.Redirect("~/Models/Member/Property.aspx");
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Rent Ad could not be displayed.");
                            }

                            cnn.Close();
                        }
                    }
                    catch (System.Data.SqlClient.SqlException sqlException)
                    {
                        System.Windows.Forms.MessageBox.Show("SQL: " + sqlException.Message);
                    }
                    catch (FormatException)
                    {
                        System.Windows.Forms.MessageBox.Show("Please enter the price.");
                    }
                    catch (Exception ex)
                    {
                        System.Windows.Forms.MessageBox.Show(ex.Message);
                    }
                }
            }
        }

        public void InsertImage(SqlConnection cnn)
        {
            string sql;
            HID = Convert.ToInt32(Session["HID"]);

            if ((FileUploadProperty.PostedFile != null) && (FileUploadProperty.PostedFile.ContentLength > 0))
            {
                var count = 0;
                foreach (HttpPostedFile item in FileUploadProperty.PostedFiles)
                {
                    string ext = Path.GetExtension(item.FileName);
                    if (ext == ".jpg" || ext == ".png")
                    {
                        string name = Path.GetFileName(item.FileName);
                        string SaveLocation = Server.MapPath(Path.Combine("~/Images/House/", name));
                        try
                        {
                            item.SaveAs(SaveLocation);
                            sql = "INSERT INTO [dbo].[Images] ([HID], [Image]) VALUES(@HID, @Image)";
                            string image = "~/Images/House/" + name;
                            using (SqlCommand cmd1 = new SqlCommand(sql, cnn))
                            {
                                cmd1.Parameters.Add("@HID", SqlDbType.Int).Value = HID;
                                cmd1.Parameters.AddWithValue("@Image", image);
                                if (cmd1.ExecuteNonQuery() != 1)
                                {
                                    System.Windows.Forms.MessageBox.Show("Society Images could not be uploaded.");
                                }
                            }

                            count++;
                        }
                        catch (Exception ex)
                        {
                            System.Windows.Forms.MessageBox.Show("Error: " + ex.Message);
                        }
                    }
                    else
                    {
                        Response.Write("You can upload only jpg or png files.");
                    }
                    if (count > 0)
                    {
                        Response.Write(count + " files has been uploaded.");
                    }
                }
            }
            else
            {
                Response.Write("Please select a file to upload.");
            }
        }
    }
}