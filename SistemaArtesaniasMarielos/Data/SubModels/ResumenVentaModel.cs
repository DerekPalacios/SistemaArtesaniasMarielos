using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class ResumenVentaModel
    {
        public int Orden { get; set; }
        public string Descripcion { get; set; }
        public decimal Unidades { get; set; }
        public decimal Valor { get; set; }
    }
}
