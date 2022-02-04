using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_DetalleCaracteristicaArticulo")]
    public partial class TblDetalleCaracteristicaArticulo
    {
        [Key]
        [Column("Id_DetalleCaracteristicaArticulo")]
        public int IdDetalle { get; set; }
        [Column("Id_Caracteristica_DetalleCaracteristicaArticulo")]
        public int? IdCaracteristica { get; set; }
        [Column("Detalle_DetalleCaracterisrticaArticulo")]
        [StringLength(100)]
        public string NombreDetalle { get; set; }

        [ForeignKey(nameof(IdCaracteristica))]
        [InverseProperty(nameof(TblCaracteristicaArticulo.TblDetalleCaracteristicaArticulos))]
        public virtual TblCaracteristicaArticulo Caracteristica { get; set; }
    }
}
