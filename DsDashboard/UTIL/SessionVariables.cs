using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UTIL.Models;

namespace DsDashBoard.UTIL
{
    public class SessionVariables
    {
        public static UsuarioModel SESSION_DATOS_USUARIO
        {
            get { return (UsuarioModel)HttpContext.Current.Session["SesionUsuario"]; }
            set { HttpContext.Current.Session["SesionUsuario"] = value; }
        }

        public static string SESSION_RUTA_ARCHIVO
        {
            get { return (string)HttpContext.Current.Session["rutaTemporal"]; }
            set { HttpContext.Current.Session["rutaTemporal"] = value; }
        }
    }
}