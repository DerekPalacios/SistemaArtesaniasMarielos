using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_Cliente")]
    public partial class TblCliente
    {
        public TblCliente()
        {
            TblVentaArticulos = new HashSet<TblVentaArticulo>();
        }

        [Key]
        [Column("Id_Cliente")]
        public int IdCliente { get; set; }
        [Column("Nombre_Cliente")]
        [StringLength(50)]
        public string NombreCliente { get; set; }
        [Column("Identifiacion_Cliente")]
        [StringLength(50)]
        public string IdentifiacionCliente { get; set; }
        [Column("Direccion_Cliente")]
        [StringLength(300)]
        public string DireccionCliente { get; set; }
        [Column("Telefono_Cliente")]
        [StringLength(11)]
        public string TelefonoCliente { get; set; }

        [InverseProperty(nameof(TblVentaArticulo.Cliente))]
        public virtual ICollection<TblVentaArticulo> TblVentaArticulos { get; set; }
    }
}
