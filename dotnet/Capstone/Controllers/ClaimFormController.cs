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
    public class ClaimFormController : ControllerBase
    {
        private readonly IClaimFormDao claimFormDao;

        public ClaimFormController(IClaimFormDao _claimFormDao)
        {
            claimFormDao = _claimFormDao;
        }

    }
}
