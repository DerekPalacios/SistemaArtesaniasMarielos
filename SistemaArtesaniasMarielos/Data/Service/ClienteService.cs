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
    public class ClienteService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;

        public ClienteService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }

        public ClienteModel Cliente(int idCliente)
        {
            var model = _context.TblClientes
                 .Where(x => x.IdCliente == idCliente)
                 .Select(x => new ClienteModel
                 {
                     IdCliente = x.IdCliente,
                     NombreCliente = x.NombreCliente,
                     IdentifiacionCliente = x.IdentifiacionCliente,
                     DireccionCliente = x.DireccionCliente,
                     TelefonoCliente = x.TelefonoCliente,
                 }).FirstOrDefault();

            return model;

        }

        public List<ClienteModel> ListaClientes()
        {
            var model = _context.TblClientes
                .Select(x => new ClienteModel
                {
                    IdCliente = x.IdCliente,
                    NombreCliente = x.NombreCliente,
                    IdentifiacionCliente = x.IdentifiacionCliente,
                    DireccionCliente = x.DireccionCliente,
                    TelefonoCliente = x.TelefonoCliente,
                }).ToList();

            return model;
        }

        public MsgResult Crear(ClienteModel model)
        {
            var result = new MsgResult();

            var entity = _context.TblClientes.FirstOrDefault(x => x.IdentifiacionCliente == model.IdentifiacionCliente);

            if (entity != null)
            {
                result.IsSuccess = false;
                result.Message = $"Ya existe un cliente creado con la identifación {model.IdentifiacionCliente}";
                return result;
            }

            entity = new TblCliente
            {
                NombreCliente = model.NombreCliente,
                IdentifiacionCliente = model.IdentifiacionCliente,
                DireccionCliente = model.DireccionCliente,
                TelefonoCliente = model.TelefonoCliente,
            };

            _context.TblClientes.Add(entity);

            try
            {
                _context.SaveChanges();

                result.IsSuccess = true;
                result.Message = "Cliente registrado correctamente";
                result.Code = entity.IdCliente;
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Error al crear el cliente";
                result.Error = ex;
            }

            return result;

        }

        public MsgResult Modificar(ClienteModel model)
        {
            var result = new MsgResult();

            var entity = _context.TblClientes.FirstOrDefault(x => x.IdCliente == model.IdCliente);

            if (entity == null)
            {
                result.IsSuccess = false;
                result.Message = $"Cliente no encontrado";
                return result;
            }

            entity.NombreCliente = model.NombreCliente;
            entity.IdentifiacionCliente = model.IdentifiacionCliente;
            entity.DireccionCliente = model.DireccionCliente;
            entity.TelefonoCliente = model.TelefonoCliente;

            try
            {
                _context.SaveChanges();

                result.IsSuccess = true;
                result.Message = "Cliente modificado correctamente";
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Error al modificar el cliente";
                result.Error = ex;
            }

            return result;

        }

        public MsgResult Eliminar(int idCliente)
        {
            var result = new MsgResult();

            var entity = _context.TblClientes.FirstOrDefault(x => x.IdCliente == idCliente);

            if (entity == null)
            {
                result.IsSuccess = false;
                result.Message = $"Cliente no encontrado";
                return result;
            }

            //TODO: Validar relaciones

            _context.TblClientes.Remove(entity);

            try
            {
                _context.SaveChanges();

                result.IsSuccess = true;
                result.Message = "Cliente eliminado correctamente";
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Error al eliminar el cliente";
                result.Error = ex;
            }

            return result;
        }
    }
}
