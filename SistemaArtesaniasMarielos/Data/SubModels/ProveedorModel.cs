using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class ProveedorModel
    {
        public int IdProveedor { get; set; }
       
        [Required(ErrorMessage = "Campo obligatorio")]
        public string NombreProveedor { get; set; }
        public string NombreEmpresa { get; set; }

        [Required(ErrorMessage = "Campo obligatorio")]
        public string TelefonoProveedor { get; set; }

    }
}
