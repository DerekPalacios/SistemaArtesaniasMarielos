using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemaArtesaniasMarielos.Data.Sub_Models;
using SistemaArtesaniasMarielos.Data.Model;
using SistemaArtesaniasMarielos.Data.Context;

namespace SistemaArtesaniasMarielos.Data.Service
{
    public class UsuariosService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;
        public UsuariosService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }



        public List<RegistroUsuarioModel> ListaUsuarios()
        {
            var model = _context.TblUsuarios
                .Select(x => new RegistroUsuarioModel
            {
                Id = x.Id,
                IdRol = x.IdRol,
                Nombres = x.Nombres,
                Apellidos = x.Apellidos,
                NombreUsuario = x.NombreUsuario,
                Clave = x.Clave,
                ConfirmarClave = x.ConfirmarClave
            }).ToList();

            return model;

        }

        public RegistroUsuarioModel Usuario(int idUsuario)
        {
            var model = _context.TblUsuarios
                .Where(x => x.Id == idUsuario)
                .Select(x => new RegistroUsuarioModel
                {
                Id = x.Id,
                IdRol = x.IdRol,
                Nombres = x.Nombres,
                Apellidos = x.Apellidos,
                NombreUsuario = x.NombreUsuario,
                Clave = x.Clave,
                ConfirmarClave = x.ConfirmarClave

            }).FirstOrDefault();

            return model;
        }


        public MsgResult Crear(RegistroUsuarioModel model)
        {
            var res = new MsgResult();


            var newUser = _context.TblUsuarios.FirstOrDefault(x => x.NombreUsuario == model.NombreUsuario);

            if (newUser != null)
            {
                res.IsSuccess = false;
                res.Message = "Ya existe un usuario con este nombre";
                return res;
            }


            newUser = new TblUsuario
            {
                IdRol = model.IdRol,
                Nombres = model.Nombres,
                Apellidos = model.Apellidos,
                NombreUsuario = model.NombreUsuario,
                Clave = model.Clave,
                ConfirmarClave = model.ConfirmarClave
            };

            _context.TblUsuarios.Add(newUser);

            try
            {
                _context.SaveChanges();

                res.IsSuccess = true;
                res.Message = "Usuario registrado correctamente";
            }
            catch (Exception ex)
            {
                res.IsSuccess = false;
                res.Message = "Error al registrar el usuario";
                res.Error = ex;
            }

            return res;
        }

        public MsgResult Modificar(RegistroUsuarioModel model)
        {

            var res = new MsgResult();

            var entity = _context.TblUsuarios.FirstOrDefault(x => x.Id == model.Id);

            if (entity == null)
            {
                res.IsSuccess = false;
                res.Message = "No se puede modificar el usuario solicitado porque no existe";
                return res;
            }

            entity.Id = model.Id;
            entity.IdRol = model.IdRol;
            entity.Nombres = model.Nombres;
            entity.Apellidos = model.Apellidos;
            entity.NombreUsuario = model.NombreUsuario;
            entity.Clave = model.Clave;
            entity.ConfirmarClave = model.ConfirmarClave;


            try
            {
                _context.SaveChanges();

                res.IsSuccess = true;
                res.Message = "Usuario modificado correctamente";
            }
            catch (Exception ex)
            {
                res.IsSuccess = false;
                res.Message = "Error al modificar el usuario";
                res.Error = ex;
            }

            return res;
        }



        public MsgResult Eliminar(int idUsuario)
        {
            var res = new MsgResult();

            var entity = _context.TblUsuarios
                .FirstOrDefault(x => x.Id == idUsuario);

            if (entity == null)
            {
                res.IsSuccess = false;
                res.Message = "No se puede eliminar el usuario solicitado porque no existe";
                res.Code = -1;
                return res;
            }

            _context.TblUsuarios.Remove(entity);

            try
            {
                _context.SaveChanges();

                res.IsSuccess = true;
                res.Message = "Usuario eliminado correctamente";
            }
            catch (Exception ex)
            {
                res.IsSuccess = false;
                res.Message = "Error al eliminar el usuario";
                res.Error = ex;
            }

            return res;
        }

    }
}