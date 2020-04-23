using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class ForSale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BLogIn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UsernameRequiredFieldValidator.EnableClientScript = true;
                try
                {
                    string uname = TxtUsername.Text.Trim();
                    string password = TxtPw.Text.Trim();
                    char utype;

                    if (rbAdmin.Checked == true)
                    {
                        utype = 'A';
                    }
                    else if (rbMember.Checked == true)
                    {
                        utype = 'M';
                    }
                    else
                    {
                        utype = default(char);
                    }

                    if (utype != default(char))
                    {
                        using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                        {
                            cnn.Open();
                            string sql = "SELECT COUNT(1) FROM dbo.Users WHERE Username = @Username and Password = @Password and Usertype = @Usertype";
                            SqlCommand cmd = new SqlCommand(sql, cnn);
                            cmd.Parameters.Add("@Username", SqlDbType.NVarChar, 50).Value = uname;
                            cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = password;
                            cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = utype;

                            int count = Convert.ToInt32(cmd.ExecuteScalar());

                            if (count == 1 && utype == 'A')
                            {
                                Session["Username"] = uname;
                                Response.Redirect("~/Models/Admin/AdminDashboard.aspx");
                            }
                            else if (count == 1 && utype == 'M')
                            {
                                Session["Username"] = uname;
                                Response.Redirect("~/Models/Member/MemberDashBoard.aspx");
                            }
                            else
                                LabelIncorrectP.Text = "Incorrect Username & Password.";

                            cnn.Close();
                        }
                    }
                    else
                        LabelIncorrectP.Text = "Please select the user type.";
                }
                catch (Exception)
                {
                    LabelIncorrectP.Text = "Invalid Credentials.";
                }
            }
        }

        protected void BDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Models/Home/Society.aspx");
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string commandName = e.CommandName;
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            int HID = Convert.ToInt32(commandArgs[0]);
            int UID = Convert.ToInt32(commandArgs[1]);
            string Apartment = commandArgs[2];
            if (commandName == "Enquire")
            {
                if (Page.IsValid)
                {
                    Session["HID"] = HID;
                    Session["UID"] = UID;
                    Session["Apartment"] = Apartment;
                    Response.Redirect("~/Models/Home/ForSale1.aspx");
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
            try
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                int i = dataItem.DisplayIndex;
                int HID = (int)ListView1.DataKeys[i]["HID"];

                Repeater rptImages = (Repeater)e.Item.FindControl("rptImages");
                string constr = ConfigurationManager.ConnectionStrings["HousingMSdbConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT Image FROM Images WHERE HID=@HID", conn))
                    {
                        DataTable dt = new DataTable();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            cmd.Parameters.Add("@HID", SqlDbType.Int).Value = HID;
                            if (rptImages != null)
                            {
                                da.Fill(dt);
                                rptImages.DataSource = dt;
                                rptImages.DataBind();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }
    }
}