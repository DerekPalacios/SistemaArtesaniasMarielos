using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;
using SistemaArtesaniasMarielos.Data.Model;

#nullable disable

namespace SistemaArtesaniasMarielos.Data.Context
{
    public partial class ArtesaniasVentasArticulosComprasContext : DbContext
    {
        public ArtesaniasVentasArticulosComprasContext()
        {
        }

        public ArtesaniasVentasArticulosComprasContext(DbContextOptions<ArtesaniasVentasArticulosComprasContext> options)
            : base(options)
        {
        }
        public IConfiguration Configuration { get; }
        public virtual DbSet<TblArticulo> TblArticulos { get; set; }
        public virtual DbSet<TblCaracteristicaArticulo> TblCaracteristicaArticulos { get; set; }
        public virtual DbSet<TblCategoriaArticulo> TblCategoriaArticulos { get; set; }
        public virtual DbSet<TblCategoriaCaracteristicaArticulo> TblCategoriaCaracteristicaArticulos { get; set; }
        public virtual DbSet<TblCliente> TblClientes { get; set; }
        public virtual DbSet<TblCompraArticulo> TblCompraArticulos { get; set; }
        public virtual DbSet<TblConfiguracion> TblConfiguracions { get; set; }
        public virtual DbSet<TblDetalleArticuloArte> TblDetalleArticuloArtes { get; set; }
        public virtual DbSet<TblDetalleArticuloCalzado> TblDetalleArticuloCalzados { get; set; }
        public virtual DbSet<TblDetalleArticuloComplemento> TblDetalleArticuloComplementos { get; set; }
        public virtual DbSet<TblDetalleArticuloHogar> TblDetalleArticuloHogars { get; set; }
        public virtual DbSet<TblDetalleArticuloJuguete> TblDetalleArticuloJuguetes { get; set; }
        public virtual DbSet<TblDetalleArticuloTextil> TblDetalleArticuloTextils { get; set; }
        public virtual DbSet<TblDetalleCaracteristicaArticulo> TblDetalleCaracteristicaArticulos { get; set; }
        public virtual DbSet<TblDetalleCompraArticulo> TblDetalleCompraArticulos { get; set; }
        public virtual DbSet<TblDetalleVentaArticulo> TblDetalleVentaArticulos { get; set; }
        public virtual DbSet<TblInventarioArticulo> TblInventarioArticulos { get; set; }
        public virtual DbSet<TblProveedor> TblProveedors { get; set; }
        public virtual DbSet<TblRol> TblRols { get; set; }
        public virtual DbSet<TblUsuario> TblUsuarios { get; set; }
        public virtual DbSet<TblVentaArticulo> TblVentaArticulos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(Configuration.GetConnectionString("ArtesaniasVentasArticulosComprasContext"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<TblArticulo>(entity =>
            {
                entity.HasOne(d => d.IdCategoriaArticuloNavigation)
                    .WithMany(p => p.TblArticulos)
                    .HasForeignKey(d => d.IdCategoriaArticulo)
                    .HasConstraintName("FK_tbl_Articulo_tbl_CategoriaArticulo");
            });

            modelBuilder.Entity<TblCaracteristicaArticulo>(entity =>
            {
                entity.HasKey(e => e.IdCaracteristica)
                    .HasName("PK_tbl_CaracteristicasArticulos");

                entity.Property(e => e.NombreCaracteristica).IsFixedLength(true);
            });

            modelBuilder.Entity<TblCategoriaCaracteristicaArticulo>(entity =>
            {
                entity.HasKey(e => e.IdCategoriaCaracteristicaArticulo)
                    .HasName("PK_tbl_CategoriasCaracteristicasArticulos");

                entity.HasOne(d => d.IdCaracteristicaArticuloNavigation)
                    .WithMany(p => p.TblCategoriaCaracteristicaArticulos)
                    .HasForeignKey(d => d.IdCaracteristicaArticulo)
                    .HasConstraintName("FK_tbl_CategoriasCaracteristicasArticulos_tbl_CaracteristicasArticulos");

                entity.HasOne(d => d.IdCategoriaArticuloNavigation)
                    .WithMany(p => p.TblCategoriaCaracteristicaArticulos)
                    .HasForeignKey(d => d.IdCategoriaArticulo)
                    .HasConstraintName("FK_tbl_CategoriasCaracteristicasArticulos_tbl_CategoriasArticulos");
            });

            modelBuilder.Entity<TblCompraArticulo>(entity =>
            {
                entity.HasOne(d => d.IdProveedorCompraNavigation)
                    .WithMany(p => p.TblCompraArticulos)
                    .HasForeignKey(d => d.IdProveedorCompra)
                    .HasConstraintName("FK_tbl_CompraArticulo_tbl_Proveedor");
            });

            modelBuilder.Entity<TblConfiguracion>(entity =>
            {
                entity.Property(e => e.ConfCorreo).IsUnicode(false);

                entity.Property(e => e.ConfDireccion).IsUnicode(false);

                entity.Property(e => e.ConfEncabezadoFactura).IsUnicode(false);

                entity.Property(e => e.ConfTelefono).IsUnicode(false);

                entity.Property(e => e.NRuc).IsUnicode(false);

                entity.Property(e => e.NombrePropietario).IsUnicode(false);

                entity.Property(e => e.NombreTienda).IsUnicode(false);
            });

            modelBuilder.Entity<TblDetalleArticuloArte>(entity =>
            {
                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleArticuloArtes)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK_tbl_DetalleArticuloArte_tbl_Articulo");
            });

            modelBuilder.Entity<TblDetalleArticuloCalzado>(entity =>
            {
                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleArticuloCalzados)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK_tbl_DetalleArticuloCalzado_tbl_Articulo");
            });

            modelBuilder.Entity<TblDetalleArticuloComplemento>(entity =>
            {
                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleArticuloComplementos)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK_tbl_DetalleArticuloComplemento_tbl_Articulo");
            });

            modelBuilder.Entity<TblDetalleArticuloHogar>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleArticuloHogars)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK_tbl_DetalleArticuloHogar_tbl_Articulo");
            });

            modelBuilder.Entity<TblDetalleArticuloJuguete>(entity =>
            {
                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleArticuloJuguetes)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK_tbl_DetalleArticuloJuguete_tbl_Articulo");
            });

            modelBuilder.Entity<TblDetalleArticuloTextil>(entity =>
            {
                entity.HasKey(e => e.Id)
                    .HasName("PK__tbl_Deta__E5A56179321B2A94");

                entity.Property(e => e.Numeracion).IsUnicode(false);

                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleArticuloTextils)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK__tbl_Detal__Id_Ar__36B12243");
            });

            modelBuilder.Entity<TblDetalleCaracteristicaArticulo>(entity =>
            {
                entity.HasOne(d => d.Caracteristica)
                    .WithMany(p => p.TblDetalleCaracteristicaArticulos)
                    .HasForeignKey(d => d.IdCaracteristica)
                    .HasConstraintName("FK_tbl_DetalleCaracteristicaArticulo_tbl_CaracteristicaArticulo");
            });

            modelBuilder.Entity<TblDetalleCompraArticulo>(entity =>
            {
                entity.Ignore(det => det.DetallesArticulo);
                entity.HasOne(d => d.ArticuloDetalleCompra)
                    .WithMany(p => p.TblDetalleCompraArticulos)
                    .HasForeignKey(d => d.IdArticuloDetalleCompra)
                    .HasConstraintName("FK_tbl_DetalleCompraArticulo_tbl_Articulo");

                entity.HasOne(d => d.IdCompraDetalleCompraNavigation)
                    .WithMany(p => p.TblDetalleCompraArticulos)
                    .HasForeignKey(d => d.IdCompraDetalleCompra)
                    .HasConstraintName("FK_tbl_DetalleCompraArticulo_tbl_CompraArticulo");
            });

            modelBuilder.Entity<TblDetalleVentaArticulo>(entity =>
            {
                entity.Ignore(det => det.DetallesArticulo);
                entity.HasOne(d => d.Articulo)
                    .WithMany(p => p.TblDetalleVentaArticulos)
                    .HasForeignKey(d => d.IdArticulo)
                    .HasConstraintName("FK_tbl_DetalleVentaArticulo_tbl_Articulo");

                entity.HasOne(d => d.VentaArticulo)
                    .WithMany(p => p.ListaDetalleVenta)
                    .HasForeignKey(d => d.IdVenta)
                    .HasConstraintName("FK_tbl_DetalleVentaArticulo_tbl_VentaArticulo");
            });

            modelBuilder.Entity<TblInventarioArticulo>(entity =>
            {
                entity.HasOne(d => d.IdArticuloInventarioNavigation)
                    .WithMany(p => p.TblInventarioArticulos)
                    .HasForeignKey(d => d.IdArticuloInventario)
                    .HasConstraintName("FK_tbl_InventarioArticulo_tbl_Articulo");
            });

            modelBuilder.Entity<TblProveedor>(entity =>
            {
                entity.Property(e => e.NombreEmpresa).IsFixedLength(true);

                entity.Property(e => e.NombreProveedor).IsFixedLength(true);
            });

            modelBuilder.Entity<TblRol>(entity =>
            {
                entity.Property(e => e.NombreRol).IsUnicode(false);
            });

            modelBuilder.Entity<TblUsuario>(entity =>
            {
                entity.Property(e => e.Apellidos).IsUnicode(false);

                entity.Property(e => e.Clave).IsUnicode(false);

                entity.Property(e => e.ConfirmarClave).IsUnicode(false);

                entity.Property(e => e.NombreUsuario).IsUnicode(false);

                entity.Property(e => e.Nombres).IsUnicode(false);

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.TblUsuarios)
                    .HasForeignKey(d => d.IdRol)
                    .HasConstraintName("FK_TblUsuario_TblRol");
            });

            modelBuilder.Entity<TblVentaArticulo>(entity =>
            {
                //entity.Property(e => e.IdVenta).ValueGeneratedNever();

                entity.HasOne(d => d.Cliente)
                    .WithMany(p => p.TblVentaArticulos)
                    .HasForeignKey(d => d.IdCliente)
                    .HasConstraintName("FK_tbl_VentaArticulo_tbl_Cliente");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
