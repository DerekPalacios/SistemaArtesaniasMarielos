using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class ClienteModel
    {
        public int IdCliente { get; set; }
       
        [StringLength(50)]
        [Required(ErrorMessage = "Campo obligatorio")]
        public string NombreCliente { get; set; }
        
        [StringLength(50)]
        public string IdentifiacionCliente { get; set; }
       
        [StringLength(300)]
        public string DireccionCliente { get; set; }
        
        [StringLength(11)]
        public string TelefonoCliente { get; set; }


    }
}
