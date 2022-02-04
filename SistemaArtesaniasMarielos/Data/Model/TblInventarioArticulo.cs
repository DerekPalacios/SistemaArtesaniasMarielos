using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_InventarioArticulo")]
    public partial class TblInventarioArticulo
    {
        [Key]
        [Column("Id_Inventario")]
        public int IdInventario { get; set; }
        [Column("Id_Articulo_Inventario")]
        public int? IdArticuloInventario { get; set; }
        [Column("Id_DetalleArticulo_Inventario")]
        public int? IdDetalleArticuloInventario { get; set; }
        [Column("Stock_Inventario")]
        public int? StockInventario { get; set; }
        [Column("PrecioStock_Inventario", TypeName = "decimal(15, 2)")]
        public decimal? PrecioStockInventario { get; set; }

        [ForeignKey(nameof(IdArticuloInventario))]
        [InverseProperty(nameof(TblArticulo.TblInventarioArticulos))]
        public virtual TblArticulo IdArticuloInventarioNavigation { get; set; }
    }
}
