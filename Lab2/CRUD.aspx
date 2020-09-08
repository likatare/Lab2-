<%@ Page Title="CRUD" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="Lab2.CRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your CRUD page.</h3>



    <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
        DataKeyNames="DatabaseLogId" AutoGenerateColumns="false" EmptyDataText="There are no data records to display"
        Pagesize="10" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging"
        PagerSettings-Position="TopAndBottom" PagerSettings-Mode="NumericFirstLast"
        OnRowEditing="GridView1_RowEditing"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowUpdating="GridView1_RowUpdating"
        OnRowDeleting="GridView1_RowDeleting">
        
        <Columns>
            <asp:BoundField DataField="PostTime" HeaderText="Post timer" SortExpression="PostTime" />
            <asp:BoundField DataField="Event" HeaderText="Event" SortExpression="Event" />
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
        </Columns>

    </asp:GridView>

</asp:Content>
