<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="HousingManagementSystem.Models.Member.Complains" %>

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
                            <asp:MenuItem NavigateUrl="~/Models/Member/Complaints.aspx" Text="COMPLAINTS" Value="COMPLAINTS" Selected="true"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Models/Member/Messages.aspx" Text="MESSAGES" Value="MESSAGES"></asp:MenuItem>
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
                    <asp:Label ID="MenuName" runat="server" Text="COMPLAINTS" Font-Size="24px" Font-Bold="true" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="0" Width="100%" Font-Size="20px" Font-Bold="true" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False">
                        <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="MAKE A COMPLAINT" Value="COMPLAINT" NavigateUrl="~/Models/Member/Complaints.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="INBOX" Value="INBOX" NavigateUrl="~/Models/Member/ComplaintsReply.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">MAKE A COMPLAINT</h1>
                        <br />
                        <div style="padding: 0px 200px;">
                            <asp:RequiredFieldValidator ID="RFVSubject" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbSubject" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtbSubject" runat="server" CssClass="bottomlineTextbox" placeholder="  Subject" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                            <br />
                            <br />
                            <br />
                            <asp:RequiredFieldValidator ID="RFVMessage" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="TextBoxMessage" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="TextBoxMessage" runat="server" CssClass="bottomlineTextboxMessage" placeholder="  Message" AutoCompleteType="Disabled" TextMode="MultiLine" Height="75px" Width="100%"></asp:TextBox>
                        </div>
                        <br />
                        <br />
                        <div style="text-align: right; padding: 0px 200px;">
                            <asp:Button ID="BSubmit" runat="server" Text="Submit" Font-Size="X-Large" CssClass="Button" Width="300px" OnClick="BSubmit_Click" ValidationGroup="BSubmit" />
                            <ajaxToolkit:ModalPopupExtender ID="BSubmit_ModalPopupExtender" runat="server" BehaviorID="BSubmit_ModalPopupExtender" TargetControlID="BDummy" PopupControlID="confirmPanel" BackgroundCssClass="confirmBackground">
                            </ajaxToolkit:ModalPopupExtender>
                            <div class="confirmPanel">
                                <asp:Panel ID="confirmPanel" runat="server" CssClass="confirmPanel shadow">
                                    <br />
                                    <h3 style="text-align: center; font: 400 large #494949">Complaint Registered. Would you like to continue?</h3>
                                    <div class="buttonWrapper" style="width: 100%; text-align: center; display: inline-block">
                                        <asp:Button ID="BNew" runat="server" Text="Make New Complaint" CssClass="Button" Width="250px" BackColor="#EEEEEE" ForeColor="#353736" OnClick="BNew_Click" />
                                        <br />
                                        <br />
                                        <asp:Button ID="BHome" runat="server" Text="Return Home" CssClass="Button" Width="200px" OnClick="BHome_Click" />
                                    </div>
                                </asp:Panel>
                            </div>
                            <span style="display: none">
                                <asp:LinkButton ID="BDummy" runat="server">LinkButton</asp:LinkButton>
                            </span>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
