using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class CRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/");
            }

            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var db = new AdventureWorks2019Entities();
            int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = GridView1.Rows[e.RowIndex];

            TextBox textPostTime = (TextBox)(row.Cells[0].Controls[0]);
            //TextBox textEvent = (TextBox)(row.Cells[1].Controls[0]);
            TextBox textEvent = (TextBox)row.FindControl("txtEvent");

            var item = db.DatabaseLog.Where(x => x.DatabaseLogID == id).First();
            item.PostTime = DateTime.Parse(textPostTime.Text);
            item.Event = textEvent.Text;
            db.SaveChanges();
            //Reset the edit index.
            GridView1.EditIndex = -1;

            //Bind data to the GridView control.
            BindData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Set the edit index.
            GridView1.EditIndex = e.NewEditIndex;
            //Bind data to the GridView control.
            BindData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Reset the edit index.
            GridView1.EditIndex = -1;
            //Bind data to the GridView control.
            BindData();
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            var db = new AdventureWorks2019Entities();
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            var item = db.DatabaseLog.Where(x => x.DatabaseLogID == id).First();
            db.DatabaseLog.Remove(item);
            db.SaveChanges();

            BindData();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Response.Write(e.CommandName);

            if (e.CommandName == "Insert")
            {
                var db = new AdventureWorks2019Entities();
                var item = new DatabaseLog();
                item.Event = ((TextBox)GridView1.FooterRow.FindControl("txtNewEvent")).Text;
                item.PostTime = DateTime.Now;
                item.TSQL = "manually added";
                item.XmlEvent = "";
                item.DatabaseUser = User.Identity.Name;
                db.DatabaseLog.Add(item);
                db.SaveChanges();

            }
            BindData();
        }

        private void BindData()
        {
            var db = new AdventureWorks2019Entities();
            var dbLog = from log in db.DatabaseLog orderby log.PostTime descending select log;
            if (dbLog != null)
            {
                GridView1.DataSource = dbLog.ToList();
                GridView1.DataBind();
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            BindData();
        }
    }
}