using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SistemaArtesaniasMarielos.Data.Context;
using SistemaArtesaniasMarielos.Data.Model;
using SistemaArtesaniasMarielos.Data.Sub_Models;


namespace SistemaArtesaniasMarielos.Data.Service
{
    public class CompraService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;
        public CompraService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }
        public List<TblProveedor> GetProveedores() => _context.TblProveedors.ToList();

        public int getUltimoNumFactura()
        {
            int? numVenta = _context.TblCompraArticulos.OrderBy(compras => compras.NumeroCompra).LastOrDefault()?.NumeroCompra;
            if (numVenta.HasValue)
            {
                return (int)numVenta + 1;
            }
            return 1;
        }

        public List<TblArticulo> GetArticulos()
        {
            return _context.TblArticulos.ToList();
        }

        public List<TblCategoriaArticulo> GetCategoriaArticulos()
        {
            return _context.TblCategoriaArticulos.ToList();
        }

        //get detalles de las categorias

        public List<DetallesArticulos> getDetallesHogarSimple()
        {
            var detallesModels = GetArticuloHogar().Select(det => new DetallesArticulos()
            {
                DetallesArticulo = det.Tamaño + ", " + det.Materiales,
                NombreArticulo = det.Articulo.NombreArticulo,
                IdArticulo = (int)det.IdArticulo,
                IdDetalle = det.Id,
                Precio = (decimal)det.Precio,
                DescripcionArticulo = det.Articulo.DescripcionArticulo
            })
                .ToList();

            return detallesModels;
        }

        public List<DetallesArticulos> getDetallesSimple(int idArt)
        {
            List<DetallesArticulos> detalles = new List<DetallesArticulos>();
            detalles.AddRange(GetArticuloHogar()
                .FindAll(det => det.IdArticulo == idArt)
                .Select(newDetail => new DetallesArticulos
                {
                    DetallesArticulo = newDetail.Materiales + ", " + newDetail.Tamaño,
                    NombreArticulo = newDetail.Articulo.NombreArticulo,
                    IdArticulo = (int)newDetail.IdArticulo,
                    IdDetalle = newDetail.Id,
                    DescripcionArticulo = newDetail.Articulo.DescripcionArticulo,
                    Precio = (decimal)newDetail.Precio

                }));
            detalles.AddRange(GetArticuloArtes()
                .FindAll(det => det.IdArticulo == idArt)
                .Select(newDetail => new DetallesArticulos
                {
                    DetallesArticulo = newDetail.Materiales + ", " + newDetail.Tamaño,
                    IdArticulo = (int)newDetail.IdArticulo,
                    DescripcionArticulo = newDetail.Articulo.DescripcionArticulo,
                    IdDetalle = newDetail.Id,
                    Precio = (decimal)newDetail.Precio

                }));
            detalles.AddRange(GetArticuloJuguetes()
                .FindAll(det => det.IdArticulo == idArt)
                .Select(newDetail => new DetallesArticulos
                {
                    DetallesArticulo = newDetail.Materiales + ", " + newDetail.Tamaño + ", " + newDetail.Genero + ", " + newDetail.CategoriaPersona,
                    NombreArticulo = newDetail.Articulo.NombreArticulo,
                    IdArticulo = (int)newDetail.IdArticulo,
                    DescripcionArticulo = newDetail.Articulo.DescripcionArticulo,
                    IdDetalle = newDetail.Id,
                    Precio = (decimal)newDetail.Precio

                }));
            detalles.AddRange(GetArticuloCalzados()
                .FindAll(det => det.IdArticulo == idArt)
                .Select(newDetail => new DetallesArticulos
                {
                    DetallesArticulo = newDetail.Materiales + ", " + newDetail.Genero + ", " + newDetail.CategoriaPersona + ", " + newDetail.Numeracion,
                    NombreArticulo = newDetail.Articulo.NombreArticulo,
                    IdArticulo = (int)newDetail.IdArticulo,
                    IdDetalle = newDetail.Id,
                    DescripcionArticulo = newDetail.Articulo.DescripcionArticulo,

                    Precio = (decimal)newDetail.Precio

                }));
            detalles.AddRange(GetArticuloComplementos()
                .FindAll(det => det.IdArticulo == idArt)
                .Select(newDetail => new DetallesArticulos
                {
                    DetallesArticulo = newDetail.Materiales + ", " + newDetail.Tamaño + ", " + newDetail.Genero + ", " + newDetail.CategoriaPersona,
                    NombreArticulo = newDetail.Articulo.NombreArticulo,
                    IdArticulo = (int)newDetail.IdArticulo,
                    DescripcionArticulo = newDetail.Articulo.DescripcionArticulo,
                    IdDetalle = newDetail.Id,
                    Precio = (decimal)newDetail.Precio

                }));
            detalles.AddRange(GetArticuloTextiles()
                .FindAll(det => det.IdArticulo == idArt)
                .Select(newDetail => new DetallesArticulos
                {
                    DetallesArticulo = newDetail.Materiales + ", " + newDetail.Genero + ", " + newDetail.CategoriaPersona + ", " + newDetail.Talla + ", " + newDetail.Numeracion,
                    NombreArticulo = newDetail.Articulo.NombreArticulo,
                    IdArticulo = (int)newDetail.IdArticulo,
                    IdDetalle = newDetail.Id,
                    DescripcionArticulo = newDetail.Articulo.DescripcionArticulo,

                    Precio = (decimal)newDetail.Precio

                }));
            return detalles;
        }

        public List<TblDetalleArticuloArte> GetArticuloArtes()
        {
            return _context.TblDetalleArticuloArtes.Include("Articulo").ToList();
        }

        public List<TblDetalleArticuloHogar> GetArticuloHogar()
        {
            return _context.TblDetalleArticuloHogars.Include("Articulo").ToList();
        }

        public List<TblDetalleArticuloCalzado> GetArticuloCalzados()
        {
            return _context.TblDetalleArticuloCalzados.Include("Articulo").ToList();
        }

        public List<TblDetalleArticuloComplemento> GetArticuloComplementos()
        {
            return _context.TblDetalleArticuloComplementos.Include("Articulo").ToList();
        }

        public List<TblDetalleArticuloJuguete> GetArticuloJuguetes()
        {
            return _context.TblDetalleArticuloJuguetes.Include("Articulo").ToList();
        }

        public List<TblDetalleArticuloTextil> GetArticuloTextiles()
        {
            return _context.TblDetalleArticuloTextils.Include("Articulo").ToList();
        }

        //guardar Factura de Compra
        public bool guardarFactura(TblCompraArticulo CompraModel, List<DetallesArticulos> Articulos)
        {
            try
            {
                Articulos.ToList().ForEach(Articulo => {
                    CompraModel.TblDetalleCompraArticulos.Add(new TblDetalleCompraArticulo
                    {
                        IdArticuloDetalleCompra = Articulo.IdArticulo,
                        CantidadDetalleCompra = Articulo.Cantidad,
                        DescuentoDetalleCompra=Articulo.Descuento,
                        IdDetalleArticulo=Articulo.IdDetalle,
                        PrecioTotal=Articulo.PrecioTotal,
                    });
                });
                CompraModel.TblDetalleCompraArticulos.ToList().ForEach(x =>
                {
                    TblInventarioArticulo inventario = _context.TblInventarioArticulos.FirstOrDefault(inventario =>
                        (inventario.IdArticuloInventario == x.IdArticuloDetalleCompra && inventario.IdDetalleArticuloInventario == x.IdDetalleArticulo)
                    );
                    if (inventario != null)
                    {
                        _context.TblInventarioArticulos.Find(inventario.IdInventario).StockInventario = _context.TblInventarioArticulos.Find(inventario.IdInventario).StockInventario + x.CantidadDetalleCompra;
                        _context.TblInventarioArticulos.Find(inventario.IdInventario).PrecioStockInventario = _context.TblInventarioArticulos.Find(inventario.IdInventario).PrecioStockInventario + x.PrecioTotal;
                    }
                    else
                    {
                        _context.TblInventarioArticulos.Add(new TblInventarioArticulo()
                        {
                            IdArticuloInventario = x.IdArticuloDetalleCompra,
                            IdDetalleArticuloInventario = x.IdDetalleArticulo,
                            StockInventario = x.CantidadDetalleCompra,
                            PrecioStockInventario = CompraModel.PrecioTotalCompra
                        }) ;
                    }
                });
                _context.TblCompraArticulos.Add(CompraModel);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //guardar Proveedor desde vista compra
        bool guardarProveedorCompra(TblProveedor newProveedor)
        {
            try
            {
                _context.TblProveedors.Add(newProveedor);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
   
    }
}

