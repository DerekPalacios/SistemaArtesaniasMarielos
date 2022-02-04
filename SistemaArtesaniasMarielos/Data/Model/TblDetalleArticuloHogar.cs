using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleArticuloHogar")]
    public partial class TblDetalleArticuloHogar
    {
        [Key]
        [Column("Id_DetalleArticuloHogar")]
        public int Id { get; set; }
        [Column("Id_Articulo_DetalleHogar")]
        public int? IdArticulo { get; set; }
        [Column("Tamaño_DetalleHogar")]
        [StringLength(50)]
        public string Tamaño { get; set; }
        [Column("Material_DetalleHogar")]
        [StringLength(50)]
        public string Materiales { get; set; }
        [Column("Precio_DetalleHogar", TypeName = "decimal(16, 2)")]
        public decimal? Precio { get; set; } = 0;
        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleArticuloHogars))]
        public virtual TblArticulo Articulo { get; set; }
    }
}
