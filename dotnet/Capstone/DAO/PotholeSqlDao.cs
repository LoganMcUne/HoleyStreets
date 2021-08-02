using System;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class PotholeSqlDao : IPotholeDao
    {
        private readonly string connectionString;

        public PotholeSqlDao(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public bool AddPothole(Pothole pothole)
        {
            bool addSuccessful = false;
            
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string addNewPotholeSqlStatement = "INSERT INTO potholes (latitude, longitude, image_link, reported_date, reporting_user_id, repair_status) " +
                                                        "VALUES(@latitude, @longitude, @image_link, @reported_date, @reporting_user_id, @repair_status);";

                    SqlCommand cmd = new SqlCommand("SELECT user_id, username, password_hash, salt, user_role FROM users WHERE username = @username", conn);
                    cmd.Parameters.AddWithValue("@latitude", pothole.Latitude);
                    cmd.Parameters.AddWithValue("@longitude", pothole.Longitude);
                    cmd.Parameters.AddWithValue("@image_link", pothole.ImageLink);
                    cmd.Parameters.AddWithValue("@reported_date", pothole.ReportedDate);
                    cmd.Parameters.AddWithValue("@reporting_user_id", pothole.ReportingUserId);
                    cmd.Parameters.AddWithValue("@repair_status", pothole.RepairStatus);

                    cmd.ExecuteNonQuery();

                }
            }
            catch (SqlException)
            {
                throw;
            }

            return addSuccessful;
        }
    }
}
