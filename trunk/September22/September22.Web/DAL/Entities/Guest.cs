using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace September22.DAL
{
    public partial class Guest
    {
        public Guest()
        {
            DateCreated = DateTime.Now;
        }

        public int SelectedDinnerPreferenceID
        {
            get
            {
                return DinnerPreferenceID ?? -1;
            }
        }

        public DateTime DateCreated { get; private set; }

        public int Index { get; set; }
    }
}