using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;
using Label = System.Web.UI.WebControls.Label;

namespace Admin
{
    public partial class Supervisors : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("AdminListSup", conn);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("AdminViewAllTheses", conn);
            SqlDataAdapter sd = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sd.Fill(dt);

            GridView2.DataSource = dt;
            GridView2.DataBind();


            SqlCommand cmd2 = new SqlCommand("AdminViewOnGoingTheses", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlParameter count = cmd2.Parameters.Add("@thesesCount", SqlDbType.Int);
            count.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();

            Label thesiscount = new System.Web.UI.WebControls.Label();
            thesiscount.Text = "Ongoing Thesis Number= " + count.Value;
            form1.Controls.Add(thesiscount);

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //   try
            // {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            if (amount.Text.Length == 0 || Thesisno.Text.Length == 0 || installmentsno.Text.Length == 0 || fundpercent.Text.Length == 0)
            {
                MessageBox.Show("Please fill in all the information...");
            }
            else
            {
                int number;
                decimal number1;
                int number2;
                bool result = int.TryParse(Thesisno.Text, out number);
                bool result1 = decimal.TryParse(fundpercent.Text, out number1);
                bool result2 = int.TryParse(installmentsno.Text, out number2);
                if (result && result1 && result2)
                {
                    int tn = int.Parse(Thesisno.Text);
                    decimal am = decimal.Parse(amount.Text);
                    int ins = int.Parse(installmentsno.Text);
                    decimal fp = decimal.Parse(fundpercent.Text);

                    SqlCommand cmd = new SqlCommand("AdminIssueThesisPayment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = tn;
                    cmd.Parameters.Add(new SqlParameter("@amount", SqlDbType.Decimal)).Value = am;
                    cmd.Parameters.Add(new SqlParameter("@noOfInstallments", SqlDbType.Int)).Value = ins;
                    cmd.Parameters.Add(new SqlParameter("@fundPercentage", SqlDbType.Decimal)).Value = fp;

                    SqlParameter exists = cmd.Parameters.Add("@exists", SqlDbType.Int);

                    SqlParameter payid = cmd.Parameters.Add("@payid", SqlDbType.Int);
                    exists.Direction = System.Data.ParameterDirection.Output;
                    payid.Direction = System.Data.ParameterDirection.Output;



                    conn.Open();
                    cmd.ExecuteNonQuery();
                    if (exists.Value.Equals(1))
                    {
                        MessageBox.Show("Payment Issued Successfully..." + "" +
                            "Payment id is:" + "" + payid.Value);
                    }
                    else
                    {
                        MessageBox.Show("Thesis Serial Number does not exist");
                    }
                    conn.Close();
                }
                else
                {

                    MessageBox.Show("Invalid Input(s)");


                }
            }


        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (paymentid.Text.Length == 0 || startdate.Text.Length == 0)
            {
                MessageBox.Show("Please fill in all the fields for issuing the installment...");
            }
            else
            {
                int number;
                bool result = int.TryParse(paymentid.Text, out number);
                DateTime number1;
                bool result1 = DateTime.TryParse(startdate.Text, out number1);

                if (result && result1)
                {
                    int pid = int.Parse(paymentid.Text);
                    DateTime sdate = DateTime.Parse(startdate.Text);

                    SqlCommand cmd = new SqlCommand("AdminIssueInstallPayment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = pid;
                    cmd.Parameters.Add(new SqlParameter("@InstallStartDate", SqlDbType.DateTime)).Value = sdate;

                    SqlParameter exists = cmd.Parameters.Add("@exists", SqlDbType.Int);
                    exists.Direction = System.Data.ParameterDirection.Output;





                    conn.Open();
                    cmd.ExecuteNonQuery();
                    if (exists.Value.Equals(1))
                    {
                        MessageBox.Show("Installment Issued Successfully...");
                    }
                    else
                    {
                        MessageBox.Show("Payment ID does not exist");
                    }
                    conn.Close();
                }
                else
                {
                    MessageBox.Show("Invalid Input(s)");
                }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradSys"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            if (thesis.Text.Length == 0)
            {
                MessageBox.Show("Please fill in the Thesis Serial Number Field..");
            }
            else
            {
                int number;
                bool result = int.TryParse(thesis.Text, out number);
                if (result)
                {

                    int se = int.Parse(thesis.Text);


                    SqlCommand cmd = new SqlCommand("AdminUpdateExtension", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = se;
                    SqlParameter exists = cmd.Parameters.Add("@exists", SqlDbType.Int);
                    exists.Direction = System.Data.ParameterDirection.Output;





                    conn.Open();
                    cmd.ExecuteNonQuery();
                    if (exists.Value.Equals(1))
                    {
                        MessageBox.Show("Update Successfull...");
                    }
                    else
                    {
                        MessageBox.Show("Thesis Serial Number does not exist");
                    }
                    conn.Close();
                }
                else
                {
                    MessageBox.Show("Thesis Number Field must be a Number");
                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
             Response.Redirect("Login.aspx");
        }
    }
}