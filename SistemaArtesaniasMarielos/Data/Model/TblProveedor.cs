using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_Proveedor")]
    public partial class TblProveedor
    {
        public TblProveedor()
        {
            TblCompraArticulos = new HashSet<TblCompraArticulo>();
        }

        [Key]
        [Column("Id_Proveedor")]
        public int IdProveedor { get; set; }
        [Column("Nombre_Proveedor")]
        [StringLength(10)]
        public string NombreProveedor { get; set; }
        [Column("Nombre_Empresa")]
        [StringLength(10)]
        public string NombreEmpresa { get; set; }
        [Column("Telefono_Proveedor")]
        [StringLength(11)]
        public string TelefonoProveedor { get; set; }

        [InverseProperty(nameof(TblCompraArticulo.IdProveedorCompraNavigation))]
        public virtual ICollection<TblCompraArticulo> TblCompraArticulos { get; set; }
    }
}
