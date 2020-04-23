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
    public partial class ManageMembers1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            retrieve();
            if (!IsPostBack)
            {
                BindDataMember();
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

        protected void BindDataMember()
        {
            try
            {
                GridView1.DataSourceID = null;
                GridView1.DataBind();
                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
                SqlDataSource1.SelectCommand = "SELECT * FROM [Users]";
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
            BindDataMember();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string CString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
            string sql = SqlDataSourceMember.DeleteCommand;
            using (SqlConnection cnn = new SqlConnection(CString))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    string Username = (GridView1.Rows[e.RowIndex].FindControl("Label4") as System.Web.UI.WebControls.Label).Text.Trim();
                    cmd.Parameters.AddWithValue("@UID", id);
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        string notiftype = "Member Deleted";
                        string notif = "Member " + Username + " has been deleted.";
                        Notification(cnn, notiftype, notif);
                    }
                    else
                    {
                        System.Windows.Forms.MessageBox.Show("Member could not be deleted");
                    }
                    BindDataMember();
                }
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
                    sql = SqlDataSourceMember.UpdateCommand;
                    try
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.AddWithValue("@UID", id);

                            string FName = (GridView1.Rows[e.RowIndex].FindControl("tbFName") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@FName", FName);

                            string LName = (GridView1.Rows[e.RowIndex].FindControl("tbLName") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@LName", LName);

                            string RCNumber = (GridView1.Rows[e.RowIndex].FindControl("tbRCNumber") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@RCNumber", RCNumber);

                            string Bdate = (GridView1.Rows[e.RowIndex].FindControl("tbBdate") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Bdate", Bdate);

                            string Gender = (GridView1.Rows[e.RowIndex].FindControl("tbGender") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Gender", Gender);

                            string Email = (GridView1.Rows[e.RowIndex].FindControl("tbEmail") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Email", Email);

                            string Mobile = (GridView1.Rows[e.RowIndex].FindControl("tbMobile") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Mobile", Mobile);

                            string AMobile = (GridView1.Rows[e.RowIndex].FindControl("tbAMobile") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@AMobile", AMobile);

                            string Telephone = (GridView1.Rows[e.RowIndex].FindControl("tbTelephone") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Telephone", Telephone);

                            string Username = (GridView1.Rows[e.RowIndex].FindControl("tbUsername") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Username", Username);

                            string Usertype = (GridView1.Rows[e.RowIndex].FindControl("tbUsertype") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Usertype", Usertype);

                            string Password = (GridView1.Rows[e.RowIndex].FindControl("tbPassword") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Password", Password);

                            string EntryDate = (GridView1.Rows[e.RowIndex].FindControl("tbEntryDate") as System.Web.UI.WebControls.TextBox).Text;
                            cmd.Parameters.AddWithValue("@EntryDate", EntryDate);

                            adapter.InsertCommand = cmd;
                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                string notiftype = "Member Updated";
                                string notif = "Member " + Username + " has been updated.";
                                Notification(cnn, notiftype, notif);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Member could not be updated");
                            }
                            BindDataMember();
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
            BindDataMember();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindDataMember();
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
                    System.Windows.Forms.MessageBox.Show("Member could not be created");
                }
            }
        }
    }
}