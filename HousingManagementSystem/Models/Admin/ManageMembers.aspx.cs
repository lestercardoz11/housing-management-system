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
    public partial class ManageMembers : System.Web.UI.Page
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

        protected void CustomValidatorGender_Server(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbMale.Checked || rbFemale.Checked;
        }

        protected void CustomValidatorUser_Server(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rbAdmin.Checked || rbMember.Checked;
        }

        protected void BCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Pw = tbPassword.Text;
                string RePw = tbRPassword.Text;
                string sql = null;

                char usertype;
                if (rbAdmin.Checked == true)
                {
                    usertype = 'A';
                }
                else
                {
                    usertype = 'M';
                }

                char gen;
                if (rbMale.Checked == true)
                {
                    gen = 'M';
                }
                else
                {
                    gen = 'F';
                }

                if (Pw == RePw)
                {
                    using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                    {
                        cnn.Open();

                        if (fuImage.HasFile == true)
                        {
                            sql = "IF NOT EXISTS (SELECT * FROM Users WHERE Username=@Username) INSERT INTO Users ([FName], [LName], [RCNumber], [Bdate], [Gender], [Email], [Mobile], [AMobile], [Telephone], [Username], [Usertype], [Password], [Image], [EntryDate]) values(@FName, @LName, @RCNumber, @Bdate, @Gender, @Email, @Mobile, @AMobile, @Telephone, @Username, @Usertype, @Password, @Image, @EntryDate)";
                        }
                        else
                            sql = "IF NOT EXISTS (SELECT * FROM Users WHERE Username=@Username) INSERT INTO Users ([FName], [LName], [RCNumber], [Bdate], [Gender], [Email], [Mobile], [AMobile], [Telephone], [Username], [Usertype], [Password], [EntryDate]) values(@FName, @LName, @RCNumber, @Bdate, @Gender, @Email, @Mobile, @AMobile, @Telephone, @Username, @Usertype, @Password, @EntryDate)";

                        try
                        {

                            SqlDataAdapter adapter = new SqlDataAdapter();
                            using (SqlCommand cmd = new SqlCommand(sql, cnn))
                            {
                                string fname = tbFirstName.Text;
                                cmd.Parameters.Add("@FName", SqlDbType.NVarChar, 50).Value = fname;

                                string lname = tbLastName.Text;
                                cmd.Parameters.Add("@LName", SqlDbType.NVarChar, 50).Value = lname;

                                string cardnumber = tbCardNumber.Text;
                                cmd.Parameters.Add("@RCNumber", SqlDbType.NVarChar, 50).Value = cardnumber;

                                cmd.Parameters.Add("@Bdate", SqlDbType.DateTime).Value = Convert.ToDateTime(tbDOB.Text);

                                cmd.Parameters.Add("@Gender", SqlDbType.Char, 1).Value = gen;

                                string email = tbEmail.Text;
                                cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email;

                                string mobile = tbMobile.Text;
                                cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 50).Value = mobile;

                                string AMobile = tbAlternateMobile.Text;
                                cmd.Parameters.Add("@AMobile", SqlDbType.NVarChar, 50).Value = AMobile;

                                string telephone = tbTelephone.Text;
                                cmd.Parameters.Add("@Telephone", SqlDbType.NVarChar, 50).Value = telephone;

                                string username = tbUsername.Text;
                                cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = username;

                                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;

                                string password = tbPassword.Text;
                                cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = password;

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
                                    Notification(cnn, UID, username);
                                }
                                else
                                {
                                    System.Windows.Forms.MessageBox.Show("Member could not be created");
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
        }

        protected void BNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void BHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
        }

        public void Notification(SqlConnection cnn, int UID, string member)
        {
            char usertype = UT;
            string notiftype = "Member Created";
            string notif = "Member " + member + " has been created.";
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
                    System.Windows.Forms.MessageBox.Show("Member could not be created");
                }
            }
        }
    }
}