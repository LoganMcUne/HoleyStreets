using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class UserManagementSqlDao : IUserManagementDao
    {
        private readonly string connectionString;

        public UserManagementSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        //method to change user role
        public bool ChangeUserRole(ReturnUser user)
        {
            bool changeSuccessful = false;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string changeUserRoleSqlStatement = "UPDATE users " +
                        "SET user_role = @user_role " +
                        "WHERE user_id = @user_id; ";

                    SqlCommand cmd = new SqlCommand(changeUserRoleSqlStatement, conn);
                    cmd.Parameters.AddWithValue("@user_role", user.Role);
                    cmd.Parameters.AddWithValue("@user_id", user.UserId);

                    cmd.ExecuteNonQuery();
                    changeSuccessful = true;
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
                return changeSuccessful;
            }

            return changeSuccessful;
        }

        //public List<ReturnUser> ListUsersByRole(string role)
        //{
        //    List<Pothole> allPotholes = new List<Pothole>();

        //    try
        //    {
        //        using (SqlConnection conn = new SqlConnection(connectionString))
        //        {
        //            conn.Open();

        //            string getAllPotholesSqlStatement = "SELECT pothole_id, latitude, longitude, image_link, reported_date, reporting_user_id, inspected_date, repaired_date, repair_status, severity FROM potholes;";

        //            SqlCommand cmd = new SqlCommand(getAllPotholesSqlStatement, conn);

        //            SqlDataReader reader = cmd.ExecuteReader();
        //            while (reader.Read())
        //            {
        //                Pothole pothole = GetPotholeFromReader(reader);

        //                allPotholes.Add(pothole);
        //            }
        //        }
        //    }
        //    catch (SqlException)
        //    {
        //        return null;
        //    }

        //    return allPotholes;
        //}
    }
}
