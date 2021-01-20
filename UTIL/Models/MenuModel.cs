using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTIL.Models
{
    public class MenuModel
    {
        public int IdMenu { get; set; }
        public string Clase { get; set; }
        public string PieMenu { get; set; }
        public string Titutlo { get; set; }
        public string Action { get; set; }
        public string Controler { get; set; }
        public int Id_Perfil { get; set; }
        public int Activo { get; set; }
        public int Orden { get; set; }
        public int IdEmpresa { get; set; }
    }
}
