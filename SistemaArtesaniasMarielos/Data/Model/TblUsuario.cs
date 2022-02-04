using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("TblUsuario")]
    public partial class TblUsuario
    {
        [Key]
        public int Id { get; set; }
        public int IdRol { get; set; }
        [Required]
        [StringLength(50)]
        public string Nombres { get; set; }
        [Required]
        [StringLength(50)]
        public string Apellidos { get; set; }
        [Required]
        [Column("Nombre_Usuario")]
        [StringLength(20)]
        public string NombreUsuario { get; set; }
        [Required]
        [StringLength(20)]
        public string Clave { get; set; }
        [Required]
        [StringLength(20)]
        public string ConfirmarClave { get; set; }

        [ForeignKey(nameof(IdRol))]
        [InverseProperty(nameof(TblRol.TblUsuarios))]
        public virtual TblRol IdRolNavigation { get; set; }
    }
}
