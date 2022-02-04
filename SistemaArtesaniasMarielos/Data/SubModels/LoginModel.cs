using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class LoginModel
    {
        public string Usuario { get; set; }
        public bool Recordar { get; set; }
    }
}
