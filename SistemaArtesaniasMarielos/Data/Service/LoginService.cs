using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemaArtesaniasMarielos.Data.Sub_Models;
using SistemaArtesaniasMarielos.Data.Model;
using SistemaArtesaniasMarielos.Data.Context;

namespace SistemaArtesaniasMarielos.Data.Service
{
    public class LoginService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;
        public LoginService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }

     public MsgResult ValidarNombreUsuario(string nombre_usuario)
        {
            var res = new MsgResult();

            var existeUsuario = _context.TblUsuarios.FirstOrDefault(x => x.NombreUsuario == nombre_usuario);

            if (existeUsuario == null)
            {
                res.IsSuccess = false;
            }
            else
            {
                res.IsSuccess = true;
            }

            return res;
        }



        public MsgResult Login(LoginUsuarioModel model)

        {
            var result = new MsgResult();

            var user = _context.TblUsuarios.FirstOrDefault(x => x.NombreUsuario == model.Usuario);

            if (user == null)
            {
                result.IsSuccess = false;
                result.Message = "Usuario no existe";

                return result;
            }


            if (user.Clave != model.Password)
            {
                result.IsSuccess = false;
                result.Message = "Contraseña no válida";
                return result;
            }

            result.IsSuccess = true;
            result.Message = "Acceso Concedido";
            return result;
        }
    }
}