using DocumentFormat.OpenXml.Presentation;
using DsDashBoard.UTIL;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UTIL;
using UTIL.Models;

namespace DsDashBoard.Controllers
{
    public class ReporteController : BaseController
    {
        [HttpGet]
        public ActionResult ReporteRRHH()
        {
            try
            {
                List<VariableModel> variables= controlDisofi().getVariables(baseDatosUsuario());
                ViewBag.variables = variables;
                List<VariableModel> variablesReporte = controlDisofi().getVariablesReporte(baseDatosUsuario());
                ViewBag.variablesReporte = variablesReporte;
                List<PeriodoModel> periodo = controlDisofi().getPeriodo();
                ViewBag.periodo= periodo;                
                UsuarioModel user = obtenerUsuario();
                ViewBag.tipo = user.IdTipo;

                return View();
                
            }
            catch(Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        //Limpiar Tabla Variables de Reporte
        [HttpPost]
        public JsonResult deleteVariablesReporte(string codVariable)
        {
            try
            {
                var resp = controlDisofi().deleteVariablesReporte(codVariable);

                return Json(new { data = resp });
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }
        //Limpiar Tabla Variables de Reporte
        [HttpPost]
        public JsonResult insertVariablesReporte(string codVariable, string descripcion)
        {
            try
            {
                var resp = controlDisofi().insertVariablesReporte(codVariable, descripcion);

                return Json(new { data = resp });
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        //Traer las fichas de softland
        [HttpPost]
        public JsonResult getFichas(string estado, string estadoAnterior, string mes, string mesAnterior, string ano)
        {
            try
            {
                List<FichaModel> data = controlDisofi().getFichas(baseDatosUsuario(), estado,estadoAnterior, mes, mesAnterior, ano);

                return Json(new { data = data });
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        //Traer valores de variables de softland
        [HttpPost]
        public JsonResult getValores(string numFicha, string codVariable, string mes, string mesAnterior)
        {
            try
            {
                List<ValorModel> data = controlDisofi().getValores(baseDatosUsuario(), numFicha, codVariable, mes, mesAnterior);

                return Json(new { data = data });
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }
        
    }

    
}
