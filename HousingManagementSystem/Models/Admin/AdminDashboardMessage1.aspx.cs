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
    public partial class AdminDashboardMessage1 : System.Web.UI.Page
    {
        int CID;
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

        public void RetrieveData()
        {
            CID = Convert.ToInt32(Session["CID"]);
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT * FROM [ContactUs] WHERE ContactUs.CID = @CID";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@CID", SqlDbType.Int).Value = CID;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelName.Text = (dr["FullName"].ToString());
                    LabelSubject.Text = (dr["Subject"].ToString());
                    LabelCity.Text = (dr["City"].ToString());
                    LabelEmail.Text = (dr["Email"].ToString());
                    LabelMobile.Text = (dr["Mobile"].ToString());
                    LabelEntryDate.Text = (dr["EntryDate"].ToString());
                    LabelMessage.Text = (dr["Message"].ToString());
                }
            }
        }
    }
}