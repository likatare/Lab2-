<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditPage.aspx.cs" Inherits="Lab2.EditPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/editPageStylesheet.css" rel="stylesheet" />
    <div>
        <div class="container-fluid">

            <div class="jumbotron" style="border: 1px solid #888; box-shadow: 0px 2px 5px #ccc;">
                <asp:Literal ID="headlineEditPage" runat="server">Update information</asp:Literal>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" Text="Timestamp" />
            <asp:TextBox runat="server" ID="txtTimestamp" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ID="reqTimeStamp" ControlToValidate="txtTimeStamp" />
        </div>

        <div class="form-group">
            <asp:Label runat="server" Text="Event" />
            <asp:TextBox runat="server" ID="txtEvent" CssClass="form-control" />
        </div>
        <asp:Button ID="btnUpdate" runat="server" OnClick="BtnSubmit_Click" Text="Update" CssClass="btn btn-success" />
        <asp:Button ID="btnCreate" runat="server" OnClick="BtnCreate_Click" Text="Create" Visible="false" CssClass="btn btn-success" />
        <asp:Button ID="btnCancel" runat="server" OnClick="BtnCancel_Click" Text="Cancel" CssClass="btn btn-danger" />

    </div>



</asp:Content>
