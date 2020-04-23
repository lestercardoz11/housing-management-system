using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class AdminDashboardMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");
            retrieve();
        }
        

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
            char usertype = 'A';
            e.Command.Parameters["@Usertype"].Value = usertype;
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string commandName = e.CommandName;
            object commandArg = e.CommandArgument;
            ListViewItem selectedItem = e.Item;
            int dataItemIndex = selectedItem.DataItemIndex;
            int CID = Convert.ToInt32(commandArg);

            if (commandName == "View")
            {
                if (Page.IsValid)
                {
                    Session["CID"] = CID;
                    Response.Redirect("~/Models/Admin/AdminDashboardMessage1.aspx");
                }
            }
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
    }
}