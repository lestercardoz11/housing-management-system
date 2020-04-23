<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="HousingManagementSystem.Models.ContactUs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)" />
    <link rel="Stylesheet" href="~/Models/StyleSheet1.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            background-color:#faf9f9;
            transition: 0.3s;
            width: 40%;
        }

            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

        .container {
            padding: 2px 16px;
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
                <asp:ImageButton runat="server" ID="ImageHeading" Height="80px" PostBackUrl="~/Models/Home/Homepage.aspx" Style="outline: none" ImageUrl="~/Images/Header.jpg"></asp:ImageButton>
            </div>
            <div class="Account">
                <asp:Button ID="BAccount" runat="server" Text="LOG IN" CssClass="loginButton"/>
                <ajaxToolkit:ModalPopupExtender ID="BAccount_ModalPopupExtender" runat="server" BehaviorID="BAccount_ModalPopupExtender" TargetControlID="BAccount" CancelControlID="ImageX" PopupControlID="PanelLogin" BackgroundCssClass="popupBackground">
                </ajaxToolkit:ModalPopupExtender>
                <div id="Login">
                    <asp:Panel ID="PanelLogin" runat="server" CssClass="panelLogin shadow">
                        <div>
                            <div style="width: 100%; text-align: right; display: inline-block; margin: 0px;">
                                <asp:ImageButton ID="ImageX" runat="server" ImageUrl="~/Images/X.jpg" Width="20px" />
                            </div>
                            <div class="sub" style="border-style: none; text-align: center">
                                <div id="Usertype">
                                    <label class="rbClass">
                                        <input id="rbAdmin" runat="server" type="radio" name="toggle" /><span>Admin</span></label>
                                    <label class="rbClass">
                                        <input id="rbMember" runat="server" type="radio" name="toggle" /><span>Member</span></label>
                                </div>
                            </div>
                            <br />
                            <h3>LOG IN TO YOUR ACCOUNT</h3>
                            <br />
                            <br />
                            <asp:Panel ID="Panel1" runat="server" CssClass="sub">
                                <asp:TextBox ID="TxtUsername" runat="server" Width="100%" AutoCompleteType="Disabled" CssClass="bottomlineTextbox" placeholder="Username"></asp:TextBox>
                                <br />
                                <br />
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div style="text-align: center">
                                            <asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator" runat="server" ErrorMessage="Enter Username." CssClass="class1" Font-Size="Small" ForeColor="Red" ControlToValidate="TxtPw" EnableClientScript="False" ValidationGroup="LOGIN"></asp:RequiredFieldValidator>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" CssClass="sub">
                                <asp:TextBox ID="TxtPw" runat="server" Width="100%" TextMode="Password" AutoCompleteType="Disabled" CssClass="bottomlineTextbox" placeholder="Password"></asp:TextBox>
                            </asp:Panel>
                            <br />
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel3" runat="server" CssClass="sub" Style="text-align: center">
                                        <asp:Label ID="LabelIncorrectP" runat="server" Text="" Font-Size="Small" ForeColor="Red" CssClass="class1"></asp:Label>
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <asp:Panel ID="Panel4" runat="server" CssClass="sub">
                                <div class="buttonWrapper">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="BLogIn" runat="server" Text="LOGIN" OnClick="BLogIn_Click" ValidationGroup="LOGIN" CssClass="Button" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </asp:Panel>
                            <br />
                            <br />
                        </div>
                    </asp:Panel>
                    <br />
                    <br />
                    <asp:Menu ID="MenuBar" runat="server" BackColor="#45E4E7" DynamicHorizontalOffset="0" Width="100%" Font-Size="20px" ForeColor="#FFFFFF" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False" Height="30px" Font-Bold="True">
                        <DynamicHoverStyle BackColor="#45E4E7"/>
                        <DynamicMenuItemStyle HorizontalPadding="2px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#45E4E7" />
                        <DynamicSelectedStyle BackColor="#45E4E7" />
                        <Items>
                            <asp:MenuItem Text="HOME" Value="HOME" NavigateUrl="~/Models/Home/Homepage.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Home/Society.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="FOR RENT" Value="FOR RENT" NavigateUrl="~/Models/Home/ForRent.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="FOR SALE" Value="FOR SALE" NavigateUrl="~/Models/Home/ForSale.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="CONTACT US" Value="CONTACT US" NavigateUrl="~/Models/Home/ContactUs.aspx" Selected="true"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#45E4E7"/>
                        <StaticMenuItemStyle HorizontalPadding="20px" VerticalPadding="2px" />
                        <StaticSelectedStyle BackColor="#45E4E7" />
                    </asp:Menu>
                </div>
            </div>
        </div>

        <div id="Main" style="text-align: center">
            <div class="sub1">
                <br />
                <h1 style="font-size: xx-large; color: #494949">CONTACT US</h1>
                <br />
                <br />
                <div class="flexWrapper" style="margin: 0 50px;">
                    <div style="width: 30%; margin: 0 2% 0 1.5%" class="card">
                        <br />
                        <br />
                        <div style="text-align: center; display: inline-block">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~\Images\icon1.png" Width="50px" />
                        </div>
                        <br />
                        <br />
                        <div class="container" style="text-align: center; display: inline-block">
                            <h4><b>
                                <asp:Label ID="Label1" runat="server" Text="+968 24707727"></asp:Label></b></h4>
                            <p>
                                <asp:Label ID="Label2" runat="server" Text="Support 24/7"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div style="width: 30%; margin: 0 1.5% 0 2%" class="card">
                        <br />
                        <br />
                        <div style="text-align: center; display: inline-block">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~\Images\icon3.png" Width="50px" />
                        </div>
                        <br />
                        <br />
                        <div class="container" style="text-align: center; display: inline-block">
                            <h4><b>
                                <asp:Label ID="Label3" runat="server" Text="Mina Al Fahal, Muscat, Oman"></asp:Label></b></h4>
                            <p>
                                <asp:Label ID="Label4" runat="server" Text="Sat - Thu: 8:00 am to 6:00 pm"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div style="width: 30%; margin: 0 1.5%" class="card">
                        <br />
                        <br />
                        <div style="text-align: center; display: inline-block">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~\Images\icon2.png" Width="50px" />
                        </div>
                        <br />
                        <br />
                        <div class="container" style="text-align: center; display: inline-block">
                            <h4><b>
                                <asp:Label ID="Label5" runat="server" Text="enquiry@imtac.com"></asp:Label></b></h4>
                            <p>
                                <asp:Label ID="Label6" runat="server" Text="Support 24/7"></asp:Label>
                            </p>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                <div style="padding:0 3%">
                    <div class="flexWrapper">
                        <div style="width: 45%; margin-right: 5%">
                            <div style="text-align: left; display: inline-block">
                                <asp:RequiredFieldValidator ID="RFVName" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbName" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                            <asp:TextBox ID="txtbName" runat="server" CssClass="bottomlineTextbox" Width="100%" placeholder="  Full Name" AutoCompleteType="Disabled"></asp:TextBox>
                            <br />
                            <br />
                            <div style="text-align: left; display: inline-block">
                                <asp:RequiredFieldValidator ID="RFVContact" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbContact" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                            <asp:TextBox ID="txtbContact" runat="server" CssClass="bottomlineTextbox" Width="100%" placeholder="  Mobile" AutoCompleteType="Disabled"></asp:TextBox>
                            <br />
                        </div>
                        <div style="width: 45%; margin-left: 5%">
                            <div style="text-align: left; display: inline-block">
                                <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbEmail" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RFVEmail1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtbEmail" ErrorMessage="Invalid Email Address" ValidationGroup="BSubmit" ForeColor="Red" Font-Size="X-Small" Style="float: right"></asp:RegularExpressionValidator>
                            </div>
                            <br />
                            <asp:TextBox ID="txtbEmail" runat="server" CssClass="bottomlineTextbox" Width="100%" placeholder="  Email" AutoCompleteType="Disabled"></asp:TextBox>
                            <br />
                            <br />
                            <div style="text-align: left; display: inline-block">
                                <asp:RequiredFieldValidator ID="RFVCity" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbCity" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                            <asp:TextBox ID="txtbCity" runat="server" CssClass="bottomlineTextbox" Width="100%" placeholder="  City" AutoCompleteType="Disabled"></asp:TextBox>
                            <br />
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    <br />
                    <div style="width: 100%">
                        <div style="text-align: left; display: inline-block">
                            <asp:RequiredFieldValidator ID="RFVSubject" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbSubject" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox ID="txtbSubject" runat="server" CssClass="bottomlineTextbox" placeholder="  Subject" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                        <br />
                        <br />
                        <div style="text-align: left; display: inline-block">
                            <asp:RequiredFieldValidator ID="RFVMessage" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="TextBoxMessage" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <asp:TextBox ID="TextBoxMessage" runat="server" CssClass="bottomlineTextboxMessage" placeholder="  Message" AutoCompleteType="Disabled" TextMode="MultiLine" Height="75px"></asp:TextBox>
                    </div>
                    <br />
                    <br />
                    <div class="buttonWrapper" style="margin: 0px 50px; width: 300px; display: inline-block">
                        <asp:Button ID="BSubmit" runat="server" Text="Submit" Font-Size="X-Large" CssClass="Button" Width="100%" OnClick="BSubmit_Click" ValidationGroup="BSubmit" />
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BehaviorID="BSubmit_ModalPopupExtender" TargetControlID="BDummy" PopupControlID="panelPopUp" BackgroundCssClass="popupBackground1">
                        </ajaxToolkit:ModalPopupExtender>
                        <span style="display: none">
                            <asp:LinkButton ID="BDummy" runat="server">LinkButton</asp:LinkButton>
                        </span>
                        <div>
                            <asp:Panel ID="panelPopUp" runat="server" Enabled="false">
                                <br />
                                <p style="text-align: center; font: 400 large #494949">Message Sent. Would you like to continue?</p>
                                <div class="buttonWrapper">
                                    <asp:Button ID="BNew" runat="server" Text="Compose New Message" CssClass="Button" Width="250px" BackColor="#EEEEEE" ForeColor="#353736" Style="margin: 5px;" OnClick="BNew_Click" />
                                    <asp:Button ID="BHome" runat="server" Text="Return Home" CssClass="Button" Width="200px" Style="margin: 5px;" OnClick="BHome_Click" />
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
        <br />
        <br /><br />
        <div id="Footer">
            <div>
                <p>
                    © imtac 2016, All Rights Reserved &nbsp; | &nbsp; imtac Corporate Website - www.imtac.com &nbsp; | &nbsp; mail us - enquiry@imtac.com
                </p>
            </div>
        </div>
    </form>
</body>
</html>
