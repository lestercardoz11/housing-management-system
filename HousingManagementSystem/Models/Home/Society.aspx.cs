using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AjaxControlToolkit;
using System.IO;

namespace HousingManagementSystem.Models
{
    public partial class Society : System.Web.UI.Page
    {
        int SID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData();
                PopulateMenu(dt);
            }
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
        
        private DataTable GetData()
        {
            string query = "SELECT * FROM Society";
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                DataTable dt = new DataTable();
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = cnn;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }
        
        private void PopulateMenu(DataTable dt)
        {
            foreach (DataRow row in dt.Rows)
            {
                MenuItem menuItem = new MenuItem
                {
                    Value = row["SocietyName"].ToString(),
                    Text = row["SocietyName"].ToString(),
                };
                MenuSociety.Items.Add(menuItem);
            }
        }
        
        protected void MenuSociety_MenuItemClick(object sender, MenuEventArgs e)
        {
            string query = "SELECT * FROM Society WHERE SocietyName=@SocietyName";
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                SqlCommand cmd = new SqlCommand(query, cnn);
                string societyname = e.Item.Text;
                cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar, 50).Value = societyname;
                if (e.Item.Text == societyname)
                {
                    e.Item.Selected = true;
                    cnn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lblSocietyName.Text = (dr["SocietyName"].ToString());
                        lblCity.Text = (dr["City"].ToString());
                        lblCountry.Text = (dr["Country"].ToString());
                        lblSize.Text = (dr["ProjectSize"].ToString());
                        lblArea.Text = (dr["ProjectArea"].ToString());
                        lblStatus.Text = (dr["ProjectStatus"].ToString());
                        lblLauchdate.Text = (dr["LaunchDate"].ToString());
                        lblbuilding.Text = (dr["SocietyName"].ToString());
                        string str = (dr["Amenities"].ToString());
                        string[] Amenities = str.Split(new char[] { '|' });

                        for (int i = 0; i < Amenities.Length; i++)
                        {
                            Label lbl = new Label();
                            lbl.ID = "Label" + i.ToString();
                            lbl.Text = "• " + Amenities[i].ToString();
                            lbl.CssClass = "Label";
                            TableCell tc = new TableCell();
                            tc.VerticalAlign = VerticalAlign.Middle;
                            tc.Controls.Add(lbl);
                            TableRow tb = new TableRow();
                            tb.VerticalAlign = VerticalAlign.Middle;
                            tb.Controls.Add(tc);
                            TableAmenities.Controls.Add(tb);
                        }
                        SID = Convert.ToInt32(dr["SID"]);
                        GetSlides(SID);
                        
                    }
                    cnn.Close();
                }
            }
        }

        protected void MenuSociety_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = "SELECT * FROM Society WHERE SocietyName=@SocietyName";
                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    SqlCommand cmd = new SqlCommand(query, cnn);
                    string societyname = MenuSociety.Items[0].Text;
                    cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar, 50).Value = societyname;
                    if (MenuSociety.Items[0].Text == societyname)
                    {
                        MenuSociety.Items[0].Selected = true;
                        cnn.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            lblSocietyName.Text = (dr["SocietyName"].ToString());
                            lblCity.Text = (dr["City"].ToString());
                            lblCountry.Text = (dr["Country"].ToString());
                            lblSize.Text = (dr["ProjectSize"].ToString());
                            lblArea.Text = (dr["ProjectArea"].ToString());
                            lblStatus.Text = (dr["ProjectStatus"].ToString());
                            lblLauchdate.Text = (dr["LaunchDate"].ToString());
                            lblbuilding.Text = (dr["SocietyName"].ToString());

                            string str = (dr["Amenities"].ToString());
                            string[] Amenities = str.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);

                            for (int i = 0; i < Amenities.Length; i++)
                            {
                                Label lbl = new Label();
                                lbl.ID = "Label" + i.ToString();
                                lbl.Text = "• " + Amenities[i].ToString();
                                lbl.CssClass = "Label";
                                TableCell tc = new TableCell();
                                tc.VerticalAlign = VerticalAlign.Middle;
                                tc.Controls.Add(lbl);
                                TableRow tb = new TableRow();
                                tb.VerticalAlign = VerticalAlign.Middle;
                                tb.Controls.Add(tc);
                                TableAmenities.Controls.Add(tb);
                            }
                            SID = Convert.ToInt32(dr["SID"]);
                            GetSlides(SID);
                        }
                        cnn.Close();
                    }
                }
            }
        }

        protected void BDetails_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string sql = null;

                using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                {
                    cnn.Open();

                    sql = "INSERT INTO [ContactDetails] ([FullName], [Mobile], [Email], [EntryDate]) values(@FullName, @Mobile, @Email, @EntryDate)";

                    try
                    {

                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            string fullname = txtbName.Text;
                            cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50).Value = fullname;

                            string mobile = txtPhone.Text;
                            cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar, 50).Value = mobile;

                            string email = txtbEmail.Text;
                            cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = email;

                            cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;

                            adapter.InsertCommand = cmd;

                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                Notification(cnn);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Contact Details could not be processed.");
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

        public void Notification(SqlConnection cnn)
        {
            string SName = MenuSociety.SelectedItem.Text; 
            char usertype = 'A';
            string notiftype = "Contact Information";
            string notif = "A guest user has requested information about society" + SName + ".";
            string sql = "INSERT INTO Notifications ([Usertype], [Notiftype], [Notification], [EntryDate]) values(@Usertype, @Notiftype, @Notification, @EntryDate)";
            SqlDataAdapter adapter = new SqlDataAdapter();
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;
                cmd.Parameters.Add("@Notiftype", SqlDbType.NVarChar, 50).Value = notiftype;
                cmd.Parameters.Add("@Notification", SqlDbType.NVarChar, 500).Value = notif;
                cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;
                adapter.InsertCommand = cmd;
                if (cmd.ExecuteNonQuery() == 1)
                {
                    RetrieveSociety(cnn);
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Contact Details could not be processed.");
                }
            }
        }

        public void RetrieveSociety(SqlConnection cnn)
        {
            string sname = MenuSociety.SelectedItem.Text;
            string query = "SELECT * FROM Society WHERE SocietyName=@SocietyName";
            using (SqlCommand cmd = new SqlCommand(query, cnn))
            {
                cmd.Parameters.Add("@SocietyName", SqlDbType.NVarChar, 50).Value = sname;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    LabelBuilding.Text = (dr["SocietyName"].ToString());
                    LabelDeveloperName.Text = (dr["DeveloperName"].ToString());
                    LabelMobile.Text = (dr["ContactNumber"].ToString());
                    BDetails_ModalPopupExtender.Show();
                }
            }
               
        }
        
        public void GetSlides(int SID)
        {
            string constr = ConfigurationManager.ConnectionStrings["HousingMSdbConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Image FROM Images WHERE SID=@SID", conn))
                {
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.Add("@SID", SqlDbType.Int).Value = SID;
                        da.Fill(dt);
                        rptImages.DataSource = dt;
                        rptImages.DataBind();
                    }
                }
            }
        }
    }
}
