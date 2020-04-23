using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models.Member
{
    public partial class Complains : System.Web.UI.Page
    {
        int UID;
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
                    UID = int.Parse(dr["UID"].ToString());
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
            if (Page.IsValid)
            {
                string sql = null;

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();
                    
                    sql = "INSERT INTO Complaint ([UID], [Subject], [Complaint], [Status], [EntryDate]) values(@UID, @Subject, @Complaint, @Status, @EntryDate)";

                    try
                    {

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;

                            string subject = txtbSubject.Text;
                            cmd.Parameters.Add("@Subject", SqlDbType.NVarChar, 200).Value = subject;

                            string message = TextBoxMessage.Text;
                            cmd.Parameters.Add("@Complaint", SqlDbType.NVarChar, 500).Value = message;

                            string status = "Delivered";
                            cmd.Parameters.Add("@Status", SqlDbType.NVarChar, 50).Value = status;

                            cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;

                            adapter.InsertCommand = cmd;

                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                Notification(cnn);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Complaint could not be sent.");
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
            Response.Redirect("~/Models/Member/MemberDashBoard.aspx");
        }

        public void Notification(SqlConnection cnn)
        {
            char usertype = 'A';
            string notiftype = "Complaint";
            string notif = "You've got a Complaint.";
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
                    BSubmit_ModalPopupExtender.Show();
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Complaint could not be sent.");
                }
            }
        }
    }
}