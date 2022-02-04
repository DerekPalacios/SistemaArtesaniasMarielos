using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class LoginUsuarioModel
    {
       [Required(ErrorMessage ="Campo Obligatorio")]
       [DataType(DataType.Text, ErrorMessage ="El usuario no es válido")]
        public string Usuario { get; set; }
        
        [Required(ErrorMessage ="Campo Obligatorio")]
        [MinLength(5, ErrorMessage = "Mínimo 5 caracteres")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        public bool Recordar { get; set; }
    }
}
