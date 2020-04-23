<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Messages1.aspx.cs" Inherits="HousingManagementSystem.Models.Member.Messages1" %>

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
                <asp:ImageButton runat="server" ID="ImageHeading" Height="80px" PostBackUrl="~/Models/Member/MemberDashBoard.aspx" Style="outline: none" ImageUrl="~/Images/Header.jpg"></asp:ImageButton>
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
                                <asp:MenuItem Text="Profile" Value="Profile" NavigateUrl="~/Models/Member/MemberProfile.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="Change Password" Value="Change Password" NavigateUrl="~/Models/Member/MChangePassword.aspx"></asp:MenuItem>
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
                            <asp:MenuItem NavigateUrl="~/Models/Member/MemberDashBoard.aspx" Text="DASHBOARD" Value="DASHBOARD"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Models/Member/Property.aspx" Text="PROPERTY" Value="PROPERTY"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Models/Member/Complaints.aspx" Text="COMPLAINTS" Value="COMPLAINTS"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Models/Member/Messages.aspx" Text="MESSAGES" Value="MESSAGES" Selected="true"></asp:MenuItem>
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
                    <asp:Label ID="MenuName" runat="server" Text="MESSAGES" Font-Size="24px" Font-Bold="true" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="0" Width="100%" Font-Size="20px" Font-Bold="true" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False">
                        <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="INBOX" Value="INBOX" NavigateUrl="~/Models/Member/Messages.aspx" Selected="true"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <asp:Panel ID="Panel1" runat="server" Style="padding: 15px; border: 1px solid #808080; width: auto">
                            <div style="border-bottom: 1px solid #494949; padding: 10px">
                                <asp:Label ID="LabelSubject" runat="server" Text="" Font-Size="XX-Large" ForeColor="#494949"></asp:Label>
                            </div>
                            <br />
                            <div style="padding: 10px">
                                <asp:Label ID="LabelName1" runat="server" Text="Name : " CssClass="Label" Width="100px"></asp:Label>
                                <asp:Label ID="LabelName" runat="server" Text="" Font-Size="Large" ForeColor="#494949" Width="200px" Style="margin-left: 20px"></asp:Label>
                                <asp:Label ID="LabelCity1" runat="server" Text="City : " CssClass="Label" Width="100px" Style="margin-left: 200px"></asp:Label>
                                <asp:Label ID="LabelCity" runat="server" Text="" Font-Size="Large" ForeColor="#494949" Width="200px" Style="margin-left: 20px"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelEmail1" runat="server" Text="Email : " CssClass="Label" Width="100px"></asp:Label>
                                <asp:Label ID="LabelEmail" runat="server" Text="" Font-Size="Large" ForeColor="#494949" Width="200px" Style="margin-left: 20px"></asp:Label>
                                <asp:Label ID="LabelMobile1" runat="server" Text="Mobile : " CssClass="Label" Width="100px" Style="margin-left: 200px"></asp:Label>
                                <asp:Label ID="LabelMobile" runat="server" Text="" Font-Size="Large" ForeColor="#494949" Width="200px" Style="margin-left: 20px"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="LabelApartment1" runat="server" Text="Apartment : " CssClass="Label" Width="100px"></asp:Label>
                                <asp:Label ID="LabelApartment" runat="server" Text="" Font-Size="Large" ForeColor="#494949" Width="200px" Style="margin-left: 20px"></asp:Label>
                            </div>
                            <div style="padding: 10px">
                                <asp:Label ID="LabelEntryDate" runat="server" Text="" Font-Size="Medium" ForeColor="#808080" Style="float: right"></asp:Label>
                            </div>
                            <br />
                            <div style="background-color: #F3F3F3; height: 100px; overflow-y: scroll; padding: 10px;">
                                <asp:Label ID="LabelMessage" runat="server" Text="" Font-Size="Large" ForeColor="#494949" Style="text-align: left"></asp:Label>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
