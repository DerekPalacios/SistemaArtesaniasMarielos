using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("TblConfiguracion")]
    public partial class TblConfiguracion
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(100)]
        public string ConfEncabezadoFactura { get; set; }
        [Required]
        [StringLength(50)]
        public string NombrePropietario { get; set; }
        [Required]
        [StringLength(30)]
        public string NombreTienda { get; set; }
        [Column("N_Ruc")]
        [StringLength(30)]
        public string NRuc { get; set; }
        [Required]
        [StringLength(8)]
        public string ConfTelefono { get; set; }
        [Required]
        [StringLength(100)]
        public string ConfDireccion { get; set; }
        [StringLength(50)]
        public string ConfCorreo { get; set; }
    }
}
