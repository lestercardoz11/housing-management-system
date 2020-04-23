<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSociety.aspx.cs" Inherits="HousingManagementSystem.Models.ManageSociety" %>

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
                            <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Admin/ManageSociety.aspx" Selected="true"></asp:MenuItem>
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
                    <asp:Label ID="MenuName" runat="server" Text="MEMBERS" Font-Size="24px" Font-Bold="true" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="2" Width="100%" Font-Size="20px" Font-Bold="true" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False">
                        <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="CREATE SOCIETY" Value="CREATE SOCIETY" NavigateUrl="~/Models/Admin/ManageSociety.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="MANAGE SOCIETY" Value="MANAGE SOCIETY" NavigateUrl="~/Models/Admin/ManageSociety1.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">CREATE SOCIETY</h1>
                        <br />
                        <asp:Table ID="Table1" runat="server" CssClass="table" Width="100%">
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Society Name :
                                        <asp:RequiredFieldValidator ID="RFVSociety" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbSociety" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbSociety" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Project Size :
                                        <asp:RequiredFieldValidator ID="RFVSize" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbSize" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbSize" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Project Area :
                                        <asp:RequiredFieldValidator ID="RFVArea" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbArea" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbArea" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Project Status :
                                        <asp:RequiredFieldValidator ID="RFVStatus" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="ddlStatus" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="borderedTextbox" Height="26px">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Ready to Move</asp:ListItem>
                                        <asp:ListItem>Under Construction</asp:ListItem>
                                    </asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Launch Date :
                                        <asp:RequiredFieldValidator ID="RFVLaunch" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbLaunch" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbLaunch" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Society Images :
                                        <br />
                                    <asp:FileUpload ID="fuImage" runat="server" CssClass="borderedTextbox" AllowMultiple="true" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Country :
                                        <asp:RequiredFieldValidator ID="RFVCountry" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbCountry" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbCountry" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Address :
                                        <asp:RequiredFieldValidator ID="RFVAddress" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbAddress" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbAddress" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    City :
                                        <asp:RequiredFieldValidator ID="RFVCity" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbCity" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbCity" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Pincode :
                                        <asp:RequiredFieldValidator ID="RFVPincode" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbPincode" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbPincode" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Developer Name :
                                        <asp:RequiredFieldValidator ID="RFVDeveloperName" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbDeveloperName" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbDeveloperName" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Contact Number :
                                        <asp:RequiredFieldValidator ID="RFVContactNumber" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbContactNumber" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbContactNumber" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Amenities :
                                        <br />
                                    <asp:CheckBoxList ID="cblAmentities1" runat="server">
                                        <asp:ListItem>Gymnasium</asp:ListItem>
                                        <asp:ListItem>Jogging Track</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <br />
                                    <asp:CheckBoxList ID="cblAmentities2" runat="server">
                                        <asp:ListItem>Lift</asp:ListItem>
                                        <asp:ListItem>24x7 Security</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    <br />
                                    <asp:CheckBoxList ID="cblAmentities3" runat="server">
                                        <asp:ListItem>Children's Play Area</asp:ListItem>
                                        <asp:ListItem>Swimming Pool</asp:ListItem>
                                    </asp:CheckBoxList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%"> </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%" Style="text-align: right" VerticalAlign="Bottom">
                                    <asp:Panel ID="PCreate" runat="server" Width="80%" BorderStyle="None">
                                        <asp:Button ID="bCreate" runat="server" Text="Create Society" CssClass="Button" Width="75%" OnClick="BCreate_Click" ValidationGroup="BCreate" />
                                        <ajaxToolkit:ModalPopupExtender ID="BCreate_ModalPopupExtender" runat="server" BehaviorID="BCreate_ModalPopupExtender" TargetControlID="BDummy" PopupControlID="confirmPanel" BackgroundCssClass="confirmBackground">
                                        </ajaxToolkit:ModalPopupExtender>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <div>
                        </div>
                        <div class="confirmPanel">
                            <asp:Panel ID="confirmPanel" runat="server" CssClass="confirmPanel shadow">
                                <br />
                                <h3 style="text-align: center; font: 400 large #494949">Society Created. Would you like to continue?</h3>
                                <div class="buttonWrapper" style="width: 100%; text-align: center; display: inline-block">
                                    <asp:Button ID="BNew" runat="server" Text="Create New Society" CssClass="Button" Width="250px" BackColor="#EEEEEE" ForeColor="#353736" OnClick="BNew_Click" />
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
    </form>
</body>
</html>
