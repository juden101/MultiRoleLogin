using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
    private string conStr;
    private SqlConnection con;

    private Dictionary<string, Staff> allStaff;
    private Dictionary<string, Customer> customers;
    public DAL()
    {
        //
        // TODO: Add constructor logic here
        //

        conStr = ConfigurationManager.ConnectionStrings["UserDBConnectionString1"].ConnectionString;
        con = new SqlConnection(conStr);

        allStaff = new Dictionary<string, Staff>();
        customers = new Dictionary<string, Customer>();
    }

    public DataTable getAllUserData() {

        
        string myQuery = "SELECT * FROM Users";
        var myCommand = new SqlCommand(myQuery, con);
        SqlDataReader myResults;
        DataTable myDataTable = new DataTable();

       
        try
        {
            con.Open();
            myResults = myCommand.ExecuteReader();

            if (myResults.HasRows == true)
            {
                myDataTable.Load(myResults);
            }

            return myDataTable;
        }

   
        catch (Exception e)
        {
            return myDataTable;
        }

       
        finally
        {
            con.Close();
            myCommand.Dispose();
        }

    }

    public void loadUserdata() {
        DataTable UsersTable;

        UsersTable = this.getAllUserData();

        for (int i = 0; i <= UsersTable.Rows.Count - 1; i++)
        {
            string username = Convert.ToString(UsersTable.Rows[i][1]);
            string password = Convert.ToString(UsersTable.Rows[i][2]);
            string firstname = Convert.ToString(UsersTable.Rows[i][3]);
            string lastname = Convert.ToString(UsersTable.Rows[i][4]);
            string email = Convert.ToString(UsersTable.Rows[i][5]);
            string role = Convert.ToString(UsersTable.Rows[i][6]);
           
                 if (role.Equals("M"))
            {
                //create a new Customer 

                //add customer to the dictionary
             
            }

                  else if (role == "C")
            {
              //create a new Staff

              //add to staff dictionary

                
            }
        }
    }

    public string retrieveStaffRole(string username)
    {
        string sql = "select * from StaffRoles where username=@username";
        string role = "";
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand(sql,con);

           
            com.Parameters.AddWithValue("@username", username);
        
            SqlDataReader rdr = com.ExecuteReader();
            if (rdr.Read())
            {
                role = rdr["role"].ToString();
            }
        }
        catch (Exception e)
        {
            String error = e.Message;
           
        } finally
        {
            con.Close();
           
        }

        return "";

    }

    //write methods to get & set customers

    //write methods to get & set staff
}