<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UsersTable.aspx.cs" Inherits="UsersTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
        <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
        <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserDBConnectionString1 %>" DeleteCommand="DELETE FROM [Users] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Users] ([username], [password], [firstname], [lastname], [email], [role]) VALUES (@username, @password, @firstname, @lastname, @email, @role)" ProviderName="<%$ ConnectionStrings:UserDBConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [username], [password], [firstname], [lastname], [email], [role] FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username, [password] = @password, [firstname] = @firstname, [lastname] = @lastname, [email] = @email, [role] = @role WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="username" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="firstname" Type="String" />
        <asp:Parameter Name="lastname" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="role" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="username" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="firstname" Type="String" />
        <asp:Parameter Name="lastname" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="role" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

