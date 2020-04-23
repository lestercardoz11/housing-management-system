using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models
{
    public partial class ManageSociety1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            retrieve();
            if (!IsPostBack)
            {
                BindDataSociety();
            }
        }

        int UID;
        char UT;
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
                    UID = Convert.ToInt32(dr["UID"]);
                    UT = Convert.ToChar(dr["Usertype"].ToString());
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

        protected void BindDataSociety()
        {
            try
            {
                GridView1.DataSourceID = null;
                GridView1.DataBind();
                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
                SqlDataSource1.SelectCommand = "SELECT * FROM [Society]";
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show("Binding: " + ex.Message);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindDataSociety();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string CString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
            string sql = SqlDataSourceSociety.DeleteCommand;
            string sql1 = "Delete from Images where SID=@SID";
            using (SqlConnection cnn = new SqlConnection(CString))
            {
                cnn.Open();
                SqlCommand cmd1 = new SqlCommand(sql1, cnn);
                int SID1 = Convert.ToInt32(id);
                cmd1.Parameters.AddWithValue("@SID", SID1);
                SqlCommand cmd = new SqlCommand(sql, cnn);
                string SocietyName = (GridView1.Rows[e.RowIndex].FindControl("Label1") as System.Web.UI.WebControls.Label).Text.Trim();
                cmd.Parameters.AddWithValue("@SID", id);

                cmd1.ExecuteNonQuery();
                if (cmd.ExecuteNonQuery() == 1)
                {
                    string notiftype = "Society Deleted";
                    string notif = "Society " + SocietyName + " has been deleted.";
                    Notification(cnn, notiftype, notif);
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("Society could not be deleted");
                }
                BindDataSociety();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (Page.IsValid)
            {
                string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
                string CString = null;
                string sql = null;

                CString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
                using (SqlConnection cnn = new SqlConnection(CString))
                {
                    cnn.Open();
                    sql = SqlDataSourceSociety.UpdateCommand;
                    try
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.AddWithValue("@SID", id);

                            string SocietyName = (GridView1.Rows[e.RowIndex].FindControl("tbSocietyName") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@SocietyName", SocietyName);

                            string ProjectSize = (GridView1.Rows[e.RowIndex].FindControl("tbProjectSize") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ProjectSize", ProjectSize);

                            string ProjectArea = (GridView1.Rows[e.RowIndex].FindControl("tbProjectArea") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ProjectArea", ProjectArea);

                            string ProjectStatus = (GridView1.Rows[e.RowIndex].FindControl("tbProjectStatus") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ProjectStatus", ProjectStatus);

                            string LaunchDate = (GridView1.Rows[e.RowIndex].FindControl("tbLaunchDate") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@LaunchDate", LaunchDate);

                            string Country = (GridView1.Rows[e.RowIndex].FindControl("tbCountry") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Country", Country);

                            string Address = (GridView1.Rows[e.RowIndex].FindControl("tbAddress") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Address", Address);

                            string City = (GridView1.Rows[e.RowIndex].FindControl("tbCity") as System.Web.UI.WebControls.TextBox).Text;
                            cmd.Parameters.AddWithValue("@City", City);

                            string Pincode = (GridView1.Rows[e.RowIndex].FindControl("tbPincode") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Pincode", Pincode);

                            string DeveloperName = (GridView1.Rows[e.RowIndex].FindControl("tbDeveloperName") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@DeveloperName", DeveloperName);

                            string ContactNumber = (GridView1.Rows[e.RowIndex].FindControl("tbContactNumber") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ContactNumber", ContactNumber);

                            string Amenities = (GridView1.Rows[e.RowIndex].FindControl("tbAmenities") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Amenities", Amenities);

                            string EntryDate = (GridView1.Rows[e.RowIndex].FindControl("tbEntryDate") as System.Web.UI.WebControls.TextBox).Text;
                            cmd.Parameters.AddWithValue("@EntryDate", EntryDate);

                            adapter.InsertCommand = cmd;
                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                string notiftype = "Society Updated";
                                string notif = "Society " + SocietyName + " has been updated.";
                                Notification(cnn, notiftype, notif);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Society could not be updated");
                            }
                            BindDataSociety();
                        }
                    }
                    catch (System.Data.SqlClient.SqlException sqlException)
                    {
                        System.Windows.Forms.MessageBox.Show("SQL :" + sqlException.Message);
                    }
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindDataSociety();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindDataSociety();
        }

        public void Notification(SqlConnection cnn, string notiftype, string notif)
        {
            char usertype = UT;
            string sql = "INSERT INTO Notifications ([UID], [Usertype], [Notiftype], [Notification], [EntryDate]) values(@UID, @Usertype, @Notiftype, @Notification, @EntryDate)";
            SqlDataAdapter adapter = new SqlDataAdapter();
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.Add("@UID", SqlDbType.Int).Value = Convert.ToInt32(UID);
                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;
                cmd.Parameters.Add("@Notiftype", SqlDbType.NVarChar, 50).Value = notiftype;
                cmd.Parameters.Add("@Notification", SqlDbType.NVarChar, 500).Value = notif;
                cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;
                adapter.InsertCommand = cmd;
                if (cmd.ExecuteNonQuery() != 1)
                {
                    System.Windows.Forms.MessageBox.Show("Society could not be created");
                }
            }
        }
    }
}