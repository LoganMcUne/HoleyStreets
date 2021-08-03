using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IUserManagementDao
    {
        public bool ChangeUserRole(ReturnUser user);



    }
}
