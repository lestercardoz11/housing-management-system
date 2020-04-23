 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="HousingManagementSystem.Models.Homepage" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="Stylesheet" href="~/Models/StyleSheet1.css" type="text/css" />
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.2)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.2)" />
    <style>
        * {
            box-sizing: border-box;
        }
    </style>
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
                            <Animations>
                                <OnShown>
                                     <FadeIn Duration="0.5" Fps="40" />
                                </OnShown>
                                <OnHiding>
                                     <FadeOut Duration="0.5" Fps="40" />
                                </OnHiding>
                            </Animations>
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
                                <DynamicHoverStyle BackColor="#45E4E7" />
                                <DynamicMenuItemStyle HorizontalPadding="2px" VerticalPadding="2px" />
                                <DynamicMenuStyle BackColor="#45E4E7" />
                                <DynamicSelectedStyle BackColor="#45E4E7" />
                                <Items>
                                    <asp:MenuItem Text="HOME" Value="HOME" NavigateUrl="~/Models/Home/Homepage.aspx" Selected="true"></asp:MenuItem>
                                    <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Home/Society.aspx"></asp:MenuItem>
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
                    <div class="flexWrapper" style="width: 100%; margin: 0px 50px">
                        <div class="left" style="padding: 5px; text-align: left;">
                            <br />
                            <h1 style="font-size: xx-large; color: #494949; font: bold">ABOUT US</h1>
                            <p style="font-size: x-large; color: #616161;">
                                At imtac, we leverage our rich technology
                <br />
                                and domain expertise to present software product
                <br />
                                engineering services that help you constantly
                <br />
                                innovate, launch new products, improve time to
                <br />
                                market capabilities and maintain large product
                <br />
                                portfolios at reduced costs.
                            </p>
                        </div>
                        <div class="right" style="margin-left: 50px">
                            <asp:Image ID="ImageHome" runat="server" Height="300px" Width="550px" ImageUrl="~/Images/Home.jpg" />
                        </div>
                    </div>
                    <div class="main">
                        <br />
                        <br />
                        <div class="flexWrapper" style="width: 100%; margin: 0px 50px">
                            <div>
                                <div class="slideshow-container" style="width: auto; margin: 20px">
                                    <div class="mySlides fade">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/H1.jpg" />
                                    </div>
                                    <div class="mySlides fade">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/H2.jpg" />
                                    </div>
                                    <div class="mySlides fade">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/H3.jpg" />
                                    </div>
                                    <div class="mySlides fade">
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/H4.jpg" />
                                    </div>
                                    <div class="mySlides fade">
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/H5.jpg" />
                                    </div>

                                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                                    <a class="next" onclick="plusSlides(1)">&#10095;</a>

                                    <br />
                                </div>
                                <div id="sliderdots" style="text-align: center">
                                    <span class="dot" onclick="currentSlide(1)"></span>
                                    <span class="dot" onclick="currentSlide(2)"></span>
                                    <span class="dot" onclick="currentSlide(3)"></span>
                                    <span class="dot" onclick="currentSlide(4)"></span>
                                    <span class="dot" onclick="currentSlide(5)"></span>
                                </div>
                            </div>
                            <div class="right" style="padding: 10px; text-align: left; margin-left: 10px;">
                                <br />
                                <br />
                                <h1 style="font-size: xx-large; color: #494949; font: bold">OUR PROJECTS</h1>
                                <p style="font-size: x-large; color: #616161;">
                                    The project offers residential 
                    <br />
                                    apartments that are well designed 
                    <br />
                                    according to the need of the  
                    <br />
                                    modern home buyers.
                                </p>
                                <br />
                                <asp:Button ID="BDetails" runat="server" Text="View Details" CssClass="Button" BackColor="#3B6D76" ForeColor="White" Width="200px" Font-Size="Large" OnClick="BDetails_Click" Style="border-radius: 2px;" />
                            </div>
                        </div>
                        <br />
                        <br />
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
