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
    public partial class ManageHouse1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            retrieve();
            if (!IsPostBack)
            {
                BindDataHouse();
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

        protected void BindDataHouse()
        {
            try
            {
                GridView1.DataSourceID = null;
                GridView1.DataBind();
                SqlDataSource SqlDataSource1 = new SqlDataSource();
                SqlDataSource1.ID = "SqlDataSource1";
                this.Page.Controls.Add(SqlDataSource1);
                SqlDataSource1.ConnectionString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
                SqlDataSource1.SelectCommand = "SELECT * FROM [House]";
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
            BindDataHouse();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string CString = "Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411";
            string sql = SqlDataSourceHouse.DeleteCommand;
            using (SqlConnection cnn = new SqlConnection(CString))
            {
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    string ApartmentNo = (GridView1.Rows[e.RowIndex].FindControl("Label4") as System.Web.UI.WebControls.Label).Text.Trim();

                    cmd.Parameters.AddWithValue("@HID", id);

                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        string notiftype = "Apartment Deleted";
                        string notif = "Apartment Number " + ApartmentNo + " has been deleted.";
                        Notification(cnn, notiftype, notif);
                    }
                    else
                    {
                        System.Windows.Forms.MessageBox.Show("Apartment could not be deleted");
                    }
                    BindDataHouse();
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
                    sql = SqlDataSourceHouse.UpdateCommand;
                    try
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter();
                        using (SqlCommand cmd = new SqlCommand(sql, cnn))
                        {
                            cmd.Parameters.AddWithValue("@HID", id);

                            string UID = (GridView1.Rows[e.RowIndex].FindControl("tbUID") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@UID", UID);

                            string SID = (GridView1.Rows[e.RowIndex].FindControl("tbSID") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@SID", SID);

                            string ApartmentNo = (GridView1.Rows[e.RowIndex].FindControl("tbApartmentNo") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ApartmentNo", ApartmentNo);

                            string Wing = (GridView1.Rows[e.RowIndex].FindControl("tbWing") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Wing", Wing);

                            string ApartmentSize = (GridView1.Rows[e.RowIndex].FindControl("tbApartmentSize") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ApartmentSize", ApartmentSize);

                            string ApartmentType = (GridView1.Rows[e.RowIndex].FindControl("tbApartmentType") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@ApartmentType", ApartmentType);

                            string Bedrooms = (GridView1.Rows[e.RowIndex].FindControl("tbBedrooms") as System.Web.UI.WebControls.TextBox).Text.Trim();
                            cmd.Parameters.AddWithValue("@Bedrooms", Bedrooms);

                            string EntryDate = (GridView1.Rows[e.RowIndex].FindControl("tbEntryDate") as System.Web.UI.WebControls.TextBox).Text;
                            cmd.Parameters.AddWithValue("@EntryDate", EntryDate);

                            adapter.InsertCommand = cmd;

                            if (cmd.ExecuteNonQuery() == 1)
                            {
                                string notiftype = "Apartment Updated";
                                string notif = "Apartment Number " + ApartmentNo + " has been updated.";
                                Notification(cnn, notiftype, notif);
                            }
                            else
                            {
                                System.Windows.Forms.MessageBox.Show("Apartment could not be updated");
                            }
                            BindDataHouse();
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
            BindDataHouse();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindDataHouse();
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
                    System.Windows.Forms.MessageBox.Show("Apartment could not be created");
                }
            }
        }
    }
}