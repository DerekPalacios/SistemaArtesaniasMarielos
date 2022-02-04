using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SistemaArtesaniasMarielos.Data.Context;
using SistemaArtesaniasMarielos.Data.Model;
using SistemaArtesaniasMarielos.Data.Sub_Models;
using SistemaArtesaniasMarielos.Data.Service;





namespace SistemaArtesaniasMarielos.Data.Service
{
    public class VisualizacionService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;
        public VisualizacionService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }


        public TblCompraArticulo GetCompraArticulo(int NumCompra)
        {
            var compraDetails = _context.TblCompraArticulos.Include("IdProveedorCompraNavigation").Include("TblDetalleCompraArticulos").ToList().Find(com => com.NumeroCompra == NumCompra);
            compraDetails.TblDetalleCompraArticulos.ToList().ForEach(det =>
            {
                det.DetallesArticulo = new CompraService(_context).getDetallesSimple((int)det.IdArticuloDetalleCompra).Find(d => d.IdDetalle == det.IdDetalleArticulo);
                det.DetallesArticulo.PrecioTotal = (decimal)(det.CantidadDetalleCompra * det.DetallesArticulo.Precio);
                det.DetallesArticulo.PrecioTotal = (decimal)(det.DetallesArticulo.PrecioTotal - (det.DescuentoDetalleCompra == 0 ? 0 : (det.DescuentoDetalleCompra * det.DetallesArticulo.PrecioTotal / 100)));
            });

            return compraDetails;
        }
        public TblVentaArticulo GetVentaArticulo(int NumVenta)
        {
            var compraDetails = _context.TblVentaArticulos.Include("Cliente").Include("ListaDetalleVenta").ToList().Find(com => com.NumeroVenta == NumVenta);
            compraDetails.ListaDetalleVenta.ToList().ForEach(det =>
            {
                det.DetallesArticulo = new CompraService(_context).getDetallesSimple((int)det.IdArticulo).Find(d => d.IdDetalle == det.IdDetalleArticulo);
                det.DetallesArticulo.PrecioTotal = (decimal)(det.Cantidad * det.DetallesArticulo.Precio);
                det.DetallesArticulo.PrecioTotal = (decimal)(det.DetallesArticulo.PrecioTotal - (det.Descuento == 0 ? 0 : (det.Descuento * det.DetallesArticulo.PrecioTotal / 100)));
            });

            return compraDetails;
        }

        public List<TblVentaArticulo> GetVentaArticuloList()
        {
            var compraDetails = _context.TblVentaArticulos.Include("Cliente").Include("ListaDetalleVenta").ToList();
            return compraDetails;
        }

        public List<TblCompraArticulo> GetCompraArticuloList()
        {
            var compraDetails = _context.TblCompraArticulos.Include("IdProveedorCompraNavigation").Include("TblDetalleCompraArticulos").ToList();
            return compraDetails;
        }

    }


}
