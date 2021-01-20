using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTIL.Models;
using UTIL.Validadores;

namespace BLL
{
    public class FactoryAcceso
    {
        #region Login

        public List<UsuarioModel> login(UsuarioModel usuario)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("SP_Login", new System.Collections.Hashtable()
                {
                    {"pv_Usuario", usuario.NombreUsuario },
                    {"pv_Contrasena", usuario.Contrasena },
                    {"pv_ContrasenaMD5", HashMd5.GetMD5(usuario.Contrasena) },
                });
                return UTIL.Mapper.BindDataList<UsuarioModel>(data);
            }
            catch (Exception e)
            {
                string error = e.ToString();
                return null;
            }
        }

        public List<UsuarioEmpresaModel> obtenerEmpresaUsuario(UsuarioModel usuario)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("SP_GET_EmpresasUsuario", new System.Collections.Hashtable()
                {
                    {"pi_IdUsuario", usuario.Id },
                });
                return UTIL.Mapper.BindDataList<UsuarioEmpresaModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        public List<MenuModel> MenuUsuario(int idUsuario)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("SP_GET_Menu", new System.Collections.Hashtable()
                {
                    {"IdPerfil", idUsuario },
                });
                return UTIL.Mapper.BindDataList<MenuModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        #endregion        

        #region Variables

        public List<VariableModel> getVariables(string baseDatos)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_GET_Variables", new System.Collections.Hashtable());
                return UTIL.Mapper.BindDataList<VariableModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        public List<VariableModel> getVariablesReporte(string baseDatos)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_GET_VariablesReporte", new System.Collections.Hashtable());
                return UTIL.Mapper.BindDataList<VariableModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }
        public List<PeriodoModel> getPeriodo()
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_GET_Periodo", new System.Collections.Hashtable());
                return UTIL.Mapper.BindDataList<PeriodoModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }

        public bool deleteVariablesReporte(string codVariable)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_DEL_VariablesReporte", new System.Collections.Hashtable(){
                    {"codvariable", codVariable}
                });
                if (data!=null)
                {
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return false;
            }
        }

        public bool insertVariablesReporte(string codVariable, string descripcion)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_INS_VariablesReporte", new System.Collections.Hashtable(){
                    {"codvariable", codVariable},
                    {"descripcion", descripcion}
                });
                if (data != null)
                {
                    return true;
                }
                return false;
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return false;
            }
        }
        #endregion

        #region Fichas
        public List<FichaModel> getFichas(string baseDeDatos, string estado, string estadoAnterior, string mes, string mesAnterior, string ano)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_GET_Fichas", new System.Collections.Hashtable(){
                    {"pv_BaseDatos", baseDeDatos},
                    {"estado", estado},
                    {"estadoAnterior", estadoAnterior},
                    {"mesAnterior", mesAnterior},
                    {"mes", mes},
                    {"ano", ano}
                });
                return UTIL.Mapper.BindDataList<FichaModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }
        #endregion
        public List<ValorModel> getValores(string baseDeDatos, string numFicha, string codVariable, string mes, string mesAnterior)
        {
            try
            {
                var data = new DBConector().EjecutarProcedimientoAlmacenado("DS_GET_Valores", new System.Collections.Hashtable() {
                    {"pv_BaseDatos", baseDeDatos},
                    {"ficha", numFicha},
                    {"codVariable", codVariable},
                    {"mes", mes},
                    {"mesAnterior", mesAnterior}
                });
                return UTIL.Mapper.BindDataList<ValorModel>(data);
            }
            catch (Exception e)
            {
                string error = e.Message.ToString();
                return null;
            }
        }


    }
}
