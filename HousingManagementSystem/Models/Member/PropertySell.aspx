<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PropertySell.aspx.cs" Inherits="HousingManagementSystem.Models.Member.PropertySell" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                            <asp:MenuItem NavigateUrl="~/Models/Member/Property.aspx" Text="PROPERTY" Value="PROPERTY" Selected="true"></asp:MenuItem>
                            <asp:MenuItem NavigateUrl="~/Models/Member/Complaints.aspx" Text="COMPLAINTS" Value="COMPLAINTS"></asp:MenuItem>
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
                </div>
                <div class="rightMain" style="width: 60%; min-height: 100vh">
                    <div style="border: 1px solid #335252; padding: 10px; margin: 10px;">
                        <h3>Do you want to put your property on sale?</h3>
                        <br />
                        <div class="flexWrapper" style="height: auto; width: 100%">
                            <div style="width: 45%; padding: 15px">
                                <h4>Enter the selling price: </h4>
                                <asp:TextBox ID="TextBoxPrice" runat="server" CssClass="borderedTextbox" AutoCompleteType="Disabled"></asp:TextBox>
                            </div>
                            <div style="width: 45%; padding: 15px">
                                <h4>Upload pictures of your property:</h4>
                                <asp:FileUpload ID="FileUploadProperty" runat="server" CssClass="borderedTextbox" AllowMultiple="true" />
                            </div>
                        </div>
                        <asp:Panel ID="panelProperty" class="flexWrapper" runat="server" Style="height: auto; width: 100%; overflow: hidden">
                            <div style="padding: 10px; min-width: 0px; width: 20%; vertical-align: middle; text-align: center; overflow: hidden">
                                <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" ImageUrl="~/Images/homelogo.jpg" Style="padding: 10px 10px" />
                            </div>
                            <div style="width: 65%; padding: 5px; margin: 20px; height: inherit">
                                <div style="padding-left: 10px">
                                    <div class="flexWrapper" style="padding: 10px 10px">
                                        <div style="width: 70%">
                                            <asp:Label ID="lblBedrooms" runat="server" Text="" CssClass="Label" Font-Bold="true"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text=" Apartment" CssClass="Label" Font-Bold="true"></asp:Label>
                                            <asp:Label ID="Label2" runat="server" Text=" in " CssClass="Label"></asp:Label>
                                            <asp:Label ID="lblSociety" runat="server" Text="" CssClass="Label"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblCity" runat="server" Text="" CssClass="Label"></asp:Label>
                                            <asp:Label ID="Label3" runat="server" Text=", " CssClass="Label"></asp:Label>
                                            <asp:Label ID="lblCountry" runat="server" Text="" CssClass="Label"></asp:Label>
                                        </div>
                                        <div style="width: auto">
                                            <asp:Label ID="lblApartmentSize" runat="server" Text="" CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblApartmentSize1" runat="server" Text="sq/ft" CssClass="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="flexWrapper" style="border-bottom: 1px solid #808080; border-top: 1px solid #808080; padding: 10px 10px">
                                        <div style="width: 35%">
                                            <asp:Label ID="lblWing" runat="server" Text="" CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblWing1" runat="server" Text="Wing" CssClass="Label"></asp:Label>
                                        </div>
                                        <div style="width: 35%">
                                            <asp:Label ID="lblApartmentNo" runat="server" Text="" CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblApartmentNo1" runat="server" Text="Apartment No." CssClass="Label"></asp:Label>
                                        </div>
                                        <div style="width: auto">
                                            <asp:Label ID="lblApartmentType" runat="server" Text="" CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label5" runat="server" Text="Apartment Type" CssClass="Label"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="flexWrapper" style="padding: 10px 10px">
                                        <div style="width: 35%">
                                            <asp:Label ID="lblStatus" runat="server" Text="" CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblStatus1" runat="server" Text="Property Status" CssClass="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="buttonWrapper" style="text-align: initial; width: auto">
                            <asp:Button ID="BSell" runat="server" Text="Sell" CssClass="Button" BackColor="#FF2020" OnClick="BSell_Click" Style="border-radius: 1px" />
                        </div>
                    </div>
                </div>
                <div class="leftMenu" style="min-height: 100vh">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
