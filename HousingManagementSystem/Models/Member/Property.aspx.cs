using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HousingManagementSystem.Models.Member
{
    public partial class Properties : System.Web.UI.Page
    {
        int UID;
        char UT;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
                Response.Redirect("~/Models/Home/Homepage.aspx");

            retrieve();
        }

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
                    UID = int.Parse(dr["UID"].ToString());
                    UT = Convert.ToChar(dr["Usertype"].ToString());
                }
            }
            BAccount.Text = name;
        }

        public char rent(int HID)
        {
            char value;
            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT COUNT(1) FROM Rent WHERE HID = @HID";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@HID", SqlDbType.NVarChar, 50).Value = HID;

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 1)
                {
                    value = '1';
                }
                else
                {
                    value = '0';
                }
            }
            return value;
        }

        public char sell(int HID)
        {
            char value;

            using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
            {
                cnn.Open();
                string sql = "SELECT COUNT(1) FROM Sell WHERE HID = @HID";
                SqlCommand cmd = new SqlCommand(sql, cnn);
                cmd.Parameters.Add("@HID", SqlDbType.NVarChar, 50).Value = HID;

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 1)
                {
                    value = '1';
                }
                else
                {
                    value = '0';
                }
            }
            return value;
        }


        protected void MAccount_MenuItemClick(object sender, System.Web.UI.WebControls.MenuEventArgs e)
        {
            if (e.Item.Text == "Log Out")
            {
                Session.Abandon();
                Response.Redirect("~/Models/Home/Homepage.aspx");
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@UID"].Value = UID;
        }

        public int RetrieveSID(int HID, SqlConnection cnn)
        {
            string sql = "SELECT * FROM House WHERE HID = @HID";
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cnn.Open();
                int SID = new int();
                cmd.Parameters.Add("@HID", SqlDbType.NVarChar, 50).Value = HID;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    SID = int.Parse(dr["SID"].ToString());
                }
                cnn.Close();
                return SID;
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

        protected void ConfirmData_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {
                string commandName = e.CommandName;
                object commandArg = e.CommandArgument;
                ListViewItem selectedItem = e.Item;
                int dataItemIndex = selectedItem.DataItemIndex;
                int HID = Convert.ToInt32(commandArg);

                if (commandName == "RentApartment")
                {
                    Session["HID"] = HID;
                    Response.Redirect("~/Models/Member/PropertyRent.aspx");
                }
                else if (commandName == "SellApartment")
                {
                    Session["HID"] = HID;
                    Response.Redirect("~/Models/Member/PropertySell.aspx");
                }
                else if (commandName == "DeleteRent")
                {
                    Label Apartment = (Label)e.Item.FindControl("lblApartmentNo");

                    if (Page.IsValid)
                    {
                        string sql = null;
                        try
                        {
                            SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411");
                            cnn.Open();

                            sql = "DELETE FROM Rent WHERE HID=@HID; DBCC CHECKIDENT ('Rent', RESEED, 0);";

                            using (SqlCommand cmd = new SqlCommand(sql, cnn))
                            {
                                cmd.Parameters.Add("@HID", SqlDbType.Int).Value = HID;


                                if (cmd.ExecuteNonQuery() == 1)
                                {
                                    string notiftype = "Property Rent Ad";
                                    string notif = "Apartment " + Apartment.Text + " Rent Ad has been deleted.";
                                    Notification(cnn, notiftype, notif);
                                    Response.Redirect(Request.RawUrl, false);
                                }
                                else
                                {
                                    System.Windows.Forms.MessageBox.Show("Rent could not be deleted, please try again.");
                                }
                            }

                        }
                        catch (System.Data.SqlClient.SqlException sqlException)
                        {
                            System.Windows.Forms.MessageBox.Show("SQL: " + sqlException.Message);
                        }
                    }
                }
                else if (commandName == "DeleteSell")
                {
                    Label Apartment = (Label)e.Item.FindControl("lblApartmentNo");

                    if (Page.IsValid)
                    {
                        string sql = null;
                        try
                        {
                            SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411");
                            cnn.Open();

                            sql = "DELETE FROM Sell WHERE HID=@HID; DBCC CHECKIDENT ('Sell', RESEED, 0);";

                            using (SqlCommand cmd = new SqlCommand(sql, cnn))
                            {
                                cmd.Parameters.Add("@HID", SqlDbType.Int).Value = HID;

                                if (cmd.ExecuteNonQuery() == 1)
                                {
                                    string notiftype = "Property Sale Ad";
                                    string notif = "Apartment " + Apartment.Text + " Sale Ad has been deleted.";
                                    Notification(cnn, notiftype, notif);
                                    Response.Redirect(Request.RawUrl, false);
                                }
                                else
                                {
                                    System.Windows.Forms.MessageBox.Show("Sale could not be deleted, please try again.");
                                }
                            }

                        }
                        catch (System.Data.SqlClient.SqlException sqlException)
                        {
                            System.Windows.Forms.MessageBox.Show("SQL: " + sqlException.Message);
                        }
                    }
                }
                else if (commandName == "Images")
                {

                }
            }
            catch (FormatException)
            {
                System.Windows.Forms.MessageBox.Show("Please enter the price.");
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            try
            {
                ListViewDataItem dataItem = (ListViewDataItem)e.Item;
                int i = dataItem.DisplayIndex;
                int HID = (int)ListView1.DataKeys[i]["HID"];
                if (e.Item.ItemType == ListViewItemType.DataItem)
                {
                    char Rent = rent(HID);
                    char Sell = sell(HID);

                    Image Image1 = (Image)e.Item.FindControl("Image1");
                    try
                    {
                        using (SqlConnection cnn = new SqlConnection("Data Source = JARVIS; Initial Catalog = HousingMSdb; User ID = sa; Password = 2411"))
                        {
                            cnn.Open();
                            string sql = "SELECT * FROM dbo.House";
                            SqlCommand cmd = new SqlCommand(sql, cnn);

                            SqlDataReader dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                if (!Convert.IsDBNull(dr["Image"]))
                                {
                                    byte[] displaypicture = (byte[])dr["Image"];
                                    string img = Convert.ToBase64String(displaypicture, 0, displaypicture.Length);
                                    Image1.ImageUrl = "data:Image/png;base64, " + img;
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


                    Button BRent = (Button)e.Item.FindControl("BRent");
                    Button BRentDelete = (Button)e.Item.FindControl("BRentDelete");

                    Button BSell = (Button)e.Item.FindControl("BSell");
                    Button BSellDelete = (Button)e.Item.FindControl("BSellDelete");

                    if (Rent == '1')
                    {
                        BRent.CssClass = "hidden";
                    }
                    else
                    {
                        BRentDelete.CssClass = "hidden";
                    }

                    if (Sell == '1')
                    {
                        BSell.CssClass = "hidden";
                    }
                    else
                    {
                        BSellDelete.CssClass = "hidden";
                    }
                }
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        public void Notification(SqlConnection cnn, string notiftype, string notif)
        {
            char usertype = UT;
            string sql = "INSERT INTO Notifications ([UID], [Usertype], [Notiftype], [Notification], [EntryDate]) values(@UID, @Usertype, @Notiftype, @Notification, @EntryDate)";
            SqlDataAdapter adapter = new SqlDataAdapter();
            using (SqlCommand cmd = new SqlCommand(sql, cnn))
            {
                cmd.Parameters.Add("@UID", SqlDbType.Int).Value = UID;
                cmd.Parameters.Add("@Usertype", SqlDbType.Char, 1).Value = usertype;
                cmd.Parameters.Add("@Notiftype", SqlDbType.NVarChar, 50).Value = notiftype;
                cmd.Parameters.Add("@Notification", SqlDbType.NVarChar, 500).Value = notif;
                cmd.Parameters.Add("@EntryDate", SqlDbType.DateTime).Value = DateTime.Now;
                adapter.InsertCommand = cmd;
                if (cmd.ExecuteNonQuery() != 1)
                {
                    System.Windows.Forms.MessageBox.Show("Error");
                }
            }
        }
    }
}