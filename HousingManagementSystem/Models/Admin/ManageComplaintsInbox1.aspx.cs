using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class ManageComplaintsInbox1 : System.Web.UI.Page
    {
        int CpID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");
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

        int UID;
        char UT;
        public void RetrieveData()
        {
            CpID = Convert.ToInt32(Session["CpID"]);
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT Complaint.*, Users.UID AS Expr1, Users.FName, Users.LName, Users.Usertype FROM Complaint INNER JOIN Users ON Complaint.UID = Users.UID WHERE Complaint.CpID= @CpID";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@CpID", SqlDbType.Int).Value = CpID;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelUName.Text = (dr["FName"].ToString()) + " " + (dr["LName"].ToString());
                    LabelSubject.Text = (dr["Subject"].ToString());
                    LabelMessage.Text = (dr["Complaint"].ToString());
                    LabelEntryDate.Text = (dr["EntryDate"].ToString());
                    UID = int.Parse(dr["UID"].ToString());
                    UT = Convert.ToChar(dr["Usertype"].ToString());
                    
                    if (dr["Reply"].ToString() == string.Empty)
                    {
                        RReply.CssClass = "hidden";
                    }
                    else
                    {
                        RReply.CssClass = "show";
                        LabelReply.Text = (dr["Reply"].ToString());
                        LabelReplyDate.Text = (dr["ReplyDate"].ToString());
                    }
                }
            }
        }

        protected void BReply_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string sql = null;

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();

                    sql = "UPDATE [Complaint] SET [Reply] = @Reply, [Status] = @Status, [ReplyDate] = @ReplyDate WHERE [CpId] = @CpId";

                    try
                    {

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.Add("@CpId", SqlDbType.Int).Value = CpID;
                            
                            string message = tbMessage.Text;
                            cmd.Parameters.Add("@Reply", SqlDbType.NVarChar, 200).Value = message;

                            string status = "Replied";
                            cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 50).Value = status;

                            cmd.Parameters.Add("@ReplyDate", SqlDbType.DateTime).Value = DateTime.Now;

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

        public void Notification(SqlConnection cnn)
        {
            char usertype = UT;
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
                    System.Windows.Forms.MessageBox.Show("Replied");
                    Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Message could not be sent.");
                }
            }
        }
    }
}