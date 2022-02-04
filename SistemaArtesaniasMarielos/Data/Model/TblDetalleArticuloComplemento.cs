using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleArticuloComplemento")]
    public partial class TblDetalleArticuloComplemento
    {
        [Key]
        [Column("Id_DetalleArticuloComplemento")]
        public int Id { get; set; }
        [Column("Id_Articulo_DetalleComplemento")]
        public int? IdArticulo{ get; set; }
        [Column("Tamaño_DetalleComplemento")]
        [StringLength(50)]
        public string Tamaño { get; set; }
        [Column("Genero_DetalleComplemento")]
        [StringLength(50)]
        public string Genero { get; set; }
        [Column("CategoriaPersona_DetalleComplemento")]
        [StringLength(50)]
        public string CategoriaPersona { get; set; }
        [Column("Material_DetalleComplemento")]
        [StringLength(50)]
        public string Materiales { get; set; }
        [Column("Precio_DetalleComplemento", TypeName = "decimal(16, 2)")]
        public decimal? Precio { get; set; } = 0;
        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleArticuloComplementos))]
        public virtual TblArticulo Articulo { get; set; }
    }
}
