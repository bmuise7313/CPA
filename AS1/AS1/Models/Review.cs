using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AS1.Models
{
    public class Review
    {
        public long Id { get; set; }
        public long songId { get; set; }
        public string songName { get; set; }
        public string reviewName { get; set; }
        public string review { get; set; }
    }
}
