using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTIL.Models
{
    public class FichaModel
    {
        public string NumFicha { get; set; }
        public string Nombre { get; set; }
        public string RUT { get; set; }
        public string AFP { get; set; }
        public string AFPAnterior { get; set; }        
        public string ISAPRE { get; set; }
        public string ISAPREAnterior { get; set; }        
        public string PorcentajeAFP { get; set; }
        public string PorcentajeAFPAnterior { get; set; }
        public string VariacionPorcentajeAFP { get; set; }
        public string PactadoIsapre { get; set; }
        public string PactadoIsapreAnterior { get; set; }
        public string VariacionPactadoIsapre { get; set; }
    }
}
