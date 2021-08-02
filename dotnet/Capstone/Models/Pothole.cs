using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Pothole
    {
        public int Id { get; }

        public decimal Latitude { get; }

        public decimal Longitude { get; }

        public string ImageLink { get; }

        public DateTime ReportedDate { get; }

        public int ReportingUserId { get; set; }

        public DateTime InspectedDate { get; }

        public DateTime RepairedDate { get; }

        public string RepairStatus { get; }

        public int Severity { get; }
    }
}
