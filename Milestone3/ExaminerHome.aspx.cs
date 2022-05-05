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
    public partial class ExaminerHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewAccount(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id = Session["publicId"].ToString();
                Response.Redirect(string.Format("ViewExaminerProfile.aspx", id));
            }
        }

        protected void Defenses(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                string id1 = Session["publicId"].ToString();
                int id = Int16.Parse(id1);
                Response.Redirect(string.Format("Defenses.aspx", id));
            }
        }
        protected void GradeDefense(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                String thesis = thSerialNo.Text;
                String defenseDate = DDate.Text;
                String Grade = grade.Text;
                SqlCommand AddDefenseGrade = new SqlCommand("AddDefenseGrade", conn);
                AddDefenseGrade.CommandType = CommandType.StoredProcedure;
                AddDefenseGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesis));
                AddDefenseGrade.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                AddDefenseGrade.Parameters.Add(new SqlParameter("@grade", Grade));
                conn.Open();
                AddDefenseGrade.ExecuteNonQuery();
                conn.Close();
                thSerialNo.Text = string.Empty;
                DDate.Text = string.Empty;
                grade.Text = string.Empty;
            }
        }

        protected void AddComments(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                String thesis = serialNo.Text;
                String defenseDate = defDate.Text;
                String comment = comments.Text;
                SqlCommand AddCommentsGrade = new SqlCommand("AddCommentsGrade", conn);
                AddCommentsGrade.CommandType = CommandType.StoredProcedure;
                AddCommentsGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", thesis));
                AddCommentsGrade.Parameters.Add(new SqlParameter("@DefenseDate", defenseDate));
                AddCommentsGrade.Parameters.Add(new SqlParameter("@comments", comment));
                conn.Open();
                AddCommentsGrade.ExecuteNonQuery();
                conn.Close();
                serialNo.Text = string.Empty;
                defDate.Text = string.Empty;
                comments.Text = string.Empty;
            }
        }
        
        protected void ThesisPage(object sender, EventArgs e)
        {
            if (Session["publicId"] != null)
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                String thesis = thesisTitle.Text;
                SqlCommand ExaminerViewThesis = new SqlCommand("ExaminerViewThesis", conn);
                ExaminerViewThesis.CommandType = CommandType.StoredProcedure;
                ExaminerViewThesis.Parameters.Add(new SqlParameter("@title", thesis));
                SqlDataAdapter sd = new SqlDataAdapter(ExaminerViewThesis);
                DataTable d = new DataTable();
                sd.Fill(d);
                GridView1.DataSource = d;
                GridView1.DataBind();
                conn.Open();
                ExaminerViewThesis.ExecuteNonQuery();
                conn.Close();
                thesisTitle.Text = string.Empty;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
                Response.Redirect("Login.aspx");
            
        }
    }
}