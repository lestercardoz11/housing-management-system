using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models.Member
{
    public partial class MemberDashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");
            retrieve();
            retrieve1();
            retrieve2();
            retrieve3();
        }

        int UID;

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
                        UID = int.Parse(dr["UID"].ToString());
                    }
                }
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

        protected void SqlDataSourceNotifications_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            char usertype = 'M';
            e.Command.Parameters["@Usertype"].Value = usertype;

            e.Command.Parameters["@UID"].Value = UID;
        }

        protected void ListView1_DataBound(object sender, EventArgs e)
        {
            if (ListView1.Items.Count > 0)
            {
                PanelDiv.Visible = false;
                PanelDiv.CssClass = "hidden";
            }
            else
            {
                PanelDiv.Visible = true;
                PanelDiv.CssClass = "show";
            }
        }

        public void retrieve1()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();
                    string sql = "SELECT COUNT(1) FROM [dbo].[House] WHERE UID=@UID";
                    SqlCommand cmd = new SqlCommand(sql, cnn);
                    cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    Label2.Text = count.ToString();
                }
            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                System.Windows.Forms.MessageBox.Show(sqlException.Message);
            }
        }

        public void retrieve2()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();
                    string sql = "SELECT COUNT(1) FROM [dbo].[Complaint] WHERE UID=@UID";
                    SqlCommand cmd = new SqlCommand(sql, cnn);
                    cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    Label4.Text = count.ToString();
                }
            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                System.Windows.Forms.MessageBox.Show(sqlException.Message);
            }
        }

        public void retrieve3()
        {
            try
            {
                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();
                    string sql = "SELECT COUNT(1) FROM [dbo].[Message] WHERE UID=@UID";
                    SqlCommand cmd = new SqlCommand(sql, cnn);
                    cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    Label6.Text = count.ToString();
                }
            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                System.Windows.Forms.MessageBox.Show(sqlException.Message);
            }
        }
    }
}