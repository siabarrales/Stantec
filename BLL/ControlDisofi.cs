using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UTIL.Models;

namespace BLL
{
    public class ControlDisofi
    {
        private FactoryAcceso _Control = new FactoryAcceso();

        #region Login

        public List<UsuarioModel> login(UsuarioModel usuario)
        {
            return _Control.login(usuario);
        }

        public List<UsuarioEmpresaModel> obtenerEmpresaUsuario(UsuarioModel usuario)
        {
            return _Control.obtenerEmpresaUsuario(usuario);
        }

        public List<MenuModel> MenuUsuario(int id_Usuario)
        {
            return _Control.MenuUsuario(id_Usuario);
        }

        #endregion

        #region Variables       
        public List<VariableModel> getVariables(string baseDatos)
        {
            return _Control.getVariables(baseDatos);
        }

        public List<VariableModel> getVariablesReporte(string baseDatos)
        {
            return _Control.getVariablesReporte(baseDatos);
        }
        public List<PeriodoModel> getPeriodo()
        {
            return _Control.getPeriodo();
        }

        public bool deleteVariablesReporte(string codVariable)
        {
            return _Control.deleteVariablesReporte(codVariable);
        }

        public bool insertVariablesReporte(string codVariable, string descripcion)
        {
            return _Control.insertVariablesReporte(codVariable, descripcion);
        }

        #endregion

        #region Fichas  
        public List<FichaModel> getFichas(string baseDeDatos, string estado, string estadoAnterior, string mes, string mesAnterior, string ano)
        {
            return _Control.getFichas(baseDeDatos, estado, estadoAnterior, mes, mesAnterior, ano);
        }
        #endregion

        public List<ValorModel> getValores(string baseDeDatos, string numFicha, string codVariable, string mes, string mesAnterior)
        {
            return _Control.getValores(baseDeDatos, numFicha, codVariable, mes, mesAnterior);
        }

    }
}
