using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace HousingManagementSystem.Models
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        protected void BSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string sql = null;

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();

                    sql = "INSERT INTO ContactUs ([FullName], [Mobile], [Email], [City], [Subject], [Message], [EntryDate]) values(@FullName, @Mobile, @Email, @City, @Subject, @Message, @EntryDate)";

                    try
                    {

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
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
                                Notification(cnn);
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

        protected void BNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void BHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Models/Home/Homepage.aspx");
        }

        public void Notification(SqlConnection cnn)
        {
            char usertype = 'A';
            string notiftype = "Message";
            string notif = "You've got a message.";
            string sql = "INSERT INTO Notifications ([Usertype], [Notiftype], [Notification], [EntryDate]) values(@Usertype, @Notiftype, @Notification, @EntryDate)";
            SqlDataAdapter adapter = new SqlDataAdapter();
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;
                cmd.Parameters.Add("@Notiftype", SqlDbType.NVarChar, 50).Value = notiftype;
                cmd.Parameters.Add("@Notification", SqlDbType.NVarChar, 500).Value = notif;
                cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;
                adapter.InsertCommand = cmd;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    ModalPopupExtender2.Show();
                    panelPopUp.Enabled = true;
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Message could not be sent.");
                }
            }
        }
    }
}