using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class ClaimFormSqlDao : IClaimFormDao
    {
        private readonly string connectionString;

        public ClaimFormSqlDao(string dbConnectionString)
        {
            this.connectionString = dbConnectionString;
        }


    }
}
