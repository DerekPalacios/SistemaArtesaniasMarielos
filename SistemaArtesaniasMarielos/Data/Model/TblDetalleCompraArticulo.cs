using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using SistemaArtesaniasMarielos.Data.Sub_Models;
#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleCompraArticulo")]
    public partial class TblDetalleCompraArticulo
    {
        [Key]
        [Column("Id_DetalleCompra")]
        public int IdDetalleCompra { get; set; }
        [Column("Id_Articulo_DetalleCompra")]
        public int? IdArticuloDetalleCompra { get; set; }
        [Column("Id_DetalleArticulo")]
        public int? IdDetalleArticulo { get; set; }
        [Column("Cantidad_DetalleCompra")]
        public int? CantidadDetalleCompra { get; set; } = 0;
        [Column("Id_Compra_DetalleCompra")]
        public int? IdCompraDetalleCompra { get; set; }
        [Column("Descuento_DetalleCompra", TypeName = "decimal(16, 2)")]
        public decimal? DescuentoDetalleCompra { get; set; } = 0;


        [ForeignKey(nameof(IdArticuloDetalleCompra))]
        [InverseProperty(nameof(TblArticulo.TblDetalleCompraArticulos))]
        public virtual TblArticulo ArticuloDetalleCompra { get; set; }
        [ForeignKey(nameof(IdCompraDetalleCompra))]
        [InverseProperty(nameof(TblCompraArticulo.TblDetalleCompraArticulos))]
        public virtual TblCompraArticulo IdCompraDetalleCompraNavigation { get; set; }

        public decimal PrecioTotal = 0;
        public DetallesArticulos DetallesArticulo { get; set; }
    }
}
