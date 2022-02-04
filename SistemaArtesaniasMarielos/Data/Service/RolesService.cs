using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemaArtesaniasMarielos.Data.Sub_Models;
using SistemaArtesaniasMarielos.Data.Model;
using SistemaArtesaniasMarielos.Data.Context;

namespace SistemaArtesaniasMarielos.Data.Service
{
    public class RolesService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;

        public RolesService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }

        public List<RolModel> ListaRoles()
        {
            var query = _context.TblRols
            .Include(x => x.TblUsuarios)
            .ToList();

            var lista = query.Select(x => new RolModel
            {
                Id = x.Id,
                Nombre_Rol = x.NombreRol,
                
            }).ToList();

            return lista;

        }
    }
}
