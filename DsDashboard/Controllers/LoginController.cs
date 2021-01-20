using DsDashBoard.UTIL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UTIL.Models;

namespace DsDashBoard.Controllers
{
    public class LoginController : BaseController
    {
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult LogOut()
        {
            SessionVariables.SESSION_DATOS_USUARIO = null;
            return RedirectToAction("Login", "Login");
        }

        [HttpPost]
        public JsonResult Login (string _Nombre, string _Contrasena)
        {
            var datosUsuario = new UsuarioModel();
            SessionVariables.SESSION_DATOS_USUARIO = null;
            var validador = 0;
            if (!string.IsNullOrEmpty(_Nombre) && !string.IsNullOrEmpty(_Contrasena))
            {
                datosUsuario.NombreUsuario = _Nombre;
                datosUsuario.Contrasena = _Contrasena;
                var resultadoList = controlDisofi().login(datosUsuario);
                var resultado = resultadoList == null ? null : resultadoList.Count == 0 ? null : resultadoList[0];

                if(resultado != null)
                {
                    List<UsuarioEmpresaModel> empresas = controlDisofi().obtenerEmpresaUsuario(resultado);
                    if(empresas.Count > 0)
                    {
                        if(empresas.Count == 1)
                        {
                            validador = 1;
                            SessionVariables.SESSION_DATOS_USUARIO = resultado;
                            SessionVariables.SESSION_DATOS_USUARIO.UsuarioEmpresaModel = empresas[0];
                            return Json(new { Validador = validador, empresas = empresas, DatosUsuario = resultado });
                        }
                        else
                        {
                            return Json(new RespuestaModel() { Verificador = false, Mensaje = "Error Datos" });
                        }
                    }
                    else
                    {
                        return Json(new RespuestaModel() { Verificador = false, Mensaje = "Usuario no tiene empresa asociada" });
                    }
                }
                else
                {
                    return Json(new RespuestaModel() { Verificador = false, Mensaje = "Error de usuario y/o contraseña" });
                }
            }
            else
            {
                return Json(new RespuestaModel() { Verificador = false, Mensaje = "Error Datos" });
            }
        }
    }
}
