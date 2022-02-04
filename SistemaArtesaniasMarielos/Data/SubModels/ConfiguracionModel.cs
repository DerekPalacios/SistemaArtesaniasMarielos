using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class ConfiguracionModel
    {
        public int Id { get; set; }
        public string ConfEncabezadoFactura { get; set; }
        public string NombrePropietario { get; set; }
        public string NombreTienda { get; set; }
        public string N_Ruc { get; set; }

     
        public string ConfTelefono { get; set; }
        public string ConfDireccion { get; set; }
        public string ConfCorreo { get; set; }
    }
}
