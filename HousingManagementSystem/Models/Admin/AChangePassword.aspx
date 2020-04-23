<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AChangePassword.aspx.cs" Inherits="HousingManagementSystem.Models.Admin.AChangePassword" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="~/Models/StyleSheet1.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
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
                    <asp:Button ID="BAccount" runat="server" Text="" CssClass="accountButton" Font-Size="Large" Font-Bold="True" Style="outline: none" OnClientClick="return false" />
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
                                <asp:MenuItem NavigateUrl="~/Models/Admin/AChangePassword.aspx" Text="Change Password" Value="Change Password" Selected="true"></asp:MenuItem>
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
                            <asp:MenuItem Text="DASHBOARD" Value="DASHBOARD" NavigateUrl="~/Models/Admin/AdminDashboard.aspx"></asp:MenuItem>
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
            <br />
            <br />
            <div class="sub1 shadow" style="border-radius: 10px;">
                <h1 style="color: #353736; font-size: larger">CHANGE PASSWORD</h1>
                <br />
                <asp:Table ID="Table1" runat="server" CssClass="table" Width="100%">
                    <asp:TableRow runat="server" Height="75px">
                        <asp:TableCell runat="server" Width="30%" Font-Size="Medium">
                        Old Password :
                        </asp:TableCell>
                        <asp:TableCell runat="server" Width="50%" Font-Size="Medium">
                            <asp:TextBox ID="tbOldPw" runat="server" CssClass="borderedTextbox" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" Height="75px" Font-Size="Medium">
                        <asp:TableCell runat="server" Width="30%">
                        New Password :
                        </asp:TableCell>
                        <asp:TableCell runat="server" Width="50%" Font-Size="Medium">
                            <asp:TextBox ID="tbNewPw" runat="server" CssClass="borderedTextbox" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" Height="75px">
                        <asp:TableCell runat="server" Width="30%" Font-Size="Medium">
                        Confirm Password :
                        </asp:TableCell>
                        <asp:TableCell runat="server" Width="50%" Font-Size="Medium">
                            <asp:TextBox ID="tbConfirmPw" runat="server" CssClass="borderedTextbox" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server" Height="75px">
                        <asp:TableCell runat="server" Width="30%" Font-Size="Medium">
                        </asp:TableCell>
                        <asp:TableCell runat="server" Width="50%" Font-Size="Medium">
                        *Password should be minimum eight characters.
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <br />
                <div class="buttonWrapper" style="width: 100%; text-align: center">
                    <asp:Button ID="BSubmit" runat="server" Text="Update" CssClass="Button" Width="15%" Style="margin: 0px 20px" OnClick="BSubmit_Click" />
                    <asp:Button ID="BClear" runat="server" Text="Clear" CssClass="Button" BackColor="#EEEEEE" ForeColor="#353736" Width="15%" Style="margin: 0px 20px" OnClick="BClear_Click" />
                </div>
            </div>
        </div>
        <br />
        <br />
    </form>
</body>
</html>

