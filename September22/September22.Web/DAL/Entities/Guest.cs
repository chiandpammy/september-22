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
        }

        public int SelectedDinnerPreferenceID
        {
            get
            {
                return DinnerPreferenceID ?? -1;
            }
        }

        public int Index { get; set; }
    }
}