using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class StudentHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id = Session["publicId"].ToString();
                Response.Redirect(string.Format("MyProfile.aspx", id));
            }

        }

        protected void Button2_Click2(object sender, EventArgs e)
        {
            Response.Redirect("thesis.aspx");
        }

        protected void Button3_Click3(object sender, EventArgs e)
        {
            Response.Redirect("ProgressReport.aspx");
        }

        protected void Button4_Click4(object sender, EventArgs e)
        {
            Response.Redirect("FillProgressReport.aspx");
        }

        protected void Button5_Click5(object sender, EventArgs e)
        {
            Response.Redirect("AddPublication.aspx");
        }
    }
}