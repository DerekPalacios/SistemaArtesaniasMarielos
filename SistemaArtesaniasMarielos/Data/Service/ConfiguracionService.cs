using SistemaArtesaniasMarielos.Data.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemaArtesaniasMarielos.Data.Service;
using SistemaArtesaniasMarielos.Data.Sub_Models;

namespace SistemaArtesaniasMarielos.Data.Service
{
    public class ConfiguracionService
    {
         private readonly ArtesaniasVentasArticulosComprasContext _context;
        public ConfiguracionService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }

        public ConfiguracionModel Datos(int iddatos)
        {
            var model = _context.TblConfiguracions
                 .Where(x => x.Id == iddatos)
                 .Select(x => new ConfiguracionModel
                 {
                     Id = x.Id,
                     ConfEncabezadoFactura = x.ConfEncabezadoFactura,
                     NombrePropietario = x.NombrePropietario,
                     NombreTienda = x.NombreTienda,
                     N_Ruc = x.NRuc,
                     ConfTelefono = x.ConfTelefono,
                     ConfDireccion = x.ConfDireccion,
                     ConfCorreo = x.ConfCorreo,
                 }).FirstOrDefault();

            return model;

        }

        public List<ConfiguracionModel> ListaDatos()
        {
            var model = _context.TblConfiguracions
                .Select(x => new ConfiguracionModel
                {
                    Id = x.Id,
                    ConfEncabezadoFactura = x.ConfEncabezadoFactura,
                    NombrePropietario = x.NombrePropietario,
                    NombreTienda = x.NombreTienda,
                    N_Ruc = x.NRuc,
                    ConfTelefono = x.ConfTelefono,
                    ConfDireccion = x.ConfDireccion,
                    ConfCorreo = x.ConfCorreo,
                }).ToList();

            return model;
        }

        //public MsgResult Crear(ConfiguracionModel model)
        //{
        //    var res = new MsgResult();

        //    var entity = new Configuracion
        //    {
        //        ConfEncabezadoFactura = model.ConfEncabezadoFactura,
        //        NombrePropietario =  model.NombrePropietario,
        //        NombreTienda = model.NombreTienda,
        //        N_Ruc = model.N_Ruc,
        //        ConfTelefono = model.ConfTelefono,
        //        ConfDireccion = model.ConfDireccion,
        //        ConfCorreo =  model.ConfCorreo,

        //    };

        //    _context.TblConfiguracion.Add(entity);

        //    try
        //    {
        //        _context.SaveChanges();

        //        res.IsSuccess = true;
        //        res.Message = "Datos guardados correctamente";
        //        res.Code = entity.Id;
        //    }
        //    catch (Exception ex)
        //    {
        //        res.IsSuccess = false;
        //        res.Message = "Error al registrar datos";
        //        res.Error = ex;
        //    }

        //    return res;
        //}

        public MsgResult Modificar(ConfiguracionModel model)
        {

            var res = new MsgResult();

            var entity = _context.TblConfiguracions.FirstOrDefault(x => x.Id == model.Id);

            if (entity == null)
            {
                res.IsSuccess = false;
                res.Message = "No se pueden modificar los datos solicitados";
                return res;
            }

            entity.ConfEncabezadoFactura = model.ConfEncabezadoFactura;
            entity.NombrePropietario = model.NombrePropietario;
            entity.NombreTienda = model.NombreTienda;
            entity.NRuc = model.N_Ruc;
            entity.ConfTelefono = model.ConfTelefono;
            entity.ConfDireccion = model.ConfDireccion;
            entity.ConfCorreo = model.ConfCorreo;


            try
            {
                _context.SaveChanges();
                res.IsSuccess = true;
                res.Message = "Datos modificados correctamente";
            }
            catch (Exception ex)
            {
                res.IsSuccess = false;
                res.Message = "Error al modificar datos";
                res.Error = ex;
            }

            return res;
        }

    }
}
