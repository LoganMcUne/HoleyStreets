using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;

namespace Capstone.DAO
{
    public class ClaimFormSqlDao : IClaimFormDao
    {
        private readonly string connectionString;

        public ClaimFormSqlDao(string dbConnectionString)
        {
            this.connectionString = dbConnectionString;
        }

        public List<ClaimForm> GetAllClaims()
        {
            List<ClaimForm> allClaimForms = new List<ClaimForm>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string getAllClaimsSqlStatement = "SELECT claim_id, user_id, first_name, last_name, email, phone_number, date_of_claim, date_of_incident, location_of_incident_city, location_of_incident_state, image_link, description_of_damage, claim_status FROM claims;";

                    SqlCommand cmd = new SqlCommand(getAllClaimsSqlStatement, conn);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while(reader.Read())
                    {
                        ClaimForm claimForm = getClaimFormFromReader(reader);
                    }
                }
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
                return null;
            }

            return allClaimForms;
        }

        public ClaimForm getClaimFormFromReader(SqlDataReader reader)
        {
            return new ClaimForm();
        }
    }
}
