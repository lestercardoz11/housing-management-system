<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="HousingManagementSystem.Models.Admin.EditProfile" %>

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
                                <asp:MenuItem Text="Profile" Value="Profile" NavigateUrl="~/Models/Admin/AdminProfile.aspx" Selected="true"></asp:MenuItem>
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
            <div class="MainMenu">
                <div class="leftMenu" style="min-height: 100vh">
                    <br />
                    <asp:Label ID="MenuName" runat="server" Text="PROFILE" Font-Size="24px" Font-Bold="True" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="0" Width="100%" Font-Size="20px" Font-Bold="true" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False">
                        <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="PROFILE" Value="PROFILE" NavigateUrl="~/Models/Admin/AdminProfile.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="EDIT PROFILE" Value="EDIT PROFILE" NavigateUrl="~/Models/Admin/AdminEditProfile.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">PROFILE</h1>
                        <br />
                        <div style="outline: none; text-align: right">
                            <asp:Label ID="lblTerms" runat="server" Text="*Some details can only be updated by the admin." Visible="false" ForeColor="#353736" Font-Size="Small" Style="margin-right: 10px"></asp:Label>
                        </div>
                        <br />
                        <asp:Table ID="Table1" runat="server" CssClass="table" Width="100%" Font-Size="Medium" Style="border-bottom: 1px solid #AAAAAA;">
                            <asp:TableRow runat="server" Height="100px" VerticalAlign="Top">
                                <asp:TableCell runat="server" Width="33%" Font-Bold="true" Font-Size="Large" ForeColor="#AAAAAA">ACCOUNT DETAILS</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:Image ID="ImageDisplay" runat="server" Height="100px" ImageAlign="Middle" ImageUrl="~/Images/ProfilePicture.png" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Username :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbUsername" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">User Type :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbUser" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Table ID="Table2" runat="server" CssClass="table" Width="100%" Font-Size="Medium" Style="border-bottom: 1px solid #AAAAAA;">
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%" Font-Bold="true" Font-Size="Large" ForeColor="#AAAAAA">PERSONAL DETAILS</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Full Name: </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbName" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Date of Birth :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbDOB" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Gender :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbGender" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Resident Card Number :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbCardNumber" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <asp:Table ID="Table3" runat="server" CssClass="table" Width="100%" Font-Size="Medium">
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%" Font-Bold="true" Font-Size="Large" ForeColor="#AAAAAA">CONTACT DETAILS</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Email :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbEmail" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Mobile Number :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbMobile" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Alternate Mobile Number :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbAlternateMobile" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="50px">
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">Telephone Number :</asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <asp:TextBox ID="tbTelephone" runat="server" CssClass="borderedTextbox noborder larger" ReadOnly="true"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
