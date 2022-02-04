using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_CompraArticulo")]
    public partial class TblCompraArticulo
    {
        public TblCompraArticulo()
        {
            TblDetalleCompraArticulos = new HashSet<TblDetalleCompraArticulo>();
        }

        [Key]
        [Column("Id_Compra")]
        public int IdCompra { get; set; }
        [Column("Numero_Compra")]
        public int? NumeroCompra { get; set; }
        [Column("Fecha_Compra", TypeName = "date")]
        public DateTime? FechaCompra { get; set; }
        [Column("Id_Proveedor_Compra")]
        public int? IdProveedorCompra { get; set; }
        [Column("PrecioTotal_Compra", TypeName = "decimal(16, 2)")]
        public decimal? PrecioTotalCompra { get; set; }=0;
        [Column("IVA_Compra")]
        public int? IvaCompra { get; set; } = 15;

        [ForeignKey(nameof(IdProveedorCompra))]
        [InverseProperty(nameof(TblProveedor.TblCompraArticulos))]
        public virtual TblProveedor IdProveedorCompraNavigation { get; set; }
        [InverseProperty(nameof(TblDetalleCompraArticulo.IdCompraDetalleCompraNavigation))]
        public virtual ICollection<TblDetalleCompraArticulo> TblDetalleCompraArticulos { get; set; }
    }
}
