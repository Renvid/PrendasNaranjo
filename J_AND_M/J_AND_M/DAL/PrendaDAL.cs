using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using J_AND_M.UI.mantenimientos;

namespace J_AND_M.DAL
{
    public class PrendaDAL
    {
        // Create 
        public static void New(string Nombre, string Precio, string UrlImg, int idGenero, int idCategoria, int MasVendido, int Nuevo, int Agotado)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasNew");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Nombre", Nombre);
            comando.Parameters.AddWithValue("@Precio", Precio);
            comando.Parameters.AddWithValue("@UrlImg", UrlImg);
            comando.Parameters.AddWithValue("@idGenero", idGenero);
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);
            comando.Parameters.AddWithValue("@MasVendido", MasVendido);
            comando.Parameters.AddWithValue("@Nuevo", Nuevo);
            comando.Parameters.AddWithValue("@Agotado", Agotado);

            db.ExecuteNonQuery(comando);
        }

        // Update 
        public static void Update(int idPrenda, string Nombre, string Precio, string UrlImg, int idGenero, int idCategoria, int MasVendido, int Nuevo, int Agotado)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasUpdate");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@idPrenda", idPrenda);
            comando.Parameters.AddWithValue("@Nombre", Nombre);
            comando.Parameters.AddWithValue("@Precio", Precio);
            comando.Parameters.AddWithValue("@UrlImg", UrlImg);
            comando.Parameters.AddWithValue("@idGenero", idGenero);
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);
            comando.Parameters.AddWithValue("@MasVendido", MasVendido);
            comando.Parameters.AddWithValue("@Nuevo", Nuevo);
            comando.Parameters.AddWithValue("@Agotado", Agotado);
            db.ExecuteNonQuery(comando);
        }

        // Read 
        public static DataSet All(int idGenero)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasAll");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idGenero", idGenero);

            DataSet ds = db.ExecuteReader(comando, "Prendas");
            return ds;
        }

        public static DataSet Prendas_Por_Categoria(int idGenero,int idCategoria)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendas_Categoria");
            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idGenero", idGenero);
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);

            DataSet ds = db.ExecuteReader(comando, "Prendas");
            return ds;
        }

        // Read 
        public static DataSet PrendasNuevas()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasNuevas");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Prendas");
            return ds;
        }

        // Read 
        public static DataSet PrendasMasVendidas()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasMasVendidas");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Prendas");
            return ds;
        }

        // One 
        public static DataSet One(int idPrenda)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasOne");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idPrenda", idPrenda);

            DataSet ds = db.ExecuteReader(comando, "Prendas");
            return ds;
        }

        // Eliminar 
        public static void Delete(int idPrenda)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spPrendasDelete");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idPrenda", idPrenda);

            db.ExecuteReader(comando, "Prendas");

        }
    }
}