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
    public partial class ForSale1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UID"] == null || Session["HID"] == null)
                Response.Redirect("~/Models/Home/ForSale.aspx");

            LabelSubject.Text = "Apartment " + (Session["Apartment"]).ToString();
            RetrieveData();
        }

        protected void BLogIn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UsernameRequiredFieldValidator.EnableClientScript = true;
                try
                {
                    string uname = TxtUsername.Text.Trim();
                    string password = TxtPw.Text.Trim();
                    char utype;

                    if (rbAdmin.Checked == true)
                    {
                        utype = 'A';
                    }
                    else if (rbMember.Checked == true)
                    {
                        utype = 'M';
                    }
                    else
                    {
                        utype = default(char);
                    }

                    if (utype != default(char))
                    {
                        using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                        {
                            cnn.Open();
                            string sql = "SELECT COUNT(1) FROM dbo.Users WHERE Username = @Username and Password = @Password and Usertype = @Usertype";
                            SqlCommand cmd = new SqlCommand(sql, cnn);
                            cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = uname;
                            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = password;
                            cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = utype;

                            int count = Convert.ToInt32(cmd.ExecuteScalar());

                            if (count == 1 && utype == 'A')
                            {
                                Session["Username"] = uname;
                                Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
                            }
                            else if (count == 1 && utype == 'M')
                            {
                                Session["Username"] = uname;
                                Response.Redirect("~/Models/Member/MemberDashBoard.aspx");
                            }
                            else
                                LabelIncorrectP.Text = "Incorrect Username & Password.";

                            cnn.Close();
                        }
                    }
                    else
                        LabelIncorrectP.Text = "Please select the user type.";
                }
                catch (Exception)
                {
                    LabelIncorrectP.Text = "Invalid Credentials.";
                }
            }
        }

        protected void BDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Models/Home/Society.aspx");
        }
        
        protected void BSubmit_Click(object sender, EventArgs e)
        {
            int UID = Convert.ToInt32(Session["UID"]);
            int HID = Convert.ToInt32(Session["HID"]);

            if (Page.IsValid)
            {
                string sql = null;
                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();

                    sql = "INSERT INTO Message ([UID], [HID], [FullName], [Mobile], [Email], [City], [Subject], [Message], [EntryDate]) values(@UID, @HID, @FullName, @Mobile, @Email, @City, @Subject, @Message, @EntryDate)";

                    try
                    {

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                            cmd.Parameters.Add("@HID", SqlDbType.Int).Value = HID;

                            string fullname = txtbName.Text;
                            cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50).Value = fullname;

                            string mobile = txtbContact.Text;
                            cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 50).Value = mobile;

                            string email = txtbEmail.Text;
                            cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email;

                            string city = txtbCity.Text;
                            cmd.Parameters.Add("@City", SqlDbType.NVarChar, 50).Value = city;

                            string subject = txtbSubject.Text;
                            cmd.Parameters.Add("@Subject", SqlDbType.NVarChar, 50).Value = subject;

                            string message = TextBoxMessage.Text;
                            cmd.Parameters.Add("@Message", SqlDbType.NVarChar, 500).Value = message;

                            cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;

                            adapter.InsertCommand = cmd;

                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                Notification(cnn, UID);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Message could not be sent.");
                            }
                        }
                    }
                    catch (System.Data.SqlClient.SqlException sqlException)
                    {
                        System.Windows.Forms.MessageBox.Show(sqlException.Message);
                    }
                }
            }
        }

        public void RetrieveData()
        {
            int UID = Convert.ToInt32(Session["UID"]);
            try
            {
                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();
                    string sql = "SELECT * FROM dbo.Users WHERE UID = @UID";
                    SqlCommand cmd = new SqlCommand(sql, cnn);
                    cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        LabelName.Text = (dr["FName"].ToString()) + " " + (dr["LName"].ToString());
                        LabelEmail.Text = (dr["Email"].ToString());
                        LabelPhone.Text = (dr["Mobile"].ToString());

                        if (!Convert.IsDBNull(dr["Image"]))
                        {
                            byte[] displaypicture = (byte[])dr["Image"];
                            string img = Convert.ToBase64String(displaypicture, 0, displaypicture.Length);
                            ImageDisplay.ImageUrl = "data:Image/png;base64, " + img;
                        }
                    }
                }
            }
            catch (System.IndexOutOfRangeException IORE)
            {
                System.Windows.Forms.MessageBox.Show(IORE.Message);
            }
            catch (System.FormatException FE)
            {
                System.Windows.Forms.MessageBox.Show(FE.Message);
            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                System.Windows.Forms.MessageBox.Show(sqlException.Message);
            }
        }

        public void Notification(SqlConnection cnn, int UID)
        {
            char usertype = 'M';
            string notiftype = "Message";
            string notif = "You've got a message.";
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
                    Session.Abandon();
                    Response.Redirect("~/Models/Home/ForSale.aspx");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Message could not be sent.");
                }
            }
        }
    }
}