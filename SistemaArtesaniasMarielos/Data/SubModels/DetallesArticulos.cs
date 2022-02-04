namespace SistemaArtesaniasMarielos.Data.Sub_Models
{
    public class DetallesArticulos
    {
        public int IdArticulo { get; set; }
        public string NombreArticulo { get; set; }
        public int IdDetalle { get; set; }
        public string DetallesArticulo { get; set; }
        public decimal PrecioTotal { get; set; } = 0;
        public decimal Precio { get; set; } = 0;
        public int Cantidad { get; set; } = 1;
        public int Descuento { get; set; } = 0;
        public string DescripcionArticulo { get; set; }
        public int StockInventario { get; set; } = 0;
    }
}
