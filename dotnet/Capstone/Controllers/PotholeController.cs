using Microsoft.AspNetCore.Mvc;
using Capstone.DAO;
using Capstone.Models;
using Capstone.Security;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class PotholeController : ControllerBase
    {
        private readonly IPotholeDao potholeDao;

        public PotholeController(IPotholeDao _potholeDao)
        {
            potholeDao = _potholeDao;
        }

        //NEED TO REPLACE BELOW THIS LINE
        [HttpPost("/add")]
        public IActionResult AddNewPothole(Pothole pothole)
        {
            pothole.ReportingUserId = 5; //User.FindFirst("iat")?.Value;

            IActionResult result = Unauthorized();

            /*
            // Default to bad username/password message
            IActionResult result = Unauthorized(new { message = "Username or password is incorrect" });

            // Get the user by username
            User user = userDao.GetUser(userParam.Username);

            // If we found a user and the password hash matches
            if (user != null && passwordHasher.VerifyHashMatch(user.PasswordHash, userParam.Password, user.Salt))
            {
                // Create an authentication token
                string token = tokenGenerator.GenerateToken(user.UserId, user.Username, user.Role);

                // Create a ReturnUser object to return to the client
                LoginResponse retUser = new LoginResponse() { User = new ReturnUser() { UserId = user.UserId, Username = user.Username, Role = user.Role }, Token = token };

                // Switch to 200 OK
                result = Ok(retUser);
            }

            */
            return result;
        }
    }
}
