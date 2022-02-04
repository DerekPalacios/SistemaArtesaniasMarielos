using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleArticuloArte")]
    public partial class TblDetalleArticuloArte
    {
        [Key]
        [Column("Id_DetalleArticuloArte")]
        public int Id { get; set; }
        [Column("Id_Articulo_DetalleArte")]
        public int? IdArticulo { get; set; }
        [Column("Tamaño_DetalleArte")]
        [StringLength(50)]
        public string Tamaño { get; set; }
        [Column("Material_DetalleArte")]
        [StringLength(50)]
        public string Materiales { get; set; }
        [Column("Precio_DetalleArte", TypeName = "decimal(16, 2)")]
        public decimal? Precio { get; set; } = 0;

        [ForeignKey(nameof(IdArticulo))]
        [InverseProperty(nameof(TblArticulo.TblDetalleArticuloArtes))]
        public virtual TblArticulo Articulo { get; set; }
    }
}
