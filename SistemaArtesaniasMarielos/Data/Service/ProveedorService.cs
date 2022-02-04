using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemaArtesaniasMarielos.Data.Sub_Models;
using SistemaArtesaniasMarielos.Data.Model;
using SistemaArtesaniasMarielos.Data.Context;

namespace SistemaArtesaniasMarielos.Data.Service
{
    public class ProveedorService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;

        public ProveedorService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }

        public ProveedorModel Proveedor(int idproveedor)
        {
            var model = _context.TblProveedors
                 .Where(x => x.IdProveedor == idproveedor)
                 .Select(x => new ProveedorModel
                 {
                     IdProveedor = x.IdProveedor,
                     NombreProveedor = x.NombreProveedor,
                     NombreEmpresa = x.NombreEmpresa,
                     TelefonoProveedor = x.TelefonoProveedor,
                 }).FirstOrDefault();

            return model;

        }

        public List<ProveedorModel> ListaProveedores()
        {
            var model = _context.TblProveedors
                .Select(x => new ProveedorModel
                {
                    IdProveedor = x.IdProveedor,
                    NombreProveedor = x.NombreProveedor,
                    NombreEmpresa = x.NombreEmpresa,
                    TelefonoProveedor = x.TelefonoProveedor,
                }).ToList();

            return model;
        }

        public MsgResult Crear(ProveedorModel model)
        {
            var result = new MsgResult();

            var entity = _context.TblProveedors.FirstOrDefault(x => x.NombreEmpresa == model.NombreEmpresa);

            if (entity != null)
            {
                result.IsSuccess = false;
                result.Message = $"Ya existe un proveedor creado con la empresa {model.NombreEmpresa}";
                return result;
            }

            entity = new TblProveedor
            {
                NombreProveedor = model.NombreProveedor,
                NombreEmpresa = model.NombreEmpresa,
                TelefonoProveedor = model.TelefonoProveedor,
            };

            _context.TblProveedors.Add(entity);

            try
            {
                _context.SaveChanges();

                result.IsSuccess = true;
                result.Message = "Proveedor registrado correctamente";
                result.Code = entity.IdProveedor;
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Error al crear proveedor";
                result.Error = ex;
            }

            return result;

        }

        public MsgResult Modificar(ProveedorModel model)
        {
            var result = new MsgResult();

            var entity = _context.TblProveedors.FirstOrDefault(x => x.IdProveedor == model.IdProveedor);

            if (entity == null)
            {
                result.IsSuccess = false;
                result.Message = $"Proveedor no encontrado";
                return result;
            }

            entity.NombreProveedor = model.NombreProveedor;
            entity.NombreEmpresa = model.NombreEmpresa;
            entity.TelefonoProveedor = model.TelefonoProveedor;

            try
            {
                _context.SaveChanges();

                result.IsSuccess = true;
                result.Message = "Proveedor modificado correctamente";
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Error al modificar proveedor";
                result.Error = ex;
            }

            return result;

        }

        public MsgResult Eliminar(int idproveedor)
        {
            var result = new MsgResult();

            var entity = _context.TblProveedors.FirstOrDefault(x => x.IdProveedor == idproveedor);

            if (entity == null)
            {
                result.IsSuccess = false;
                result.Message = $"Proveedor no encontrado";
                return result;
            }

            //TODO: Validar relaciones

            _context.TblProveedors.Remove(entity);

            try
            {
                _context.SaveChanges();

                result.IsSuccess = true;
                result.Message = "Proveedor eliminado correctamente";
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Error al eliminar proveedor";
                result.Error = ex;
            }

            return result;
        }
    }
}
