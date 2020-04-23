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
    public partial class ManageComplaintsInbox : System.Web.UI.Page
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

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string commandName = e.CommandName;
            object commandArg = e.CommandArgument;
            ListViewItem selectedItem = e.Item;
            int dataItemIndex = selectedItem.DataItemIndex;
            int CpID = Convert.ToInt32(commandArg);

            if (commandName == "Reply")
            {
                if (Page.IsValid)
                {
                    Session["CpID"] = CpID;
                    Response.Redirect("~/Models/Admin/ManageComplaintsInbox1.aspx");
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

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Panel panelComplaint = (Panel)e.Item.FindControl("panelComplaint");
                HtmlGenericControl div = (HtmlGenericControl)e.Item.FindControl("Reply");
                string status = (string)DataBinder.Eval(e.Item.DataItem, "Status");
                if (status == "Delivered")
                {
                    panelComplaint.BackColor = System.Drawing.Color.White;
                    div.Visible = false;
                }
                else
                {
                    panelComplaint.BackColor = System.Drawing.ColorTranslator.FromHtml("#EEEEEE");
                    div.Visible = true;
                }
            }
        }
    }
}