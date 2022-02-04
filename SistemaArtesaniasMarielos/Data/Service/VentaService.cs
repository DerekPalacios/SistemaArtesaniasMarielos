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
    public class VentaService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;
        public VentaService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }

        public List<TblCliente> GetClientes() => _context.TblClientes.ToList();

        public int getUltimoNumVenta()
        {
            int? numVenta = _context.TblVentaArticulos.OrderBy(venta => venta.NumeroVenta).LastOrDefault()?.NumeroVenta;
            if (numVenta.HasValue)
            {
                return (int)numVenta + 1;
            }
            return 1;
        }

        //articulos que estan en inventario
        public List<TblArticulo> GetArticulosInventariados()
        {
            var articuloInventariado = from Articulo in _context.TblArticulos
                                       join Inventario in _context.TblInventarioArticulos on Articulo.IdArticulo equals Inventario.IdArticuloInventario
                                       select Articulo;

            return articuloInventariado.ToList();
        }

        //public List<TblCategoriaArticulo> GetCategoriaArticulosInventariados()
        //{
        //    var categoriaInventariado=from Categoria in _context.TblCategoriaArticulos
        //              join Articulo in _context.TblArticulos on Categoria.IdCategoria equals Articulo.IdCategoriaArticulo
        //              join Inventario in _context.TblInventarioArticulos on Articulo.IdArticulo equals Inventario.IdArticuloInventario
        //              select Categoria;
            
        //    return categoriaInventariado.ToList();

        //}

         public List<TblCategoriaArticulo> GetCategoriaArticulos()
        {
            return _context.TblCategoriaArticulos.ToList();
        }
        //get detalles de las categorias

        public List<DetallesArticulos> getDetallesSimpleInventariados(int idcategoria)
        {

            List<DetallesArticulos> detalles = new List<DetallesArticulos>();
            switch (idcategoria)
            {
                case 1:
                    detalles =GetDetallesHogarInventariadosSimple();
                    break;

                case 2:
                    detalles  =GetDetallesTextilInventariados();
                    break;
                case 3:
                    detalles= GetDetallesArteInventariados();
                    break;
                case 4:
                    detalles=  GetDetallesJugueteInventariados();
                    break;
                case 5:
                    detalles=  GetDetallesCalzadoInventariados();
                    break;
                case 6:
                    detalles=  GetDetallesComplementoInventariados();
                    break;

            }
            return detalles.ToList();
        }


        private List<DetallesArticulos> GetDetallesHogarInventariadosSimple()
        {

            var detallesInventario = from det in _context.TblDetalleArticuloHogars
                                     join Articulo in _context.TblArticulos on det.IdArticulo equals Articulo.IdArticulo
                                     join Inventario in _context.TblInventarioArticulos on det.Id equals Inventario.IdDetalleArticuloInventario
                                     where Inventario.IdArticuloInventario == Articulo.IdArticulo && Inventario.IdDetalleArticuloInventario == det.Id
                                     select new DetallesArticulos
                                     {
                                         DetallesArticulo = det.Materiales + ", " + det.Tamaño,
                                         NombreArticulo = det.Articulo.NombreArticulo,
                                         IdArticulo = (int)det.IdArticulo,
                                         IdDetalle = det.Id,
                                         DescripcionArticulo = det.Articulo.DescripcionArticulo,
                                         Precio = (decimal)det.Precio,
                                         StockInventario = (int)Inventario.StockInventario
                                     };

            return detallesInventario.ToList();

        }
        private List<DetallesArticulos> GetDetallesTextilInventariados()
        {

            var detallesInventario = from det in _context.TblDetalleArticuloTextils
                                     join Articulo in _context.TblArticulos on det.IdArticulo equals Articulo.IdArticulo
                                     join Inventario in _context.TblInventarioArticulos on det.Id equals Inventario.IdDetalleArticuloInventario
                                     where Inventario.IdArticuloInventario == Articulo.IdArticulo && Inventario.IdDetalleArticuloInventario == det.Id
                                     select new DetallesArticulos
                                     {
                                         DetallesArticulo = det.Materiales + ", " + det.Genero + ", " + det.CategoriaPersona + ", " + det.Talla + ", " + det.Numeracion,
                                         NombreArticulo = det.Articulo.NombreArticulo,
                                         IdArticulo = (int)det.IdArticulo,
                                         IdDetalle = det.Id,
                                         DescripcionArticulo = det.Articulo.DescripcionArticulo,
                                         Precio = (decimal)det.Precio,
                                         StockInventario = (int)Inventario.StockInventario
                                     };

            return detallesInventario.ToList();

        }
        private List<DetallesArticulos> GetDetallesArteInventariados()
        {

            var detallesInventario = from det in _context.TblDetalleArticuloArtes
                                     join Articulo in _context.TblArticulos on det.IdArticulo equals Articulo.IdArticulo
                                     join Inventario in _context.TblInventarioArticulos on det.Id equals Inventario.IdDetalleArticuloInventario
                                     where Inventario.IdArticuloInventario == Articulo.IdArticulo && Inventario.IdDetalleArticuloInventario == det.Id
                                     select new DetallesArticulos
                                     {
                                         DetallesArticulo = det.Materiales + ", " + det.Tamaño,
                                         IdArticulo = (int)det.IdArticulo,
                                         DescripcionArticulo = det.Articulo.DescripcionArticulo,
                                         IdDetalle = det.Id,
                                         Precio = (decimal)det.Precio,
                                         StockInventario=(int)Inventario.StockInventario
                                     };

            return detallesInventario.ToList();

        }
        private List<DetallesArticulos> GetDetallesJugueteInventariados()
        {

            var detallesInventario = from det in _context.TblDetalleArticuloJuguetes
                                     join Articulo in _context.TblArticulos on det.IdArticulo equals Articulo.IdArticulo
                                     join Inventario in _context.TblInventarioArticulos on det.Id equals Inventario.IdDetalleArticuloInventario
                                     where Inventario.IdArticuloInventario == Articulo.IdArticulo && Inventario.IdDetalleArticuloInventario == det.Id
                                     select new DetallesArticulos
                                     {
                                         DetallesArticulo = det.Materiales + ", " + det.Tamaño + ", " + det.Genero + ", " + det.CategoriaPersona,
                                         NombreArticulo = det.Articulo.NombreArticulo,
                                         IdArticulo = (int)det.IdArticulo,
                                         DescripcionArticulo = det.Articulo.DescripcionArticulo,
                                         IdDetalle = det.Id,
                                         Precio = (decimal)det.Precio,
                                         StockInventario = (int)Inventario.StockInventario
                                     };

            return detallesInventario.ToList();

        }
        private List<DetallesArticulos> GetDetallesCalzadoInventariados()
        {

            var detallesInventario = from det in _context.TblDetalleArticuloCalzados
                                     join Articulo in _context.TblArticulos on det.IdArticulo equals Articulo.IdArticulo
                                     join Inventario in _context.TblInventarioArticulos on det.Id equals Inventario.IdDetalleArticuloInventario
                                     where Inventario.IdArticuloInventario == Articulo.IdArticulo && Inventario.IdDetalleArticuloInventario == det.Id
                                     select new DetallesArticulos
                                     {
                                         DetallesArticulo = det.Materiales + ", " + det.Genero + ", " + det.CategoriaPersona + ", " + det.Numeracion,
                                         NombreArticulo = det.Articulo.NombreArticulo,
                                         IdArticulo = (int)det.IdArticulo,
                                         DescripcionArticulo = det.Articulo.DescripcionArticulo,
                                         IdDetalle = det.Id,
                                         Precio = (decimal)det.Precio,
                                         StockInventario = (int)Inventario.StockInventario
                                     }; ;

            return detallesInventario.ToList();

        }
        private List<DetallesArticulos> GetDetallesComplementoInventariados()
        {

            var detallesInventario = from det in _context.TblDetalleArticuloComplementos
                                     join Articulo in _context.TblArticulos on det.IdArticulo equals Articulo.IdArticulo
                                     join Inventario in _context.TblInventarioArticulos on det.Id equals Inventario.IdDetalleArticuloInventario
                                     where Inventario.IdArticuloInventario == Articulo.IdArticulo && Inventario.IdDetalleArticuloInventario == det.Id
                                     select new DetallesArticulos
                                     {
                                         DetallesArticulo = det.Materiales + ", " + det.Tamaño + ", " + det.Genero + ", " + det.CategoriaPersona,
                                         NombreArticulo = det.Articulo.NombreArticulo,
                                         IdArticulo = (int)det.IdArticulo,
                                         DescripcionArticulo = det.Articulo.DescripcionArticulo,
                                         IdDetalle = det.Id,
                                         Precio = (decimal)det.Precio,
                                         StockInventario = (int)Inventario.StockInventario
                                     }; ; ;

            return detallesInventario.ToList();

        }



        public bool GuardarVenta(TblVentaArticulo VentaModel, List<DetallesArticulos> Articulos)
        {
            try
            {
                Articulos.ToList().ForEach(Articulo =>
                {
                    VentaModel.ListaDetalleVenta.Add(new TblDetalleVentaArticulo
                    {
                        IdArticulo = Articulo.IdArticulo,
                        IdDetalleArticulo = Articulo.IdDetalle,
                        Cantidad = Articulo.Cantidad,
                        Descuento = Articulo.Descuento,
                        PrecioTotal=Articulo.PrecioTotal
                    }) ;
                });
                VentaModel.ListaDetalleVenta.ToList().ForEach(Detalle =>
                {
                    TblInventarioArticulo inventarioArticulo = _context.TblInventarioArticulos.FirstOrDefault(inventario =>
                      (inventario.IdArticuloInventario == Detalle.IdArticulo && inventario.IdDetalleArticuloInventario == Detalle.IdDetalleArticulo));
                    _context.TblInventarioArticulos.Find(inventarioArticulo.IdInventario).StockInventario = _context.TblInventarioArticulos.Find(inventarioArticulo.IdInventario).StockInventario - Detalle.Cantidad;
                    _context.TblInventarioArticulos.Find(inventarioArticulo.IdInventario).PrecioStockInventario = _context.TblInventarioArticulos.Find(inventarioArticulo.IdInventario).PrecioStockInventario - Detalle.PrecioTotal;
                    if (_context.TblInventarioArticulos.Find(inventarioArticulo.IdInventario).StockInventario == 0)
                    {
                        _context.TblInventarioArticulos.Remove(_context.TblInventarioArticulos.Find(inventarioArticulo.IdInventario));
                    }
                });
                _context.TblVentaArticulos.Add(VentaModel);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }


        }

        public List<ResumenVentaModel> ArticulosMasVendidos(int? top = null)
        {
            if (top == null)
            {
                top = 5;
            }

            var litmit = Convert.ToInt32(top);

            var articulos = _context.TblArticulos
                .Select(x => new ResumenVentaModel
                {
                    Descripcion = x.NombreArticulo,
                    Unidades = x.TblDetalleVentaArticulos.Sum(y => y.Cantidad),
                    Valor = x.TblDetalleVentaArticulos.Sum(y => y.Cantidad * y.VentaArticulo.PrecioVenta),

                })
                .OrderByDescending(x => x.Unidades)
                .Take(litmit)
                .ToList();

            return articulos;

        }

        public List<ResumenVentaModel> MejoresClientes(int? top = null)
        {
            if (top == null)
            {
                top = 5;
            }

            var litmit = Convert.ToInt32(top);

            var clientes = _context.TblClientes
                .Select(x => new ResumenVentaModel
                {
                    Descripcion = x.NombreCliente,

                    Unidades = x.TblVentaArticulos.SelectMany(y => y.ListaDetalleVenta).Sum(y => y.Cantidad),

                    Valor = x.TblVentaArticulos.SelectMany(y => y.ListaDetalleVenta).Sum(y => y.Cantidad * y.VentaArticulo.PrecioVenta),
                })
               .OrderByDescending(x => x.Valor)
                .Take(litmit)
                .ToList();

            return clientes;
        }

        public List<ResumenVentaModel> MejoresCategorias(int? top = null)
        {
            if (top == null)
            {
                top = 5;
            }

            var litmit = Convert.ToInt32(top);

            var categorias = _context.TblCategoriaArticulos
                .Select(x => new ResumenVentaModel
                {
                    Descripcion = x.NombreCategoria,

                    Unidades = x.TblArticulos.SelectMany(y => y.TblDetalleVentaArticulos).Sum(y => y.Cantidad),

                    Valor = x.TblArticulos.SelectMany(y => y.TblDetalleVentaArticulos).Sum(y => y.Cantidad * y.VentaArticulo.PrecioVenta),
                })
                .OrderByDescending(x => x.Unidades)
                .Take(litmit)
                .ToList();

            return categorias;
        }

        public List<ResumenVentaModel> VentasPorMes(int año, int? top = null)
        {
            if (top == null)
            {
                top = 5;
            }

            var litmit = Convert.ToInt32(top);

            var query = _context.TblDetalleVentaArticulos
                .Include(x => x.VentaArticulo)
                .Where(x => x.VentaArticulo.FechaVenta.Year == año)
                .ToList();

            var lista = query.Select(x => new
            {
                IdMes = x.VentaArticulo.FechaVenta.Month,
                Mes = x.VentaArticulo.FechaVenta.ToString("MMMM").ToUpper(),
                Unidades = x.Cantidad,
                Valor = x.Cantidad * x.VentaArticulo.PrecioVenta
            }).GroupBy(g => new { g.IdMes, g.Mes })
            .Select(x => new ResumenVentaModel
            {
                Orden = x.Key.IdMes,
                Descripcion = x.Key.Mes,
                Unidades = x.Sum(y => y.Unidades),
                Valor = x.Sum(y => y.Valor)
            }).OrderBy(x => x.Orden).ToList();


            return lista;
        }


    }
}
