using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_CaracteristicaArticulo")]
    public partial class TblCaracteristicaArticulo
    {
        public TblCaracteristicaArticulo()
        {
            TblCategoriaCaracteristicaArticulos = new HashSet<TblCategoriaCaracteristicaArticulo>();
            TblDetalleCaracteristicaArticulos = new HashSet<TblDetalleCaracteristicaArticulo>();
        }

        [Key]
        [Column("Id_Caracteristica")]
        public int IdCaracteristica { get; set; }
        [Column("Nombre_Caracteristica")]
        [StringLength(50)]
        public string NombreCaracteristica { get; set; }

        [InverseProperty(nameof(TblCategoriaCaracteristicaArticulo.IdCaracteristicaArticuloNavigation))]
        public virtual ICollection<TblCategoriaCaracteristicaArticulo> TblCategoriaCaracteristicaArticulos { get; set; }
        [InverseProperty(nameof(TblDetalleCaracteristicaArticulo.Caracteristica))]
        public virtual ICollection<TblDetalleCaracteristicaArticulo> TblDetalleCaracteristicaArticulos { get; set; }
    }
}
