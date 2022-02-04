using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Model
{
    [Table("tbl_Articulo")]
    public partial class TblArticulo
    {
        public TblArticulo()
        {
            TblDetalleArticuloArtes = new HashSet<TblDetalleArticuloArte>();
            TblDetalleArticuloCalzados = new HashSet<TblDetalleArticuloCalzado>();
            TblDetalleArticuloComplementos = new HashSet<TblDetalleArticuloComplemento>();
            TblDetalleArticuloHogars = new HashSet<TblDetalleArticuloHogar>();
            TblDetalleArticuloJuguetes = new HashSet<TblDetalleArticuloJuguete>();
            TblDetalleArticuloTextils = new HashSet<TblDetalleArticuloTextil>();
            TblDetalleCompraArticulos = new HashSet<TblDetalleCompraArticulo>();
            TblDetalleVentaArticulos = new HashSet<TblDetalleVentaArticulo>();
            TblInventarioArticulos = new HashSet<TblInventarioArticulo>();
        }

        [Key]
        [Column("Id_Articulo")]
        public int IdArticulo { get; set; }
        [Column("Codigo_Articulo")]
        [StringLength(10)]
        public string CodigoArticulo { get; set; }
        [Column("Nombre_Articulo")]
        [StringLength(50)]
        public string NombreArticulo { get; set; }
        [Column("Descripcion_Articulo")]
        [StringLength(200)]
        public string DescripcionArticulo { get; set; }
        [Column("Id_Categoria_Articulo")]
        public int? IdCategoriaArticulo { get; set; }
 
        [ForeignKey(nameof(IdCategoriaArticulo))]
        [InverseProperty(nameof(TblCategoriaArticulo.TblArticulos))]
        public virtual TblCategoriaArticulo IdCategoriaArticuloNavigation { get; set; }
        [InverseProperty(nameof(TblDetalleArticuloArte.Articulo))]
        public virtual ICollection<TblDetalleArticuloArte> TblDetalleArticuloArtes { get; set; }
        [InverseProperty(nameof(TblDetalleArticuloCalzado.Articulo))]
        public virtual ICollection<TblDetalleArticuloCalzado> TblDetalleArticuloCalzados { get; set; }
        [InverseProperty(nameof(TblDetalleArticuloComplemento.Articulo))]
        public virtual ICollection<TblDetalleArticuloComplemento> TblDetalleArticuloComplementos { get; set; }
        [InverseProperty(nameof(TblDetalleArticuloHogar.Articulo))]
        public virtual ICollection<TblDetalleArticuloHogar> TblDetalleArticuloHogars { get; set; }
        [InverseProperty(nameof(TblDetalleArticuloJuguete.Articulo))]
        public virtual ICollection<TblDetalleArticuloJuguete> TblDetalleArticuloJuguetes { get; set; }
        [InverseProperty(nameof(TblDetalleArticuloTextil.Articulo))]
        public virtual ICollection<TblDetalleArticuloTextil> TblDetalleArticuloTextils { get; set; }
        [InverseProperty(nameof(TblDetalleCompraArticulo.ArticuloDetalleCompra))]
        public virtual ICollection<TblDetalleCompraArticulo> TblDetalleCompraArticulos { get; set; }
        [InverseProperty(nameof(TblDetalleVentaArticulo.Articulo))]
        public virtual ICollection<TblDetalleVentaArticulo> TblDetalleVentaArticulos { get; set; }
        [InverseProperty(nameof(TblInventarioArticulo.IdArticuloInventarioNavigation))]
        public virtual ICollection<TblInventarioArticulo> TblInventarioArticulos { get; set; }
    }
}
