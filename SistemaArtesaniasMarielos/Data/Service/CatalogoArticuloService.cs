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
    public class CatalogoArticuloService
    {

        private readonly ArtesaniasVentasArticulosComprasContext _context;

        public CatalogoArticuloService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;






        }

    }
}
