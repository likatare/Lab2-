using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab2
{
    public partial class EditPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int.TryParse(Request.QueryString["logid"],out int logid);
            
            if (!Page.IsPostBack)
            {
                if (logid > 0)
                {
                    BindData(logid);
                }
                else
                {
                    btnCreate.Visible = true;
                    btnUpdate.Visible = false;
                    btnCancel.OnClientClick = "~/CRUD";
                    headlineEditPage.Text = "Create information";
                }

            }
        }

        private void BindData(int logid)
        {
            var db = new AdventureWorks2019Entities();
            var item = db.DatabaseLog.Where(x => x.DatabaseLogID == logid).First();
            txtEvent.Text = item.Event;
            txtTimestamp.Text = item.PostTime.ToString();

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int logid = int.Parse(Request.QueryString["logid"]);
            var db = new AdventureWorks2019Entities();
            var item = db.DatabaseLog.Where(x => x.DatabaseLogID == logid).First();
            item.Event = txtEvent.Text;
            item.PostTime = DateTime.Parse(txtTimestamp.Text);
            db.SaveChanges();

            Response.Redirect("~/CRUD");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/CRUD");


        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            var db = new AdventureWorks2019Entities();
            var item = new DatabaseLog
            {
                Event = txtEvent.Text,
                PostTime = DateTime.Parse(txtTimestamp.Text),
                TSQL = "manually added",
                XmlEvent = "",
                DatabaseUser = User.Identity.Name
            };
            db.DatabaseLog.Add(item);
            db.SaveChanges();
            
            Response.Redirect("~/CRUD");
        }
    }
}