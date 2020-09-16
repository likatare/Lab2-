<%@ Page Title="CRUD" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="Lab2.CRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your CRUD page.</h3>

    <%--<asp:BoundField DataField="Event" HeaderText="Event" SortExpression="Event" />--%>
    <%--<asp:BoundField DataField="PostTime" HeaderText="Post timer" SortExpression="PostTime">  </asp:BoundField>--%>



    <asp:GridView ID="GridView1" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover"
        DataKeyNames="DatabaseLogId" AutoGenerateColumns="false" EmptyDataText="There are no data records to display"
        PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPageIndexChanging"
        PagerSettings-Position="Top" PagerSettings-Mode="NumericFirstLast"
        OnRowEditing="GridView1_RowEditing"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowUpdating="GridView1_RowUpdating"
        OnRowDeleting="GridView1_RowDeleting"
        ShowFooter="true"
        OnRowCommand="GridView1_RowCommand">


        <Columns>
            <asp:BoundField DataField="DatabaseLogId"  HeaderText="DatabaseLogId" SortExpression="DatabaseLogId" />

            <asp:TemplateField HeaderText="Post timer">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%#Bind("PostTime")%>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPostTime" runat="server" CssClass="form-control" Text='<%#Bind("PostTime")%>' />
                    <asp:RequiredFieldValidator ID="reqPostTime" runat="server" ControlToValidate="txtPostTime" ErrorMessage="(required)" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Event">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Bind("Event")%>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtEvent" runat="server" CssClass="form-control" Text='<%#Bind("Event")%>' />
                    <asp:RequiredFieldValidator ID="reqEvent" runat="server" ControlToValidate="txtEvent" ErrorMessage="(required)" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNewEvent" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" />
                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lnkAdd" runat="server" Text="Add" CommandName="Insert" CausesValidation="false" />
                </FooterTemplate>

            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="true" />
            <asp:HyperLinkField DataNavigateUrlFields="DatabaseLogId" DataNavigateUrlFormatString="~/EditPage?logid={0}" Text="Edit2" />
        </Columns>

    </asp:GridView>

</asp:Content>
