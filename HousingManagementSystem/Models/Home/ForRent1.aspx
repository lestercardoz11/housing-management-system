<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForRent1.aspx.cs" Inherits="HousingManagementSystem.Models.ForRent1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
                                            <asp:Button ID="BLogIn" runat="server" Text="LOGIN" OnClick="BLogIn_Click" ValidationGroup="LOGIN" CssClass="Button"/>
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
                        <DynamicHoverStyle BackColor="#45E4E7" />
                        <DynamicMenuItemStyle HorizontalPadding="2px" VerticalPadding="2px" />
                        <DynamicMenuStyle BackColor="#45E4E7" />
                        <DynamicSelectedStyle BackColor="#45E4E7" />
                        <Items>
                            <asp:MenuItem Text="HOME" Value="HOME" NavigateUrl="~/Models/Home/Homepage.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Home/Society.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="FOR RENT" Value="FOR RENT" NavigateUrl="~/Models/Home/ForRent.aspx" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="FOR SALE" Value="FOR SALE" NavigateUrl="~/Models/Home/ForSale.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="CONTACT US" Value="CONTACT US" NavigateUrl="~/Models/Home/ContactUs.aspx"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#45E4E7"/>
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
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <asp:Panel ID="Panel5" runat="server" Style="padding: 15px; border: 1px solid #808080; width: auto">
                            <div style="border-bottom: 1px solid #494949; padding: 10px;">
                                <asp:Label ID="LabelSubject" runat="server" Text="" Font-Size="X-Large" ForeColor="#494949"></asp:Label>
                            </div>
                            <br />
                            <div class="flexWrapper" style="width: inherit;">
                                <div style="width: 75%">
                                    <div class="flexWrapper" >
                                        <div style="width: 50%">
                                            <div style="width: 90%;">
                                                <asp:RequiredFieldValidator ID="RFVName" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbName" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="txtbName" runat="server" CssClass="bottomlineTextbox" placeholder="  Full Name" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                                                <br />
                                                <br />
                                                <asp:RequiredFieldValidator ID="RFVContact" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbContact" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="txtbContact" runat="server" CssClass="bottomlineTextbox" placeholder="  Mobile" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                                                <br />
                                            </div>
                                        </div>

                                        <div style="width: 50%">
                                            <div style="width: 90%;">
                                                <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbEmail" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RFVEmail1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtbEmail" ErrorMessage="Invalid Email Address" ValidationGroup="BSubmit" ForeColor="Red" Font-Size="X-Small" Style="float: right"></asp:RegularExpressionValidator>
                                                <br />
                                                <asp:TextBox ID="txtbEmail" runat="server" CssClass="bottomlineTextbox" placeholder="  Email" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                                                <br />
                                                <br />
                                                <asp:RequiredFieldValidator ID="RFVCity" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbCity" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:TextBox ID="txtbCity" runat="server" CssClass="bottomlineTextbox" placeholder="  City" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div style="width: 100%">
                                        <div style="width: 95%;">
                                            <asp:RequiredFieldValidator ID="RFVSubject" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbSubject" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="txtbSubject" runat="server" CssClass="bottomlineTextbox" placeholder="  Subject" Width="100%" AutoCompleteType="Disabled"></asp:TextBox>
                                            <br />
                                            <br />
                                            <asp:RequiredFieldValidator ID="RFVMessage" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="TextBoxMessage" ValidationGroup="BSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:TextBox ID="TextBoxMessage" runat="server" CssClass="bottomlineTextboxMessage" placeholder="  Message" AutoCompleteType="Disabled" TextMode="MultiLine" Height="75px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="buttonWrapper" style="display: inline-block; width: inherit;">
                                        <asp:Button ID="BSubmit" runat="server" Text="Submit" Font-Size="Large" CssClass="Button" OnClick="BSubmit_Click" ValidationGroup="BSubmit" Style="border-radius: 1px; width: 200px" />
                                    </div>
                                    <br />
                                </div>
                                <div style="width: 25%;" class="card">
                                    <div style="height: 250px; overflow: hidden">
                                        <asp:Image ID="ImageDisplay" runat="server" ImageUrl="~\Images\ProfilePicture.png" Style="width: 100%;" />
                                    </div>
                                    <div class="container">
                                        <h4><b><asp:Label ID="LabelName" runat="server" Text=""></asp:Label></b></h4>
                                        <p><asp:Label ID="Label1" runat="server" Text="Owner"></asp:Label></p>
                                        <p><asp:Label ID="LabelEmail" runat="server" Text=""></asp:Label></p>
                                        <p><asp:Label ID="LabelPhone" runat="server" Text=""></asp:Label></p>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div> 
                </div>
            </div>
        </div>
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
