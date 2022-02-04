using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleArticuloCalzado")]
    public partial class TblDetalleArticuloCalzado
    {
        [Key]
        [Column("Id_DetalleArticulocalzado")]
        public int Id { get; set; }
        [Column("Id_Articulo_DetalleCalzado")]
        public int? IdArticulo { get; set; }
        [Column("Genero_DetalleCalzado")]
        [StringLength(50)]
        public string Genero { get; set; }
        [Column("CategoriaPersona_DetalleCalzado")]
        [StringLength(50)]
        public string CategoriaPersona { get; set; }
        [Column("Material_DetalleCalzado")]
        [StringLength(50)]
        public string Materiales { get; set; }
        [Column("Numeracion_DetalleCalzado")]
        [StringLength(50)]
        public string Numeracion { get; set; }
        [Column("Precio_DetalleCalzado", TypeName = "decimal(16, 2)")]
        public decimal? Precio { get; set; } = 0;
        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleArticuloCalzados))]
        public virtual TblArticulo Articulo { get; set; }
    }
}
