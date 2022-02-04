using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_CategoriaCaracteristicaArticulo")]
    public partial class TblCategoriaCaracteristicaArticulo
    {
        [Key]
        [Column("Id_CategoriaCaracteristicaArticulo")]
        public int IdCategoriaCaracteristicaArticulo { get; set; }
        [Column("Id_CategoriaArticulo")]
        public int? IdCategoriaArticulo { get; set; }
        [Column("Id_CaracteristicaArticulo")]
        public int? IdCaracteristicaArticulo { get; set; }

        [ForeignKey(nameof(IdCaracteristicaArticulo))]
        [InverseProperty(nameof(TblCaracteristicaArticulo.TblCategoriaCaracteristicaArticulos))]
        public virtual TblCaracteristicaArticulo IdCaracteristicaArticuloNavigation { get; set; }
        [ForeignKey(nameof(IdCategoriaArticulo))]
        [InverseProperty(nameof(TblCategoriaArticulo.TblCategoriaCaracteristicaArticulos))]
        public virtual TblCategoriaArticulo IdCategoriaArticuloNavigation { get; set; }
    }
}
