using System;
using System.Data;
using System.Data.SqlClient;

namespace HousingManagementSystem.Models.Member
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        int UID;
        char UT;
        string Pw;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            if (!IsPostBack)
            {
                retrieve();
            }
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
                    Pw = (dr["Password"].ToString());
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

        protected void BSubmit_Click(object sender, EventArgs e)
        {
            string old = tbOldPw.Text;
            string newPw = tbNewPw.Text;
            string RePw = tbConfirmPw.Text;

            if (old == Pw)
            {
                if (newPw == RePw)
                {
                    if (IsPostBack)
                    {
                        using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                        {
                            string sql = "UPDATE Users SET [Password]=@Password WHERE UID=@UID";

                            try
                            {
                                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                                {
                                    cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                                    var fname = cmd.Parameters.AddWithValue("@Password", tbNewPw.Text);
                                    fname.SqlDbType = SqlDbType.NVarChar;

                                    cnn.Open();
                                    cmd.ExecuteNonQuery();
                                    if (cmd.ExecuteNonQuery() == 1)
                                    {
                                        Notification(cnn, UID);
                                    }
                                    else
                                    {
                                        System.Windows.Forms.MessageBox.Show("Password could not be changed.");
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
            }
        }

        protected void BClear_Click(object sender, EventArgs e)
        {
            tbOldPw.Text = "";
            tbNewPw.Text = "";
            tbConfirmPw.Text = "";
        }

        public void Notification(SqlConnection cnn, int UID)
        {
            char usertype = UT;
            string notiftype = "Password Changed";
            string notif = "Password has been changed.";
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
                    System.Windows.Forms.MessageBox.Show("Password changed.");
                    Response.Redirect("~/Models/Member/MemberDashBoard.aspx");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Password could not be changed.");
                }
            }
        }
    }
}