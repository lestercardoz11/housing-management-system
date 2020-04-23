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
    public partial class ComplaintsReply1 : System.Web.UI.Page
    {
        int CpID;
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
                }
            }
            BAccount.Text = name;

            RetrieveData();
        }

        protected void MAccount_MenuItemClick(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            if (e.Item.Text == "Log Out")
            {
                Session.Abandon();
                Response.Redirect("~/Models/Home/Homepage.aspx");
            }
        }

        public void RetrieveData()
        {
            CpID = Convert.ToInt32(Session["CpID"]);
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT Complaint.*, Users.UID AS Expr1, Users.FName, Users.LName FROM Complaint INNER JOIN Users ON Complaint.UID = Users.UID WHERE Complaint.CpID= @CpID";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@CpID", SqlDbType.Int).Value = CpID;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelName.Text = (dr["FName"].ToString()) + " " + (dr["LName"].ToString());
                    LabelSubject.Text = (dr["Subject"].ToString());
                    LabelEntryDate.Text = (dr["EntryDate"].ToString());
                    LabelMessage.Text = (dr["Complaint"].ToString());
                    LabelReply.Text = (dr["Reply"].ToString());
                    LabelReplyDate.Text = (dr["ReplyDate"].ToString());
                }
            }
        }
    }
}