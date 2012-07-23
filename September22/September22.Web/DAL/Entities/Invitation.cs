using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace September22.DAL
{
    public partial class Invitation
    {
        public string FullName
        {
            get { return FirstName + " " + LastName; }
        }

        public List<Guest> DetachedGuests { get; set; }
    }
}