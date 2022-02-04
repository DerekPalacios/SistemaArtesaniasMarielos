using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_VentaArticulo")]
    public partial class TblVentaArticulo
    {
        public TblVentaArticulo()
        {
            ListaDetalleVenta = new HashSet<TblDetalleVentaArticulo>();
        }

        [Key]
        [Column("Id_Venta")]
        public int IdVenta { get; set; }
        [Column("Numero_Venta")]
        public int? NumeroVenta { get; set; }
        [Column("Fecha_Venta", TypeName = "date")]
        public DateTime FechaVenta { get; set; }
        [Column("Id_Cliente")]
        public int? IdCliente { get; set; }
        [Column("Precio_Venta", TypeName = "decimal(16, 2)")]
        public decimal PrecioVenta { get; set; } = 0;
        [Column("Recibido_Venta", TypeName = "decimal(16, 2)")]
        public decimal? RecibidoVenta { get; set; } = 0;
        [Column("IVA_Venta", TypeName = "decimal(4, 2)")]
        public decimal? IvaVenta { get; set; } = 15;

        [ForeignKey(nameof(IdCliente))]
        [InverseProperty(nameof(TblCliente.TblVentaArticulos))]
        public virtual TblCliente Cliente { get; set; }
        [InverseProperty(nameof(TblDetalleVentaArticulo.VentaArticulo))]
        public virtual ICollection<TblDetalleVentaArticulo> ListaDetalleVenta { get; set; }
    }
}
