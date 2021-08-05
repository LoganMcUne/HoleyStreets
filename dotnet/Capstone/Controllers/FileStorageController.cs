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
    public class FileStorageController : ControllerBase
    {
        private readonly IFileStorageDao fileDao;

        public FileStorageController(IFileStorageDao _fileDao)
        {
            fileDao = _fileDao;
        }
    }
}
