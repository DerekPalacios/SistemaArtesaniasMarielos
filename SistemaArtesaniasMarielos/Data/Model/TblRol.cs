using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("TblRol")]
    public partial class TblRol
    {
        public TblRol()
        {
            TblUsuarios = new HashSet<TblUsuario>();
        }

        [Key]
        public int Id { get; set; }
        [Required]
        [Column("Nombre_Rol")]
        [StringLength(20)]
        public string NombreRol { get; set; }

        [InverseProperty(nameof(TblUsuario.IdRolNavigation))]
        public virtual ICollection<TblUsuario> TblUsuarios { get; set; }
    }
}
