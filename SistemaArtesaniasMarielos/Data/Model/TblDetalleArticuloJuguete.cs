using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleArticuloJuguete")]
    public partial class TblDetalleArticuloJuguete
    {
        [Key]
        [Column("Id_DetalleArticuloJuguete")]
        public int Id { get; set; }
        [Column("Id_Articulo_DetalleJuguete")]
        public int? IdArticulo { get; set; }
        [Column("Tamaño_DetalleJuguete")]
        [StringLength(50)]
        public string Tamaño { get; set; }
        [Column("Genero_DetalleJuguete")]
        [StringLength(50)]
        public string Genero { get; set; }
        [Column("CategoriaPersona_DetalleJuguete")]
        [StringLength(50)]
        public string CategoriaPersona { get; set; }
        [Column("Material_DetalleJuguete")]
        [StringLength(50)]
        public string Materiales { get; set; }
        [Column("Precio_DetalleJuguete", TypeName = "decimal(15, 2)")]
        public decimal? Precio { get; set; } = 0;
        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleArticuloJuguetes))]
        public virtual TblArticulo Articulo { get; set; }
    }
}
