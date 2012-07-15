﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace September22.Common
{
    /// <summary>
    /// Summary description for Utilities
    /// </summary>
    public class Utilities
    {
        public const string THEME = "Theme";

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

        /// <summary>
        /// Sends email.
        /// </summary>
        public static void SendEmail(string from, string[] to, string subject, string body)
        {
            //create message
            MailMessage message = new MailMessage();

            //set sender
            message.From = new MailAddress(from);

            //set recipients
            for (int i = 0; i < to.Length; i++)
                message.To.Add(new MailAddress(to[i]));

            //set message
            message.Subject = subject;
            message.Body = body;
            message.IsBodyHtml = false;

            //send message
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Timeout = 1;
            smtpClient.Send(message);
        }
        
        /// <summary>
        /// Writes exception information to error.log.  Source is most likely the page error came from or the file causing the error.
        /// </summary>
        public static void LogException(string source, Exception ex)
        {
            //grab logger
            log4net.ILog logger = log4net.LogManager.GetLogger
                (System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
            
            //log error
            if (logger.IsErrorEnabled)
                logger.Error(source, ex);
        }
    }
}