using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;
using System.Web;
using September22.DAL;

namespace September22.DAL
{
    public static class DataAccess
    {
        private static WeddingEntities _entities;

        private static WeddingEntities Entities
        {
            get
            {
                if (_entities == null)
                {
                    _entities = new WeddingEntities();
                }
                return _entities;
            }
        }

        public static IQueryable<DinnerPreference> GetDinnerPreferences(bool excludeOther = true)
        {
            IQueryable<DinnerPreference> dinnerPreferences = Entities.DinnerPreferences;
            if(excludeOther)
            {
                dinnerPreferences = dinnerPreferences.Where(pref => pref.Name != "Other");
            }

            return dinnerPreferences;
        }

        public static IQueryable<Invitation> GetInvitations()
        {
            return Entities.Invitations;
        }
    }
}