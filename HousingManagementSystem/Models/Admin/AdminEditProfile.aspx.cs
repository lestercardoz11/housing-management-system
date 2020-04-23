using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models.Admin
{
    public partial class AdminEditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            if (!IsPostBack)
            {
                retrieve();
            }
        }

        char UT;
        public void retrieve()
        {
            string name = "";
            try
            {
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

                        tbFirstName.Text = (dr["FName"].ToString());
                        tbLastName.Text = (dr["LName"].ToString());
                        tbCardNumber.Text = (dr["RCNumber"].ToString());

                        if (dr["Bdate"].ToString() != string.Empty)
                        {
                            string datestr = (dr["Bdate"].ToString());
                            DateTime dateTime = Convert.ToDateTime(datestr);
                            tbDOB.Text = dateTime.ToShortDateString();
                        }

                        rbMale.Checked = (dr["Gender"].ToString() == "M");
                        rbFemale.Checked = (dr["Gender"].ToString() == "F");

                        tbEmail.Text = (dr["Email"].ToString());
                        tbMobile.Text = (dr["Mobile"].ToString());
                        tbAlternateMobile.Text = (dr["AMobile"].ToString());
                        tbTelephone.Text = (dr["Telephone"].ToString());
                        tbUsername.Text = (dr["Username"].ToString());

                        rbAdmin.Checked = (dr["Usertype"].ToString() == "A");
                        rbMember.Checked = (dr["Usertype"].ToString() == "M");

                        UT = Convert.ToChar(dr["Usertype"].ToString());
                    }
                    cnn.Close();
                    cnn.Dispose();
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
            args.IsValid = rbAdmin.Checked || rbAdmin.Checked;
        }

        protected void BUpdate_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string sql = null;
                char gen;
                char users;

                if (rbMale.Checked == true)
                {
                    gen = 'M';
                }
                else if (rbFemale.Checked == true)
                {
                    gen = 'F';
                }
                else
                {
                    gen = default(char);
                }

                if (rbAdmin.Checked == true)
                {
                    users = 'A';
                }
                else if (rbMember.Checked == true)
                {
                    users = 'M';
                }
                else
                {
                    users = default(char);
                }

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    string sql1 = "SELECT * FROM dbo.Users WHERE Username = @Username";

                    int UID = RetrieveID(sql1,cnn);

                    if (fuImage.HasFile == true)
                    {
                        sql = "UPDATE Users SET [FName]=@FName, [LName]=@LName, [RCNumber]=@RCNumber, [Bdate]=@Bdate, [Gender]=@Gender, [Email]=@Email, [Mobile]=@Mobile, [AMobile]=@AMobile, [Telephone]=@Telephone, [Username]=@Username, [Usertype]=@Usertype,[Image]=@Image WHERE UID=@UID";
                    }
                    else
                        sql = "UPDATE Users SET [FName]=@FName, [LName]=@LName, [RCNumber]=@RCNumber, [Bdate]=@Bdate, [Gender]=@Gender, [Email]=@Email, [Mobile]=@Mobile, [AMobile]=@AMobile, [Telephone]=@Telephone, [Username]=@Username, [Usertype]=@Usertype, WHERE UID=@UID";
                    try
                    {
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                            var fname = cmd.Parameters.AddWithValue("@FName", tbFirstName.Text);
                            fname.SqlDbType = SqlDbType.NVarChar;

                            var lname = cmd.Parameters.AddWithValue("@LName", tbLastName.Text);
                            lname.SqlDbType = SqlDbType.NVarChar;

                            var cardnumber = cmd.Parameters.AddWithValue("@RCNumber", tbCardNumber.Text);
                            cardnumber.SqlDbType = SqlDbType.NVarChar;

                            var BDate = cmd.Parameters.AddWithValue("@Bdate", Convert.ToDateTime(tbDOB.Text));
                            BDate.SqlDbType = SqlDbType.DateTime;

                            if (gen != default(char))
                                cmd.Parameters.AddWithValue("@Gender", gen);
                            else
                                cmd.Parameters.AddWithValue("@Gender", DBNull.Value);

                            var email = cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
                            email.SqlDbType = SqlDbType.NVarChar;

                            var mobile = cmd.Parameters.AddWithValue("@Mobile", tbMobile.Text);
                            mobile.SqlDbType = SqlDbType.NVarChar;

                            var AMobile = cmd.Parameters.AddWithValue("@AMobile", tbAlternateMobile.Text);
                            AMobile.SqlDbType = SqlDbType.NVarChar;

                            var telephone = cmd.Parameters.AddWithValue("@Telephone", tbTelephone.Text);
                            telephone.SqlDbType = SqlDbType.NVarChar;

                            var username = cmd.Parameters.AddWithValue("@Username", tbUsername.Text);
                            username.SqlDbType = SqlDbType.NVarChar;

                            if (users != default(char))
                                cmd.Parameters.AddWithValue("@Usertype", users);
                            else
                                cmd.Parameters.AddWithValue("@Usertype", DBNull.Value);
                            
                            if (fuImage.HasFile == true)
                            {
                                int length = fuImage.PostedFile.ContentLength;
                                byte[] displaypicture = new byte[length];
                                fuImage.PostedFile.InputStream.Read(displaypicture, 0, length);
                                cmd.Parameters.AddWithValue("@Image", displaypicture);
                            }

                            cnn.Open();
                            cmd.ExecuteNonQuery();
                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                string sql2 = "SELECT COUNT(1) FROM dbo.Users WHERE Username = @Username";
                                string uname = RetrieveName(sql2, cnn);

                                Notification(cnn, UID);

                                if (rbMember.Checked == true || uname == null)
                                {
                                    Session.Abandon();
                                    Response.Redirect("~/Models/Home/Homepage.aspx");
                                }
                                else
                                    Session["Username"] = uname;

                                Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
                            }
                                
                        }
                    }
                    catch (System.Data.SqlClient.SqlException sqlException)
                    {
                        System.Windows.Forms.MessageBox.Show(sqlException.Message);
                    }
                    catch (System.IndexOutOfRangeException IORE)
                    {
                        System.Windows.Forms.MessageBox.Show(IORE.Message);
                    }
                    finally
                    {
                        cnn.Close();
                        cnn.Dispose();
                    }
                }

            }
        }

        public int RetrieveID(string sql, SqlConnection cnn)
        {
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cnn.Open();
                int UID = new int();
                cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = Session["Username"].ToString();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    UID = Convert.ToInt32(dr["UID"].ToString());
                }
                cnn.Close();

                return UID;
            }
        }

        public string RetrieveName(string sql, SqlConnection cnn)
        {
            string uname;
            SqlCommand cmd = new SqlCommand(sql, cnn);

            uname = tbUsername.Text.Trim();
            cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = uname;

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count == 1)
                return uname;
            else
                return null;
        }

        public void Notification(SqlConnection cnn, int UID)
        {
            char usertype = UT;
            string notiftype = "Profile Details Changed";
            string notif = "Profile Details has been changed.";
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
                    System.Windows.Forms.MessageBox.Show("Profile Details Changed.");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Profile Details could not be changed");
                }
            }
        }
    }
}