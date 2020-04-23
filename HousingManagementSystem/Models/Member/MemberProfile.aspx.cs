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
    public partial class MemberProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            if (!IsPostBack)
            {
                retrieve();
            }
            Edit();
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
                        tbName.Text = name;
                        tbCardNumber.Text = (dr["RCNumber"].ToString());

                        if (dr["Bdate"].ToString() != string.Empty)
                        {
                            string datestr = (dr["Bdate"].ToString());
                            DateTime dateTime = Convert.ToDateTime(datestr);
                            tbDOB.Text = dateTime.ToShortDateString();
                        }

                        tbGender.Text = (dr["Gender"].ToString());
                        tbEmail.Text = (dr["Email"].ToString());
                        tbMobile.Text = (dr["Mobile"].ToString());
                        tbAlternateMobile.Text = (dr["AMobile"].ToString());
                        tbTelephone.Text = (dr["Telephone"].ToString());
                        tbUsername.Text = (dr["Username"].ToString());
                        tbUser.Text = (dr["Usertype"].ToString());

                        if (!Convert.IsDBNull(dr["Image"]))
                        {
                            byte[] displaypicture = (byte[])dr["Image"];
                            string img = Convert.ToBase64String(displaypicture, 0, displaypicture.Length);
                            ImageDisplay.ImageUrl = "data:Image/png;base64, " + img;
                        }
                    }
                }
            }
            catch (System.IndexOutOfRangeException IORE)
            {
                System.Windows.Forms.MessageBox.Show(IORE.Message);
            }
            catch (System.FormatException FE)
            {
                System.Windows.Forms.MessageBox.Show(FE.Message);
            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                System.Windows.Forms.MessageBox.Show(sqlException.Message);
            }
            BAccount.Text = name;
        }

        public void Edit()
        {
            string usertype;

            if (tbUser.Text == "A")
            {
                usertype = "Admin";
            }
            else if (tbUser.Text == "M")
            {
                usertype = "Member";
            }
            else
            {
                usertype = null;
            }
            tbUser.Text = usertype;

            string gen;

            if (tbGender.Text == "M")
            {
                gen = "Male";
            }
            else if (tbGender.Text == "F")
            {
                gen = "Female";
            }
            else
            {
                gen = null;
            }
            tbGender.Text = gen;
        }

        protected void MAccount_MenuItemClick(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            if (e.Item.Text == "Log Out")
            {
                Session.Abandon();
                Response.Redirect("~/Models/Home/Homepage.aspx");
            }
        }
    }
}