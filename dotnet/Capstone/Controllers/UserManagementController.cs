using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserManagementController : ControllerBase
    {
        private readonly IUserManagementDao userDao;

        public UserManagementController(IUserManagementDao _userDao)
        {
            userDao = _userDao;
        }

        [HttpPut]
        //[Authorize(Roles = "admin")]
        public IActionResult UpdateUserRole(ReturnUser user)
        {
            bool updateSuccessful = userDao.ChangeUserRole(user);

            if (updateSuccessful)
            {
                return NoContent();
            }
            else
            {
                return StatusCode(500);
            }
        }
    }
}
