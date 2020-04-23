 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHouse1.aspx.cs" Inherits="HousingManagementSystem.Models.ManageHouse1" %>

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
                            <asp:MenuItem Text="SOCIETY" Value="SOCIETY" NavigateUrl="~/Models/Admin/ManageSociety.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="HOUSE" Value="HOUSE" NavigateUrl="~/Models/Admin/ManageHouse.aspx" Selected="true"></asp:MenuItem>
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
                    <asp:Label ID="MenuName" runat="server" Text="APARTMENT" Font-Size="24px" Font-Bold="true" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="0" Font-Names="Verdana" Width="100%" Font-Size="Large" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False">
                        <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="CREATE APARTMENT" Value="CREATE APARTMENT" NavigateUrl="~/Models/Admin/ManageHouse.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="MANAGE APARTMENT" Value="MANAGE APARTMENT" NavigateUrl="~/Models/Admin/ManageHouse1.aspx" Selected="true"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">MANAGE APARTMENT</h1>
                        <br />
                        <div style="width: 100%; overflow-x: scroll">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="HID" DataSourceID="SqlDataSourceHouse" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                <AlternatingRowStyle BackColor="White" ForeColor="#333333" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:TemplateField HeaderText="HID" InsertVisible="False" SortExpression="HID">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("HID") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("HID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UID" SortExpression="UID" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbUID" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("UID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("UID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SID" SortExpression="SID" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbSID" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("SID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("SID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apartment Number" SortExpression="ApartmentNo" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbApartmentNo" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("ApartmentNo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ApartmentNo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Wing" SortExpression="Wing" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbWing" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("Wing") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Wing") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apartment Size" SortExpression="ApartmentSize" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbApartmentSize" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("ApartmentSize") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ApartmentSize") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Apartment Type" SortExpression="ApartmentType" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbApartmentType" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("ApartmentType") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ApartmentType") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bedrooms" SortExpression="Bedrooms" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbBedrooms" runat="server" CssClass="borderedTextbox" Width="99%" Text='<%# Bind("Bedrooms") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Bedrooms") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry Date" SortExpression="EntryDate" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbEntryDate" runat="server" CssClass="borderedTextbox" Width="95%" Text='<%# Bind("EntryDate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle Width="200px" />
                                <FooterStyle BackColor="#353736" Font-Bold="True" ForeColor="White" Width="200px" />
                                <HeaderStyle BackColor="#3B6D76" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" Width="200px" />
                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                                <PagerStyle BackColor="#353736" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" VerticalAlign="Middle" Width="200px" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceHouse" runat="server" ConnectionString="<%$ ConnectionStrings:HousingMSdbConnectionString %>" DeleteCommand="DELETE FROM [House] WHERE [HID] = @HID" InsertCommand="INSERT INTO [House] ([UID], [SID], [ApartmentNo], [Wing], [ApartmentSize], [ApartmentType], [Bedrooms], [EntryDate]) VALUES (@UID, @SID, @ApartmentNo, @Wing, @ApartmentSize, @ApartmentType, @Bedrooms, @EntryDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [House]" UpdateCommand="UPDATE [House] SET [UID] = @UID, [SID] = @SID, [ApartmentNo] = @ApartmentNo, [Wing] = @Wing, [ApartmentSize] = @ApartmentSize, [ApartmentType] = @ApartmentType, [Bedrooms] = @Bedrooms, [EntryDate] = @EntryDate WHERE [HID] = @HID">
                                <DeleteParameters>
                                    <asp:Parameter Name="HID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="UID" Type="Int32" />
                                    <asp:Parameter Name="SID" Type="Int32" />
                                    <asp:Parameter Name="ApartmentNo" Type="Int32" />
                                    <asp:Parameter Name="Wing" Type="String" />
                                    <asp:Parameter Name="ApartmentSize" Type="String" />
                                    <asp:Parameter Name="ApartmentType" Type="String" />
                                    <asp:Parameter Name="Bedrooms" Type="String" />
                                    <asp:Parameter Name="Image" Type="Object" />
                                    <asp:Parameter Name="EntryDate" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="UID" Type="Int32" />
                                    <asp:Parameter Name="SID" Type="Int32" />
                                    <asp:Parameter Name="ApartmentNo" Type="Int32" />
                                    <asp:Parameter Name="Wing" Type="String" />
                                    <asp:Parameter Name="ApartmentSize" Type="String" />
                                    <asp:Parameter Name="ApartmentType" Type="String" />
                                    <asp:Parameter Name="Bedrooms" Type="String" />
                                    <asp:Parameter Name="Image" Type="Object" />
                                    <asp:Parameter Name="EntryDate" Type="DateTime" />
                                    <asp:Parameter Name="HID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
