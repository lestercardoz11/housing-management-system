<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForRent.aspx.cs" Inherits="HousingManagementSystem.Models.ForRent" %>

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
                <div class="leftMenu" style="min-height: 100vh; width:15%">
                </div>
                <div class="rightMain" style="width: 70%; min-height: 100vh">
                    
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">FOR RENT</h1>
                        <br />
                        <asp:Panel ID="PanelDiv" runat="server" Height="100%">
                            <div style="z-index: 20; padding: 20px;">
                                <h3 style="text-align: center">There are no Ads currently.</h3>
                            </div>
                        </asp:Panel>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceRent" OnItemCommand="ListView1_ItemCommand" OnDataBound="ListView1_DataBound" OnItemDataBound="ListView1_ItemDataBound" DataKeyNames="HID">
                            <ItemTemplate>
                                <asp:Panel ID="panelProperty" class="flexWrapper panelHover" runat="server" Style="height: auto; width: 100%; overflow: hidden">
                                    <div style="padding: 20px; min-width: 0px; width: 40%; height: 200px;">
                                        <div style="width: 100%;">
                                            <div id="slider" class="slideshow-container2">
                                                <div class="slideshow-child">
                                                    <asp:Repeater ID="rptImages" runat="server">
                                                        <ItemTemplate>
                                                            <div class="mySlides fade">
                                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Style="width: 100%" />
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                                                <a class="next" onclick="plusSlides(1)">&#10095;</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="width: 50%; padding: 5px; margin: 20px; height: inherit">
                                        <div style="padding-left: 10px">
                                            <div class="flexWrapper" style="padding: 10px 10px">
                                                <div style="width: 70%">
                                                    <asp:Label ID="lblBedrooms" runat="server" Text='<%# Eval("Bedrooms") %>' CssClass="Label" Font-Bold="true"></asp:Label>
                                                    <asp:Label ID="Label1" runat="server" Text=" Apartment" CssClass="Label" Font-Bold="true"></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Text=" in " CssClass="Label"></asp:Label>
                                                    <asp:Label ID="lblSociety" runat="server" Text='<%# Eval("SocietyName") %>' CssClass="Label"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>' CssClass="Label"></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Text=", " CssClass="Label"></asp:Label>
                                                    <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>' CssClass="Label"></asp:Label>
                                                </div>
                                                <div style="width: auto">
                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price")%>' CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblPrice1" runat="server" Text="OMR" CssClass="Label"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="flexWrapper" style="border-bottom: 1px solid #808080; border-top: 1px solid #808080; padding: 10px 10px">
                                                <div style="width: 35%">
                                                    <asp:Label ID="lblWing" runat="server" Text='<%# Eval("Wing") %>' CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblWing1" runat="server" Text="Wing" CssClass="Label"></asp:Label>
                                                </div>
                                                <div style="width: 35%">
                                                    <asp:Label ID="lblApartmentNo" runat="server" Text='<%# Eval("ApartmentNo") %>' CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblApartmentNo1" runat="server" Text="Apartment No." CssClass="Label"></asp:Label>
                                                </div>
                                                <div style="width: auto">
                                                    <asp:Label ID="lblApartmentSize" runat="server" Text='<%# Eval("ApartmentSize")%>' CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblApartmentSize1" runat="server" Text="sq/ft" CssClass="Label"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="flexWrapper" style="padding: 10px 10px">
                                                <div style="width: 35%">
                                                    <asp:Label ID="lblApartmentType" runat="server" Text='<%# Eval("ApartmentType") %>' CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label5" runat="server" Text="Apartment Type" CssClass="Label"></asp:Label>
                                                </div>
                                                <div style="width: 35%">
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("ProjectStatus") %>' CssClass="Label" Font-Bold="true" Font-Size="Large"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblStatus1" runat="server" Text="Property Status" CssClass="Label"></asp:Label>
                                                </div>
                                                <div class="buttonWrapper" style="text-align: right; width: auto">
                                                    <asp:Button ID="BRent" runat="server" Text="Enquire" CssClass="Button" CommandArgument='<%#Eval("HID")+","+ Eval("UID") +","+ Eval("ApartmentNo")%>' CommandName="Enquire" Style="background-color: inherit; color: #5CB559; border: 2px solid #5CB559; border-radius: 3px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:ListView>
                        <br />
                        <br />
                        <div style="text-align: center">
                            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="25">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" PreviousPageText="<<" ShowFirstPageButton="False" ShowNextPageButton="False" ShowPreviousPageButton="True" ButtonCssClass="pagerNextPrevious" />
                                    <asp:NumericPagerField ButtonType="Button" ButtonCount="3" NumericButtonCssClass="pagerNumeric" CurrentPageLabelCssClass="PagerCurrentNumeric" NextPreviousButtonCssClass="hidden" />
                                    <asp:NextPreviousPagerField ButtonType="Button" NextPageText=">>" ShowLastPageButton="False" ShowNextPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="pagerNextPrevious" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSourceRent" runat="server" ConnectionString="<%$ ConnectionStrings:HousingMSdbConnectionString %>" SelectCommand="SELECT Rent.*, Society.*, House.*, Users.* FROM Rent INNER JOIN Users ON Rent.UID = Users.UID INNER JOIN Society ON Rent.SID = Society.SID INNER JOIN House ON Rent.HID = House.HID AND Users.UID = House.UID AND Society.SID = House.SID ORDER BY Rent.EntryDate DESC"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="leftMenu" style="min-height: 100vh; width:15%">
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
