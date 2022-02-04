using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;
using SistemaArtesaniasMarielos.Data.Sub_Models;
#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleVentaArticulo")]
    public partial class TblDetalleVentaArticulo
    {
        [Key]
        [Column("Id_DetalleVenta")]
        public int IdDetalleVenta { get; set; }
        [Column("Id_Articulo_DetalleVenta")]
        public int? IdArticulo { get; set; }
        [Column("Id_DertalleArticulo_DetalleVenta")]
        public int? IdDetalleArticulo { get; set; }
        [Column("Cantidad_DetalleVenta")]
        public int Cantidad { get; set; }
        [Column("Id_VentaArticulo_DetalleVenta")]
        public int? IdVenta { get; set; }
        [Column("Descuento_DetalleVenta", TypeName = "decimal(16, 2)")]
        public decimal? Descuento { get; set; }

        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleVentaArticulos))]
        public virtual TblArticulo Articulo { get; set; }
        [ForeignKey(nameof(IdVenta))]
        [InverseProperty(nameof(TblVentaArticulo.ListaDetalleVenta))]
        public virtual TblVentaArticulo VentaArticulo { get; set; }
        public DetallesArticulos DetallesArticulo { get; set; }

        public decimal PrecioTotal;
    }
}
