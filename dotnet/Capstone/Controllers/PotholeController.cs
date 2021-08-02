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
            pothole.ReportingUserId = int.Parse(User.FindFirst("sub")?.Value);
            pothole.ReportedDate = System.DateTime.Now.Date;
            pothole.RepairStatus = "Reported";
            bool addResult = potholeDao.AddPothole(pothole);
            if (addResult)
            {
                return Ok();
            } else
            {
                return StatusCode(500);
            }
        }
    }
}
