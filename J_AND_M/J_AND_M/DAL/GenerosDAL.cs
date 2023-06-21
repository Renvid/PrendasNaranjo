using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace J_AND_M.DAL
{
    public class GenerosDAL
    {
        // Create 
        public static void New(string NombreGenero, int Activo)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spGeneroNew");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@NombreGenero", NombreGenero);
            comando.Parameters.AddWithValue("@Activo", Activo);



            db.ExecuteNonQuery(comando);
        }

        // Update 
        public static void Update(int idGenero, string NombreGenero, int Activo)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spGeneroUpdate");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@idGenero", idGenero);
            comando.Parameters.AddWithValue("@NombreGenero", NombreGenero);
               comando.Parameters.AddWithValue("@Activo", Activo);


            db.ExecuteNonQuery(comando);
        }

        // Read 
        public static DataSet All()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spGeneroAll");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Genero");
            return ds;
        }

        // Read 
        public static DataSet All_Activo()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spGeneroAll_Activo");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Genero");
            return ds;
        }

        // One 
        public static DataSet One(int idGenero)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spGeneroOne");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idGenero", idGenero);

            DataSet ds = db.ExecuteReader(comando, "Genero");
            return ds;
        }
    }
}