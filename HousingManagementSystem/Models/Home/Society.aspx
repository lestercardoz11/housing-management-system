<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Society.aspx.cs" Inherits="HousingManagementSystem.Models.Society" %>

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
</head>
<script>
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
    });
</script>
<script>
    var slideIndex = 1;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");

    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
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
                    <asp:Button ID="BAccount" runat="server" Text="LOG IN" CssClass="loginButton" />
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
                        <asp:Menu ID="MenuBar" runat="server" BackColor="#45E4E7" DynamicHorizontalOffset="0" Width="100%" Font-Size="20px" ForeColor="#FFFFFF" Orientation="Horizontal" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False" Height="30px" Font-Bold="True" Font-Italic="False">
                            <DynamicHoverStyle BackColor="#45E4E7" />
                            <DynamicMenuItemStyle HorizontalPadding="2px" VerticalPadding="2px" />
                            <DynamicMenuStyle BackColor="#45E4E7" />
                            <DynamicSelectedStyle BackColor="#45E4E7" />
                            <Items>
                                <asp:MenuItem Text="HOME" Value="HOME" NavigateUrl="~/Models/Home/Homepage.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Home/Society.aspx" Selected="true"></asp:MenuItem>
                                <asp:MenuItem Text="FOR RENT" Value="FOR RENT" NavigateUrl="~/Models/Home/ForRent.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="FOR SALE" Value="FOR SALE" NavigateUrl="~/Models/Home/ForSale.aspx"></asp:MenuItem>
                                <asp:MenuItem Text="CONTACT US" Value="CONTACT US" NavigateUrl="~/Models/Home/ContactUs.aspx"></asp:MenuItem>
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
                    <div class="leftMenu">
                        <br />
                        <asp:Label ID="MenuSocietyName" runat="server" Text="SOCIETY" Font-Size="20px" Font-Bold="True" ForeColor="White" Style="padding: 10px"></asp:Label>
                        <br />
                        <br />
                        <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="2" Font-Names="Verdana" Width="100%" Font-Size="Large" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False" OnMenuItemClick="MenuSociety_MenuItemClick" OnLoad="MenuSociety_Load">
                            <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                            <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                            <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                            <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                            <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                            <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                            <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                        </asp:Menu>
                    </div>
                    <div class="rightMain">
                        <div>
                            <br />
                            <asp:Label ID="lblSocietyName" runat="server" Text="" Font-Bold="True" Font-Size="XX-Large" ForeColor="#494949" Style="margin-left: 30px; margin-top: 30px"></asp:Label>
                            <br />
                            <asp:Label ID="lblCity" runat="server" Text="" ForeColor="#494949" Style="margin-left: 30px;"></asp:Label>
                            <asp:Label ID="LabelCC" runat="server" Text=", " ForeColor="#494949"></asp:Label>
                            <asp:Label ID="lblCountry" runat="server" Text="" ForeColor="#494949"></asp:Label>
                            <br />
                            <br />
                            <div class="flexWrapper">
                                <div class="left" style="width: 55%; margin: 10px; padding: 20px; color: #335252; text-align: left">
                                    <div style="border-style: none none solid none; border-width: 1px; border-color: #335252;">
                                        <asp:Label ID="LabelAmenities" runat="server" Text="Amenities" Font-Bold="True" Font-Size="X-Large" Width="75%" ForeColor="#616161"></asp:Label>
                                    </div>
                                    <asp:Table ID="TableAmenities" runat="server" Width="100%" Height="350px" HorizontalAlign="Center" Font-Size="Large">
                                    </asp:Table>
                                </div>
                                <div class="right" style="border: 1px solid #335252; width: 30%; margin: 10px; padding: 20px; color: #335252;">
                                    <div style="border-style: none none solid none; border-width: 1px; border-color: #335252;">
                                        <asp:Label ID="LabelContact" runat="server" Text="Contact Seller" Font-Bold="True" Font-Size="X-Large" Width="75%" ForeColor="#616161"></asp:Label>
                                    </div>
                                    <br />
                                    <div style="border: 1px solid #335252; background-color: #FCFCFC; padding: 10px; margin: 10px; text-align: right">
                                        <asp:Label ID="lblbuilding" runat="server" Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="lbldeveloper" runat="server" Text="Real Estate Developer"></asp:Label>
                                        <br />
                                        <asp:Label ID="lblnumber" runat="server" Text="+968 XXXX XXXX"></asp:Label>
                                    </div>
                                    <br />
                                    <div style="padding: 10px;">
                                        <asp:RequiredFieldValidator ID="RFVName" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbName" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtbName" runat="server" CssClass="bottomlineTextbox" AutoCompleteType="Disabled" Width="100%" placeholder="  Name"></asp:TextBox>
                                        <br />
                                        <br />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtbEmail" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtbEmail" runat="server" CssClass="bottomlineTextbox" AutoCompleteType="Disabled" Width="100%" placeholder="  Email"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RFVEmail1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtbEmail" ErrorMessage="Invalid Email" ValidationGroup="BCreate" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                        <br />
                                        <br />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RFVMobile" runat="server" ErrorMessage="*" Font-Size="Small" ControlToValidate="txtPhone" ValidationGroup="BCreate" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="bottomlineTextbox" AutoCompleteType="Disabled" Width="100%" placeholder="  Mobile"></asp:TextBox>
                                        <br />
                                        <br />
                                        <br />
                                        <asp:Button ID="BDetails" runat="server" Text="Get Contact Details" CssClass="Button" Font-Bold="true" Font-Size="Large" Width="100%" Height="35px" ValidationGroup="BCreate" OnClick="BDetails_Click" />
                                        <ajaxToolkit:ModalPopupExtender ID="BDetails_ModalPopupExtender" runat="server" BehaviorID="BDetails_ModalPopupExtender" TargetControlID="BDummy" PopupControlID="ButtonPanel" BackgroundCssClass="confirmBackground">
                                        </ajaxToolkit:ModalPopupExtender>
                                    </div>
                                </div>
                                <div class="confirmPanel">
                                    <asp:Panel ID="ButtonPanel" runat="server" CssClass="confirmPanel shadow">
                                        <div style="width: 100%; text-align: right; display: inline-block; margin: 0px;">
                                            <asp:ImageButton ID="ImageRentX" runat="server" ImageUrl="~/Images/X.jpg" Width="20px" OnClientClick="return true" Style="outline: none" />
                                        </div>
                                        <br />
                                        <h3 style="text-align: center; font: 400 large #494949">CONTACT DETAILS</h3>
                                        <div style="border: 1px solid #335252; background-color: #FCFCFC; padding: 10px; margin: 10px;">
                                            <asp:Label ID="LabelBuilding" runat="server" Text="" CssClass="Label larger" Style="padding: 10px"></asp:Label>
                                            <br />
                                            <asp:Label ID="LabelDeveloperName" runat="server" Text="" CssClass="Label larger" Style="padding: 10px"></asp:Label>
                                            <br />
                                            <asp:Label ID="LabelMobile" runat="server" Text="" CssClass="Label larger" Style="padding: 10px"></asp:Label>
                                            <br />
                                        </div>
                                    </asp:Panel>
                                </div>
                                <span style="display: none">
                                    <asp:LinkButton ID="BDummy" runat="server">LinkButton</asp:LinkButton>
                                </span>
                            </div>
                        </div>
                        <br />
                        <div style="background-color: #F1FCFE">
                            <div>
                                <br />
                                <asp:Table ID="TableInfo" runat="server" HorizontalAlign="Center" Width="100%">
                                    <asp:TableRow runat="server" HorizontalAlign="Center" VerticalAlign="Middle">
                                        <asp:TableCell runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#2D3033" HorizontalAlign="Center" VerticalAlign="Middle">Project Size</asp:TableCell>
                                        <asp:TableCell runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#2D3033" HorizontalAlign="Center" VerticalAlign="Middle">Project Area</asp:TableCell>
                                        <asp:TableCell runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#2D3033" HorizontalAlign="Center" VerticalAlign="Middle">Project Status</asp:TableCell>
                                        <asp:TableCell runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#2D3033" HorizontalAlign="Center" VerticalAlign="Middle">Launch Date</asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server" Style="text-align: center">
                                        <asp:TableCell runat="server" ForeColor="#2D3033">
                                            <asp:Label ID="lblSize" runat="server" Text="" ForeColor="#494949"></asp:Label>
                                            Buildings
                                        </asp:TableCell>
                                        <asp:TableCell runat="server" ForeColor="#2D3033">
                                            <asp:Label ID="lblArea" runat="server" Text="" ForeColor="#494949"></asp:Label>
                                            Acres
                                        </asp:TableCell>
                                        <asp:TableCell runat="server" ForeColor="#2D3033">
                                            <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="#494949"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell runat="server" ForeColor="#2D3033">
                                            <asp:Label ID="lblLauchdate" runat="server" Text="" ForeColor="#494949"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <br />
                                <br />
                                <div style="width: 100%">
                                    <div id="slider" class="slideshow-container1">
                                        <div class="slideshow-child">
                                            <asp:Repeater ID="rptImages" runat="server">
                                                <ItemTemplate>
                                                    <div class="mySlides fade">
                                                        <asp:Image runat="server" ImageUrl='<%# Eval("Image") %>' Style="width: 100%" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                                        <a class="next" onclick="plusSlides(1)">&#10095;</a>
                                    </div>
                                </div>

                                <br />
                                <br />
                            </div>
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
