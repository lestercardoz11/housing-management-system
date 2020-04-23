<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMembers.aspx.cs" Inherits="HousingManagementSystem.Models.ManageMembers" %>

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

<script type="text/javascript">
    function CustomValidatorGender(source, args) {
        if (document.getElementById("<%= rbMale.ClientID %>").checked || document.getElementById("<%= rbFemale.ClientID %>").checked) {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }

        function CustomValidatorUser(source, args) {
            if (document.getElementById("<%= rbAdmin.ClientID %>").checked || document.getElementById("<%= rbMember.ClientID %>").checked) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }

        }
        }
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
                            <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Admin/ManageSociety.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="HOUSE" Value="HOUSE" NavigateUrl="~/Models/Admin/ManageHouse.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="MEMBERS" Value="MEMBERS" NavigateUrl="~/Models/Admin/ManageMembers.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="MESSAGES" Value="MESSAGES" NavigateUrl="~/Models/Admin/ManageComplaintsInbox.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#45E4E7" />
                        <StaticMenuItemStyle HorizontalPadding="20px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#45E4E7" />
                    </asp:Menu>
                </div>
            </div>
        </div>

        <div id="Main" style="height: 100%">
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
                            <asp:MenuItem Text="CREATE MEMBERS" Value="CREATE MEMBERS" NavigateUrl="~/Models/Admin/ManageMembers.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="MANAGE MEMBERS" Value="MANAGE MEMBERS" NavigateUrl="~/Models/Admin/ManageMembers1.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">CREATE MEMBERS</h1>
                        <br />
                        <asp:Table ID="Table1" runat="server" CssClass="table" Width="100%">
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Display Picture :
                            <br />
                                    <asp:FileUpload ID="fuImage" runat="server" CssClass="borderedTextbox" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    First Name :
                            <asp:RequiredFieldValidator ID="RFVFirstName" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbFirstName" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbFirstName" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Last Name :
                            <asp:RequiredFieldValidator ID="RFVLastName" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbLastName" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbLastName" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Date of Birth :
                            <asp:RequiredFieldValidator ID="RFVDOB" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbDOB" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbDOB" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Gender :
                            <asp:CustomValidator ID="CustomValidatorGender" runat="server" Display="Dynamic" ErrorMessage="*" ClientValidationFunction="CustomValidatorGender" OnServerValidate="CustomValidatorGender_Server" Font-Size="Small" ValidationGroup="BCreate" ForeColor="Red"></asp:CustomValidator>
                                    <br />
                                    <asp:Panel ID="PGender" runat="server" Width="80%" Style="padding: 3px; margin: 3px; margin-left: 0px;">
                                        <asp:RadioButton ID="rbMale" runat="server" GroupName="Gender" Width="49%" Text=" Male" />
                                        <asp:RadioButton ID="rbFemale" runat="server" GroupName="Gender" Width="49%" Text=" Female" />
                                    </asp:Panel>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Email :
                            <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbEmail" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbEmail" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RFVEmail1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="tbEmail" ErrorMessage="Invalid Email" ValidationGroup="BCreate" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Mobile Number :
                            <asp:RequiredFieldValidator ID="RFVMobile" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbMobile" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbMobile" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Alternate Mobile Number :
                            <br />
                                    <asp:TextBox ID="tbAlternateMobile" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Telephone Number :
                            <br />
                                    <asp:TextBox ID="tbTelephone" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Username :
                            <asp:RequiredFieldValidator ID="RFVUsername" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbUsername" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbUsername" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    User Type :
                            <asp:CustomValidator ID="CustomValidatorUser" runat="server" Display="Dynamic" ErrorMessage="*" ClientValidationFunction="CustomValidatorUser" OnServerValidate="CustomValidatorUser_Server" Font-Size="Small" ValidationGroup="BCreate" ForeColor="Red"></asp:CustomValidator>
                                    <br />
                                    <asp:Panel ID="PUser" runat="server" Width="80%" Style="padding: 3px; margin: 3px; margin-left: 0px;">
                                        <asp:RadioButton ID="rbAdmin" runat="server" GroupName="User" Width="49%" Text=" Admin" />
                                        <asp:RadioButton ID="rbMember" runat="server" GroupName="User" Width="49%" Text=" Member" />
                                    </asp:Panel>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Password :
                            <asp:RequiredFieldValidator ID="RFVPassword" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbPassword" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbPassword" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" Height="75px">
                                <asp:TableCell runat="server" Width="33%">
                                    Resident Card Number :
                            <asp:RequiredFieldValidator ID="RFVCardNumber" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbCardNumber" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbCardNumber" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%">
                                    Re-enter Password :
                            <asp:RequiredFieldValidator ID="RFVRPassword" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="tbRPassword" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:TextBox ID="tbRPassword" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell runat="server" Width="33%" Style="text-align: right" VerticalAlign="Bottom">
                                    <asp:Panel ID="PCreate" runat="server" Width="80%" BorderStyle="None">
                                        <asp:Button ID="BCreate" runat="server" Text="Create User" CssClass="Button" Width="75%" OnClick="BCreate_Click" ValidationGroup="BCreate" />
                                        <ajaxToolkit:ModalPopupExtender ID="BCreate_ModalPopupExtender" runat="server" BehaviorID="BCreate_ModalPopupExtender" TargetControlID="BDummy" PopupControlID="confirmPanel" BackgroundCssClass="confirmBackground">
                                        </ajaxToolkit:ModalPopupExtender>
                                    </asp:Panel>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        <div class="confirmPanel">
                            <asp:Panel ID="confirmPanel" runat="server" CssClass="confirmPanel shadow">
                                <br />
                                <h3 style="text-align: center; font: 400 large #494949">Member Created. Would you like to continue?</h3>
                                <div class="buttonWrapper" style="width: 100%; text-align: center; display: inline-block">
                                    <asp:Button ID="BNew" runat="server" Text="Create New Member" CssClass="Button" Width="250px" BackColor="#EEEEEE" ForeColor="#353736" OnClick="BNew_Click" />
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
                </div>
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>
