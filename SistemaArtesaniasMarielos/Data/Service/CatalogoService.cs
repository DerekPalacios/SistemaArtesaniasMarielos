using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using SistemaArtesaniasMarielos.Data.Context;
using SistemaArtesaniasMarielos.Data.Model;

namespace SistemaArtesaniasMarielos.Data.Service
{
    public class CatalogoService
    {
        private readonly ArtesaniasVentasArticulosComprasContext _context;
        public CatalogoService(ArtesaniasVentasArticulosComprasContext context)
        {
            _context = context;
        }




        //funciones para nuevos detalles:

        public bool nuevoTamaño(TblDetalleCaracteristicaArticulo newDetalle)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Add(newDetalle);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool editarTamaño(TblDetalleCaracteristicaArticulo editTam) 
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Update(editTam);
                //_context.TblDetalleCaracteristicaArticulos.Find(editTam.IdDetalle).NombreDetalle = editTam.NombreDetalle;
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        
        }



        public bool nuevoMaterial(TblDetalleCaracteristicaArticulo newDetalle)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Add(newDetalle);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        public bool editarMaterial(TblDetalleCaracteristicaArticulo editTam)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Update(editTam);
                //_context.TblDetalleCaracteristicaArticulos.Find(editTam.IdDetalle).NombreDetalle = editTam.NombreDetalle;
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }

        }


        public bool nuevoTalla(TblDetalleCaracteristicaArticulo newDetalle)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Add(newDetalle);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool editarTalla(TblDetalleCaracteristicaArticulo editTam)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Update(editTam);
                //_context.TblDetalleCaracteristicaArticulos.Find(editTam.IdDetalle).NombreDetalle = editTam.NombreDetalle;
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }

        }



        public bool nuevoCategoriaPersona(TblDetalleCaracteristicaArticulo newDetalle)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Add(newDetalle);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool editarCategoriaPersona(TblDetalleCaracteristicaArticulo editTam)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Update(editTam);
                //_context.TblDetalleCaracteristicaArticulos.Find(editTam.IdDetalle).NombreDetalle = editTam.NombreDetalle;
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }

        }


        public bool nuevoNumeracion(TblDetalleCaracteristicaArticulo newDetalle)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Add(newDetalle);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool editarNumeracion(TblDetalleCaracteristicaArticulo editTam)
        {
            try
            {
                _context.TblDetalleCaracteristicaArticulos.Update(editTam);
                //_context.TblDetalleCaracteristicaArticulos.Find(editTam.IdDetalle).NombreDetalle = editTam.NombreDetalle;
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }

        }







        public List<TblDetalleCaracteristicaArticulo> getDetallesArticuloTamañoList()
        {
            var lista= _context.TblDetalleCaracteristicaArticulos.Include("Caracteristica").Where(x => x.Caracteristica.NombreCaracteristica == "Tamaño").ToList();
            if(lista != null)
            {
                return lista;
            }
            else
            {
                return lista = new List<TblDetalleCaracteristicaArticulo>();
            }
            
        }

        public List<TblDetalleCaracteristicaArticulo> getDetallesArticuloTallaList()
        {
            var lista = _context.TblDetalleCaracteristicaArticulos.Where(x => x.Caracteristica.NombreCaracteristica == "Talla").ToList();
            if (lista != null)
            {
                return lista;
            }
            else
            {
                return lista = new List<TblDetalleCaracteristicaArticulo>();
            }

        }

        public List<TblDetalleCaracteristicaArticulo> getDetallesArticuloMaterialList()
        {
            var lista = _context.TblDetalleCaracteristicaArticulos.Where(x => x.Caracteristica.NombreCaracteristica == "Material").ToList();
            if (lista != null)
            {
                return lista;
            }
            else
            {
                return lista = new List<TblDetalleCaracteristicaArticulo>();
            }

        }

        public List<TblDetalleCaracteristicaArticulo> getDetallesArticuloNumeracionList()
        {
            var lista = _context.TblDetalleCaracteristicaArticulos.Where(x => x.Caracteristica.NombreCaracteristica == "Numeracion").ToList();
            if (lista != null)
            {
                return lista;
            }
            else
            {
                return lista = new List<TblDetalleCaracteristicaArticulo>();
            }

        }
        
        public List<TblDetalleCaracteristicaArticulo> getDetallesArticuloGeneroList()
        {
            var lista = _context.TblDetalleCaracteristicaArticulos.Where(x => x.Caracteristica.NombreCaracteristica == "Genero").ToList();
            if (lista != null)
            {
                return lista;
            }
            else
            {
                return lista = new List<TblDetalleCaracteristicaArticulo>();
            }

        }
        
        public List<TblDetalleCaracteristicaArticulo> getDetallesArticuloCatPersonaList()
        {
            var lista = _context.TblDetalleCaracteristicaArticulos.Where(x => x.Caracteristica.NombreCaracteristica == "Categoria Persona").ToList();
            if (lista != null)
            {
                return lista;
            }
            else
            {
                return lista = new List<TblDetalleCaracteristicaArticulo>();
            }

        }
    }
}
