using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class ManageSociety : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            retrieve();
        }

        int UID;
        char UT;
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
                string strcbl = string.Empty;

                for (int i = 0; i < cblAmentities1.Items.Count; i++)
                {
                    if (cblAmentities1.Items[i].Selected == true)
                    {
                        strcbl = strcbl + cblAmentities1.Items[i].Value.ToString() + "|";
                    }
                }

                for (int i = 0; i < cblAmentities2.Items.Count; i++)
                {
                    if (cblAmentities2.Items[i].Selected == true)
                    {
                        strcbl = strcbl + cblAmentities2.Items[i].Value.ToString() + "|";
                    }
                }

                for (int i = 0; i < cblAmentities3.Items.Count; i++)
                {
                    if (cblAmentities3.Items[i].Selected == true)
                    {
                        strcbl = strcbl + cblAmentities3.Items[i].Value.ToString() + "|";
                    }
                }
                SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411; MultipleActiveResultSets=true");
                
                {
                    SqlCommand cmd = new SqlCommand("InsertSociety", cnn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    string societyname = tbSociety.Text;
                    cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar, 50).Value = societyname;

                    int size = int.Parse(tbSize.Text);
                    cmd.Parameters.Add("@ProjectSize", SqlDbType.Int).Value = size;

                    string area = tbArea.Text;
                    cmd.Parameters.Add("@ProjectArea", SqlDbType.NVarChar, 50).Value = area;

                    string status = ddlStatus.SelectedValue;
                    cmd.Parameters.Add("@ProjectStatus", SqlDbType.NVarChar, 50).Value = status;

                    string launch = tbLaunch.Text;
                    cmd.Parameters.Add("@LaunchDate", SqlDbType.NVarChar, 50).Value = launch;

                    string country = tbCountry.Text;
                    cmd.Parameters.Add("@Country", SqlDbType.NVarChar, 50).Value = country;

                    string address = tbAddress.Text;
                    cmd.Parameters.Add("@Address", SqlDbType.NVarChar, 100).Value = address;

                    string city = tbCity.Text;
                    cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = city;

                    string pincode = tbPincode.Text;
                    cmd.Parameters.Add("@Pincode", SqlDbType.NVarChar, 50).Value = pincode;

                    string developername = tbDeveloperName.Text;
                    cmd.Parameters.Add("@DeveloperName", SqlDbType.NVarChar, 50).Value = developername;

                    string contactnumber = tbContactNumber.Text;
                    cmd.Parameters.Add("@ContactNumber", SqlDbType.NVarChar, 50).Value = contactnumber;

                    cmd.Parameters.Add("@Amenities", SqlDbType.NVarChar, 200).Value = strcbl;

                    cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;

                    SqlParameter outparameter = new SqlParameter();
                    outparameter.ParameterName = "@SID";
                    outparameter.SqlDbType = SqlDbType.Int;
                    outparameter.Direction = ParameterDirection.Output;
                    cmd.Parameters.Add(outparameter);

                    cnn.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        Notification(cnn, UID, societyname);
                    }
                    else
                    {
                        System.Windows.Forms.MessageBox.Show("Society could not be created");
                    }

                    int SID = Convert.ToInt32(outparameter.Value);

                    if ((fuImage.PostedFile != null) && (fuImage.PostedFile.ContentLength > 0))
                    {
                        var count = 0;
                        foreach (HttpPostedFile item in fuImage.PostedFiles)
                        {
                            string ext = Path.GetExtension(item.FileName);
                            if (ext == ".jpg" || ext == ".png")
                            {
                                string name = Path.GetFileName(item.FileName);
                                string SaveLocation = Server.MapPath(Path.Combine("~/Images/Society/", name));
                                try
                                {
                                    item.SaveAs(SaveLocation);
                                    sql = "INSERT INTO [dbo].[Images] ([SID], [Image]) VALUES(@SID, @Image)";
                                    string image = "~/Images/Society/" + name;
                                    using (SqlCommand cmd1 = new SqlCommand(sql, cnn))
                                    {
                                        cmd1.Parameters.Add("@SID", SqlDbType.Int).Value = SID;
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

        protected void BNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void BHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
        }

        public void Notification(SqlConnection cnn, int UID, string society)
        {
            char usertype = UT;
            string notiftype = "Society Created";
            string notif = "Society " + society + " has been created.";
            string sql = "INSERT INTO Notifications ([UID], [Usertype], [Notiftype], [Notification], [EntryDate]) values(@UID, @Usertype, @Notiftype, @Notification, @EntryDate)";
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;
                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;
                cmd.Parameters.Add("@Notiftype", SqlDbType.NVarChar, 50).Value = notiftype;
                cmd.Parameters.Add("@Notification", SqlDbType.NVarChar, 500).Value = notif;
                cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    BCreate_ModalPopupExtender.Show();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Society could not be created");
                }
            }
        }
    }
}