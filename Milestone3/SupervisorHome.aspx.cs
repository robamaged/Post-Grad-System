using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class SupervisorHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                Response.Redirect(string.Format("StudentsThesis.aspx", id));
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                Response.Redirect(string.Format("Publications.aspx", id));
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                Response.Redirect(string.Format("AddDefense.aspx", id));
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                Response.Redirect(string.Format("EvalProgressReport.aspx", id));
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                Response.Redirect(string.Format("CancelThesis.aspx", id));
            }
        }
    }
}