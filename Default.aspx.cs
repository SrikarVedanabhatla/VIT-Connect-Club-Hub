using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Text;
using System.Net;
namespace ClubManagementSystem
{
    public partial class Default : System.Web.UI.Page
    {
        public String role1, hostName;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["cmsConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            CheckSession();
        }
        private void CheckSession()
        {
            Session.RemoveAll();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select role,emp_name from User_Master where User_name =@username and Password=@password", con);
                cmd.Parameters.AddWithValue("@username", username.Text); // To save a value in session
                cmd.Parameters.AddWithValue("@password", password.Text);
                Session["username"] = username.Text;

                // string username = Session["FirstName"] as string; (For Reading Session Attrib)
                Session["password"] = password.Text;
                SqlDataReader dr = null;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    role1 = dr["role"].ToString();
                    String emp_name1 = dr["emp_name"].ToString();
                    Session["emp_name"] = emp_name1;
                    Session["role"] = role1;
                    if (role1.Equals("ADMIN"))
                    {
                        Response.Redirect("admin.aspx");
                    }

                    if (role1.Equals("Faculty") || role1.Equals("ope") || role1.Equals("mai") || role1.Equals("rqhse") || role1.Equals("customer"))
                    {
                        Response.Redirect("faculty.aspx");
                    }

                    if (role1.Equals("Student"))
                    {
                        Response.Redirect("student.aspx");
                    }
                    else
                    {
                        // Response.Redirect("user.aspx");
                        Label3.Visible = true;
                        Label3.Text = "Invalid Username or Password";
                        //ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
                    }

                }
                username.Text = "";

                Label3.Visible = true;
                Label3.Text = "Invalid Username or Password";
            }
            catch (Exception ex)
            {
                Label3.Visible = true;
                //This label shows error message when any Exception catched.
                Label3.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }

        }

    }
}