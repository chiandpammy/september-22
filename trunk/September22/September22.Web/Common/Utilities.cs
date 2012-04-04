using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace September22.Common
{
    /// <summary>
    /// Summary description for Utilities
    /// </summary>
    public class Utilities
    {
        public const string THEME = "Theme";

        public Utilities()
        {
        }

        /// <summary>
        /// Saves theme into a browser cookie.
        /// </summary>
        /// <param name="themeName"></param>
        public static void SetTheme(string themeName)
        {
            //Set session
            HttpContext.Current.Session[THEME] = themeName;

            //Set cookie
            HttpCookie cookie = new HttpCookie(THEME);

            cookie.Value = themeName;
            cookie.Expires = DateTime.Now.AddYears(1);

            HttpContext.Current.Response.SetCookie(cookie);
        }

        /// <summary>
        /// Returns current theme name.  If no theme is set, return Blue by default.
        /// </summary>
        public static string GetTheme()
        {
            if (HttpContext.Current.Session[THEME] != null)
            {
                return HttpContext.Current.Session[THEME].ToString();
            }
            else if (HttpContext.Current.Request.Cookies[THEME] != null)
            {
                return HttpContext.Current.Request.Cookies[THEME].Value;
            }
            else
            {
                SetTheme(Themes.Wedding.ToString());

                return Themes.Wedding.ToString();
            }
        }

        /// <summary>
        /// Returns next theme in the list of enums.
        /// </summary>
        /// <returns></returns>
        public static string GetNextTheme()
        {
            Themes currentTheme = (Themes)Enum.Parse(typeof(Themes), GetTheme());
            Themes nextTheme;

            switch (currentTheme)
            {
                case Themes.Wedding:
                    nextTheme = Themes.Blue;
                    break;

                case Themes.Blue:
                    nextTheme = Themes.Red;
                    break;

                case Themes.Red:
                    nextTheme = Themes.Grey;
                    break;

                case Themes.Grey:
                    nextTheme = Themes.Blue;
                    break;

                default:
                    nextTheme = Themes.Wedding;
                    break;
            }

            return nextTheme.ToString();
        }
    }
}