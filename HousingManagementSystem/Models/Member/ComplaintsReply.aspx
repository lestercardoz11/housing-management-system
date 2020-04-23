<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComplaintsReply.aspx.cs" Inherits="HousingManagementSystem.Models.Member.ComplaintsReply" %>

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
                            <asp:MenuItem Text="COMPLAINT" Value="COMPLAINT" NavigateUrl="~/Models/Member/Complaints.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="INBOX" Value="INBOX" NavigateUrl="~/Models/Member/ComplaintsReply.aspx" Selected="true"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">INBOX</h1>
                        <br />
                        <asp:Panel ID="PanelDiv" runat="server" Height="100%">
                            <div style="z-index: 20; padding: 20px;">
                                <h3 style="text-align: center">You have no replies.</h3>
                            </div>
                        </asp:Panel>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceComplaint" OnItemCommand="ListView1_ItemCommand" OnDataBound="ListView1_DataBound" DataKeyNames="CpID">
                            <ItemTemplate>
                                <asp:Panel ID="panelComplaint" CssClass="panelHover" runat="server" Style="width: auto; overflow: hidden">
                                    <div class="flexWrapper" style="width: 100%; height: auto; border-bottom: 1px solid #808080">
                                        <div style="width: auto; height: inherit; padding: 10px;">
                                            <asp:Label ID="lblDate" runat="server" Text='<%# Convert.ToDateTime(Eval("ReplyDate")).ToString("dd / MM") %>' CssClass="Label" Font-Size="Large" Style="margin: 0px 2.5px"></asp:Label>
                                        </div>
                                        <div style="width: 20%; height: inherit; display: inline-flex; padding: 10px;">
                                            <asp:Label ID="lblSubjectName" runat="server" Text='<%# Eval("Subject") %>' CssClass="Label" Font-Size="Large" Style="margin: 0px 2.5px"></asp:Label>
                                        </div>
                                        <div class="flexWrapper" style="width: 60%; height: inherit; padding: 10px;">
                                            <div style="height: inherit; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                <div style="width: auto; height: auto; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                    <p style="width: auto; font: 400 large 'Microsoft Sans Serif'; color: #808080; display: inline; margin: 0px 2.5px"><%# Eval("Complaint") %></p>
                                                </div>
                                                <div style="width: auto; height: auto; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                    <asp:Label ID="Label1" runat="server" Text="-" CssClass="Label" Font-Size="Large" Style="margin: 0px 2.5px"></asp:Label>
                                                    <p style="width: auto; font: 400 large 'Microsoft Sans Serif'; color: #494949; display: inline; margin: 0px 2.5px"><%# Eval("Reply") %></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="width: 6%; height: inherit; padding: 10px; vertical-align: bottom">
                                            <asp:Button ID="BView" runat="server" Text="View" CssClass="Button" Width="100%" Font-Size="Medium" CommandArgument='<%#Eval("CpID")%>' CommandName="View" Style="border-radius: 1px" />
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
                        <asp:SqlDataSource ID="SqlDataSourceComplaint" runat="server" ConnectionString="<%$ ConnectionStrings:HousingMSdbConnectionString %>" SelectCommand="SELECT Complaint.*, Users.UID AS Expr1, Users.FName, Users.LName FROM Complaint INNER JOIN Users ON Complaint.UID = Users.UID WHERE Complaint.Status= @Status and Complaint.UID = @UID ORDER BY Complaint.ReplyDate DESC" OnSelecting="SqlDataSourceComplaint_Selecting">
                            <SelectParameters>
                                <asp:Parameter Name="Status" Type="String" />
                                <asp:Parameter Name="UID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
