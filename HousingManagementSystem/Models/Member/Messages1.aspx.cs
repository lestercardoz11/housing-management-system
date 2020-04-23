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
    public partial class Messages1 : System.Web.UI.Page
    {
        int MID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            if (Session["MID"] == null)
                Response.Redirect("~/Models/Member/Messages.aspx");

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
            MID = Convert.ToInt32(Session["MID"]);
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT Users.UID AS Expr7, House.HID AS Expr5, House.UID AS Expr6, House.ApartmentNo, Message.* FROM Message INNER JOIN Users ON Message.UID = Users.UID INNER JOIN House ON Message.HID = House.HID AND Users.UID = House.UID WHERE (Message.MID = @MID)";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@MID", SqlDbType.Int).Value = MID;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelName.Text = (dr["FullName"].ToString());
                    LabelSubject.Text = (dr["Subject"].ToString());
                    LabelCity.Text = (dr["City"].ToString());
                    LabelEmail.Text = (dr["Email"].ToString());
                    LabelMobile.Text = (dr["Mobile"].ToString());
                    LabelApartment.Text = (dr["ApartmentNo"].ToString());
                    LabelEntryDate.Text = (dr["EntryDate"].ToString());
                    LabelMessage.Text = (dr["Message"].ToString());
                }
            }
        }
    }
}