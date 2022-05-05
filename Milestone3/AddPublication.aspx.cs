using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Milestone3
{
    public partial class AddPublication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string t = title.Text;
            string pd = publicationdate.Text;
            string h = host.Text;
            string p = place.Text;

            SqlCommand addPublicationproc = new SqlCommand("addPublication", conn);
            addPublicationproc.CommandType = CommandType.StoredProcedure;
            addPublicationproc.Parameters.Add(new SqlParameter("@title", t));
            addPublicationproc.Parameters.Add(new SqlParameter("@pubDate", pd));
            addPublicationproc.Parameters.Add(new SqlParameter("@host", h));
            addPublicationproc.Parameters.Add(new SqlParameter("@place", p));
            SqlParameter pubid = addPublicationproc.Parameters.Add("@PubID", SqlDbType.Int);
            pubid.Direction = ParameterDirection.Output;
            if (CheckBoxList1.SelectedIndex == 0)
            {
                addPublicationproc.Parameters.Add(new SqlParameter("@accepted", '1'));
            }
            else
            {
                addPublicationproc.Parameters.Add(new SqlParameter("@accepted", '0'));
            }

            conn.Open();
            addPublicationproc.ExecuteNonQuery();
            Response.Redirect("LinkPubThesis.aspx");

            conn.Close();

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
    
}