<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageMembers1.aspx.cs" Inherits="HousingManagementSystem.Models.ManageMembers1" %>

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

        <div id="Main">
            <div class="MainMenu">
                <div class="leftMenu" style="min-height: 100vh">
                    <br />
                    <asp:Label ID="MenuName" runat="server" Text="MEMBERS" Font-Size="20px" Font-Bold="true" ForeColor="White" Style="padding: 10px"></asp:Label>
                    <br />
                    <br />
                    <asp:Menu ID="MenuSociety" runat="server" BackColor="#3B6D76" DynamicHorizontalOffset="2" Width="100%" Font-Size="20px" Font-Bold="true" ForeColor="White" StaticSubMenuIndent="10px" DynamicEnableDefaultPopOutImage="False" StaticEnableDefaultPopOutImage="False">
                        <DynamicHoverStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <DynamicMenuStyle BackColor="#3B6D76" ForeColor="White" />
                        <DynamicSelectedStyle BackColor="#5D7B9D" ForeColor="White" />
                        <Items>
                            <asp:MenuItem Text="CREATE MEMBERS" Value="CREATE MEMBERS" NavigateUrl="~/Models/Admin/ManageMembers.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="MANAGE MEMBERS" Value="MANAGE MEMBERS" NavigateUrl="~/Models/Admin/ManageMembers1.aspx" Selected="true"></asp:MenuItem>
                        </Items>
                        <StaticHoverStyle BackColor="#3B6D76" ForeColor="#EEEEEE" />
                        <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" Width="240px" />
                        <StaticSelectedStyle BackColor="#3B6D76" ForeColor="White" />
                    </asp:Menu>
                </div>
                <div class="rightMain" style="min-height: 100vh">
                    <div style="padding: 15px;">
                        <h1 style="color: #494949; font-size: larger; border-bottom: 1px solid #494949; padding: 10px 0px">MANAGE MEMBERS</h1>
                        <br />
                        <div style="width: 100%; overflow-x: scroll">
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="UID" DataSourceID="SqlDataSourceMember" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                <AlternatingRowStyle BackColor="White" ForeColor="#333333" VerticalAlign="Middle" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="UID" HeaderText="UID" InsertVisible="False" ReadOnly="True" SortExpression="UID" />
                                    <asp:TemplateField HeaderText="First Name" SortExpression="FName" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbFName" runat="server" Text='<%# Bind("FName") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name" SortExpression="LName" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbLName" runat="server" Text='<%# Bind("LName") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Resident Card" SortExpression="RCNumber" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbRCNumber" runat="server" Text='<%# Bind("RCNumber") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("RCNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Birth date" SortExpression="Bdate" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbBdate" runat="server" Text='<%# Bind("Bdate") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("Bdate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender" SortExpression="Gender" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbGender" runat="server" Text='<%# Bind("Gender") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbEmail" runat="server" Text='<%# Bind("Email") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile" SortExpression="Mobile" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbMobile" runat="server" Text='<%# Bind("Mobile") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Alternate Mobile" SortExpression="AMobile" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbAMobile" runat="server" Text='<%# Bind("AMobile") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("AMobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Telephone" SortExpression="Telephone" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbTelephone" runat="server" Text='<%# Bind("Telephone") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Telephone") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Username" SortExpression="Username" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbUsername" runat="server" Text='<%# Bind("Username") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Usertype" SortExpression="Usertype" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbUsertype" runat="server" Text='<%# Bind("Usertype") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Usertype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Password" SortExpression="Password" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbPassword" runat="server" Text='<%# Bind("Password") %>' CssClass="borderedTextbox" Width="99%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Entry Date" SortExpression="EntryDate" HeaderStyle-Width="300px" ItemStyle-Width="300px" ItemStyle-Height="50px" ItemStyle-Wrap="false" HeaderStyle-Wrap="false">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tbEntryDate" runat="server" Text='<%# Bind("EntryDate") %>' CssClass="borderedTextbox" Width="95%"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("EntryDate") %>'></asp:Label>
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
                            <asp:SqlDataSource ID="SqlDataSourceMember" runat="server" ConnectionString="<%$ ConnectionStrings:HousingMSdbConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UID] = @UID" InsertCommand="INSERT INTO [Users] ([FName], [LName], [RCNumber], [Bdate], [Gender], [Email], [Mobile], [AMobile], [Telephone], [Username], [Usertype], [Password], [EntryDate]) VALUES (@FName, @LName, @RCNumber, @Bdate, @Gender, @Email, @Mobile, @AMobile, @Telephone, @Username, @Usertype, @Password, @EntryDate)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [FName] = @FName, [LName] = @LName, [RCNumber] = @RCNumber, [Bdate] = @Bdate, [Gender] = @Gender, [Email] = @Email, [Mobile] = @Mobile, [AMobile] = @AMobile, [Telephone] = @Telephone, [Username] = @Username, [Usertype] = @Usertype, [Password] = @Password, [EntryDate] = @EntryDate WHERE [UID] = @UID">
                                <DeleteParameters>
                                    <asp:Parameter Name="UID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="FName" Type="String" />
                                    <asp:Parameter Name="LName" Type="String" />
                                    <asp:Parameter Name="RCNumber" Type="String" />
                                    <asp:Parameter Name="Bdate" Type="DateTime" />
                                    <asp:Parameter Name="Gender" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Mobile" Type="String" />
                                    <asp:Parameter Name="AMobile" Type="String" />
                                    <asp:Parameter Name="Telephone" Type="String" />
                                    <asp:Parameter Name="Username" Type="String" />
                                    <asp:Parameter Name="Usertype" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="Image" Type="Object" />
                                    <asp:Parameter Name="EntryDate" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FName" Type="String" />
                                    <asp:Parameter Name="LName" Type="String" />
                                    <asp:Parameter Name="RCNumber" Type="String" />
                                    <asp:Parameter Name="Bdate" Type="DateTime" />
                                    <asp:Parameter Name="Gender" Type="String" />
                                    <asp:Parameter Name="Email" Type="String" />
                                    <asp:Parameter Name="Mobile" Type="String" />
                                    <asp:Parameter Name="AMobile" Type="String" />
                                    <asp:Parameter Name="Telephone" Type="String" />
                                    <asp:Parameter Name="Username" Type="String" />
                                    <asp:Parameter Name="Usertype" Type="String" />
                                    <asp:Parameter Name="Password" Type="String" />
                                    <asp:Parameter Name="Image" Type="Object" />
                                    <asp:Parameter Name="EntryDate" Type="DateTime" />
                                    <asp:Parameter Name="UID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>
