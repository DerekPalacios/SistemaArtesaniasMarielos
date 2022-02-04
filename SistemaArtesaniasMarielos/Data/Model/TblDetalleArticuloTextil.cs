using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleArticuloTextil")]
    public partial class TblDetalleArticuloTextil
    {
        [Key]
        [Column("Id_DetalleArticuloTextil")]
        public int Id { get; set; }
        [Column("Id_Articulo_DetalleTextil")]
        public int? IdArticulo { get; set; }
        [Column("Talla_DetalleTextil")]
        [StringLength(50)]
        public string Talla { get; set; } = "S/T";
        [Column("Material_DetalleTextil")]
        [StringLength(50)]
        public string Materiales { get; set; }
        [Column("Genero_DetalleTextil")]
        [StringLength(50)]
        public string Genero { get; set; }
        [Column("CategoriaPersona_DetalleTextil")]
        [StringLength(50)]
        public string CategoriaPersona { get; set; }
        [Column("Numeracion_DetalleTextil")]
        [StringLength(10)]
        public string Numeracion { get; set; } = "S/N";
        [Column("Precio_DetalleTextil", TypeName = "decimal(15, 2)")]
        public decimal? Precio { get; set; } = 0;

        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleArticuloTextils))]
        public virtual TblArticulo Articulo { get; set; }
    }
}
