using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class CompraModel
    {
        public int IdCompra { get; set; }
        public int NumeroCompra { get; set; }
        public DateTime FechaCompra { get; set; }
        public int IdProveedorCompra { get; set; }
        public string NombreProveedor { get; set; }
        public string NombreEmpresa { get; set; }
        public string TelefonoProveedor { get; set; }
        public decimal PrecioTotalCompra { get; set; }
        public decimal IvaCompra { get; set; } = 0;


        public List<ItemFacturaCompraModel> Items { get; set; } = new List<ItemFacturaCompraModel>();

        public decimal Total => Items.Sum(x => x.Subtotal);
        public int Cantidad => Items.Sum(x => x.CantidadDetalleCompra);
    }

    public class ItemFacturaCompraModel
    {
        public int IdDetalleCompra { get; set; }
        public int IdArticuloDetalleCompra { get; set; }
        public int IdDetalleArticulo { get; set; }
        public int CantidadDetalleCompra { get; set; }
        public int IdCompraDetalleCompra { get; set; }
        public decimal DescuentoDetalleCompra { get; set; }
        public decimal Costo { get; set; }

        //[Required(ErrorMessage = "Por favor seleccione un articulo")]
        //public string CodigoArticulo { get; set; }
        //public string NombreArticulo { get; set; }

        //public int Stock { get; set; }





        public decimal Subtotal => (CantidadDetalleCompra * Costo) - Des;
        public decimal Des => Costo * (DescuentoDetalleCompra / 100);
        ////public decimal Iva => Costo * (IVA / 100);





    }
}
