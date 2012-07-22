﻿using System;
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

        public string Decision
        {
            get { return Attending.HasValue ? Attending.Value.ToString() : null; }
        }
    }
}