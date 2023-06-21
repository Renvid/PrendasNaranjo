using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace J_AND_M.DAL
{
    public class CategoriaDAL
    {
        // Create 
        public static void New(string Nombre, int Activo)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spCategoriaNew");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Nombre", Nombre);
            comando.Parameters.AddWithValue("@Activo", Activo);

            db.ExecuteNonQuery(comando);
        }

        // Update 
        public static void Update(int idCategoria, string Nombre, int Activo)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spCategoriaUpdate");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@idCategoria", idCategoria);
            comando.Parameters.AddWithValue("@Nombre", Nombre);
            comando.Parameters.AddWithValue("@Activo", Activo);

            db.ExecuteNonQuery(comando);
        }

        // Read 
        public static DataSet All()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spCategoriaAll");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Categoria");
            return ds;
        }

        public static DataSet All_Activo()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spCategoriaAll_Activo");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Categoria");
            return ds;
        }

        // One 
        public static DataSet One(int idCategoria)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spCategoriaOne");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idCategoria", idCategoria);

            DataSet ds = db.ExecuteReader(comando, "Categoria");
            return ds;
        }

        // One 
        public static DataSet CategoriasPorGenero(int idGenero)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spCategorias_Por_Genero");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idGenero", idGenero);

            DataSet ds = db.ExecuteReader(comando, "Categoria");
            return ds;
        }
    }
}