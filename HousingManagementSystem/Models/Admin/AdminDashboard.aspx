<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="HousingManagementSystem.Models.AdminDashboard" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html class="html" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="~/Models/StyleSheet1.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <style>
        .card {
            background-color:#FFFFFF;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            padding: 2% 5%;
            margin: 0% 5%;
        }

            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }
    </style>
</head>
<script>
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");;
    });
</script>
<body id="Body">
    <div class="se-pre-con"></div>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="Header">
            <div class="Heading">
                <asp:ImageButton runat="server" ID="ImageHeading" Height="80px" PostBackUrl="~/Models/Admin/AdminDashboard.aspx" Style="outline: none" ImageUrl="~/Images/Header.jpg"></asp:ImageButton>
            </div>
            <div class="Account">
                <div id="Login">
                    <asp:Button ID="BAccount" runat="server" Text="" CssClass="accountButton" Font-Size="Large" Font-Bold="True" OnClientClick="return false" Style="outline: none" />
                    <ajaxToolkit:DropDownExtender ID="BAccount_DropDownExtender" runat="server" BehaviorID="BAccount_DropDownExtender" DropDownControlID="PAccount" TargetControlID="BAccount" DropArrowBackColor="59, 109, 118" DropArrowWidth="2px" HighlightBackColor="59, 109, 118" HighlightBorderColor="59, 109, 118">
                    </ajaxToolkit:DropDownExtender>
                    <asp:Panel ID="PAccount" runat="server" CssClass="shadow" Style="width: auto; padding: 5px; margin-top: 10px; border-radius: 3px; background-color: white">
                        <asp:Menu ID="MAccount" runat="server" BackColor="White" DynamicHorizontalOffset="0" Font-Size="Medium" ForeColor="#3B6D76" StaticSubMenuIndent="0px" Width="100%" OnMenuItemClick="MAccount_MenuItemClick">
                            <DynamicHoverStyle BackColor="White" />
                            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" Width="200px" />
                            <DynamicMenuStyle BackColor="White" />
                            <DynamicSelectedStyle BackColor="White" />
                            <Items>
                                <asp:MenuItem Text="Profile" Value="Profile" NavigateUrl="~/Models/Admin/AdminProfile.aspx"></asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/Models/Admin/AChangePassword.aspx" Text="Change Password" Value="Change Password"></asp:MenuItem>
                                <asp:MenuItem Text="Log Out" Value="Log Out"></asp:MenuItem>
                            </Items>
                            <StaticHoverStyle BackColor="White" />
                            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" Width="200px" />
                            <StaticSelectedStyle BackColor="White" />
                        </asp:Menu>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Menu ID="MenuBar" runat="server" BackColor="#45E4E7" DynamicHorizontalOffset="0" Width="100%" Font-Size="20px" Font-Bold="true" ForeColor="#FFFFFF" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False" Height="30px">
                        <DynamicHoverStyle BackColor="#45E4E7" />
                        <DynamicMenuItemStyle HorizontalPadding="2px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#45E4E7" />
                        <DynamicSelectedStyle BackColor="#45E4E7" />
                        <Items>
                            <asp:MenuItem Text="DASHBOARD" Value="DASHBOARD" NavigateUrl="~/Models/Admin/AdminDashboard.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Admin/ManageSociety.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="HOUSE" Value="HOUSE" NavigateUrl="~/Models/Admin/ManageHouse.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="MEMBERS" Value="MEMBERS" NavigateUrl="~/Models/Admin/ManageMembers.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="MESSAGES" Value="MESSAGES" NavigateUrl="~/Models/Admin/ManageComplaintsInbox.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#45E4E7" />
                        <StaticMenuItemStyle HorizontalPadding="20px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#45E4E7" />
                    </asp:Menu>
                </div>
            </div>
        </div>

        <div id="Main">
            <div class="MainMenu">
                <div class="leftMenu" style="min-height: 100vh">
                    <br />
                    <asp:Label ID="MenuName" runat="server" Text="ADMIN" Font-Size="24px" Font-Bold="True" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <div style="width: 80%" class="card">
                        <div>
                            <h4>
                                <asp:Label ID="Label1" runat="server" Text="Number Of Societies:" ForeColor="#3B6D76"></asp:Label></h4>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="#3B6D76"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div style="width: 80%" class="card">
                        <div>
                            <h4>
                                <asp:Label ID="Label3" runat="server" Text="Number Of Residents:" ForeColor="#3B6D76"></asp:Label></h4>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="#3B6D76"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div style="width: 80%" class="card">
                        <div>
                            <h4>
                                <asp:Label ID="Label5" runat="server" Text="New Complaints:" ForeColor="#3B6D76"></asp:Label></h4>
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="#3B6D76"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div style="width: 80%" class="card">
                        <div>
                            <h4>
                                <asp:Label ID="Label7" runat="server" Text="Guest Visitors:" ForeColor="#3B6D76"></asp:Label></h4>
                            <p>
                                <asp:Label ID="Label8" runat="server" Text="" Font-Bold="true" Font-Size="X-Large" ForeColor="#3B6D76"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">NOTIFICATIONS</h1>
                        <br />
                        <asp:Panel ID="PanelDiv" runat="server" Height="100%">
                            <div style="z-index: 20; padding: 20px;">
                                <h3 style="text-align: center">You have no notifications.</h3>
                            </div>
                        </asp:Panel>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceNotifications" OnDataBound="ListView1_DataBound">
                            <ItemTemplate>
                                <asp:Panel ID="panelNotif" CssClass="panelHover" runat="server" Style="width: auto; overflow: hidden">
                                    <div class="flexWrapper" style="width: 100%; height: auto; border-bottom: 1px solid #808080">
                                        <div style="width: 5%; height: inherit; display: inline-flex; padding: 10px;">
                                            <asp:Label ID="lblTime" runat="server" Text='<%# Convert.ToDateTime(Eval("EntryDate")).ToString("hh:MM") %>' CssClass="Label" Font-Size="Medium" Style="margin: 0px 2.5px"></asp:Label>
                                        </div>
                                        <div style="width: 20%; height: inherit; display: inline-flex; padding: 10px;">
                                            <asp:Label ID="lblSubjectName" runat="server" Text='<%# Eval("Notiftype") %>' CssClass="Label" Font-Size="Large" Style="margin: 0px 5px"></asp:Label>
                                        </div>
                                        <div style="width: 55%; height: auto; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding: 10px;">
                                            <p style="width: auto; font: 400 large 'Microsoft Sans Serif'; color: #808080; display: inline; margin: 0px 2.5px"><%# Eval("Notification") %></p>
                                        </div>
                                        <div style="width: auto; height: inherit; padding: 10px;">
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Convert.ToDateTime(Eval("EntryDate")).ToString("dd / MM / yyyy") %>' CssClass="Label" Font-Size="Medium" Style="margin: 0px 2.5px"></asp:Label>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSourceNotifications" runat="server" ConnectionString="<%$ ConnectionStrings:HousingMSdbConnectionString %>" SelectCommand="SELECT Notifications.*, Users.* FROM Notifications INNER JOIN Users ON Notifications.UID = Users.UID WHERE (Notifications.Usertype = @Usertype) ORDER BY Notifications.EntryDate DESC" OnSelecting="SqlDataSourceNotifications_Selecting">
                            <SelectParameters>
                                <asp:Parameter Name="Usertype" Type="Char" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
