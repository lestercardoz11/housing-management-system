using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class Homepage : System.Web.UI.Page
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

                    if(utype != default(char))
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
    }
}