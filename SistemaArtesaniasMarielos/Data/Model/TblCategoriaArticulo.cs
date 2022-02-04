using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_CategoriaArticulo")]
    public partial class TblCategoriaArticulo
    {
        public TblCategoriaArticulo()
        {
            TblArticulos = new HashSet<TblArticulo>();
            TblCategoriaCaracteristicaArticulos = new HashSet<TblCategoriaCaracteristicaArticulo>();
        }

        [Key]
        [Column("Id_Categoria")]
        public int IdCategoria { get; set; }
        [Column("Nombre_Categoria")]
        [StringLength(50)]
        public string NombreCategoria { get; set; }
        [Column("Descripcion_Categoria")]
        [StringLength(200)]
        public string DescripcionCategoria { get; set; }

        [InverseProperty(nameof(TblArticulo.IdCategoriaArticuloNavigation))]
        public virtual ICollection<TblArticulo> TblArticulos { get; set; }
        [InverseProperty(nameof(TblCategoriaCaracteristicaArticulo.IdCategoriaArticuloNavigation))]
        public virtual ICollection<TblCategoriaCaracteristicaArticulo> TblCategoriaCaracteristicaArticulos { get; set; }
    }
}
