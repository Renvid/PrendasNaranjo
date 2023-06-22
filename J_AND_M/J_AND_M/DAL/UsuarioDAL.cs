using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace J_AND_M.DAL
{
    public class UsuarioDAL
    {
        // Create 
        public static void New(string Nombre, string Email, string NombreUsuario, string Contrasennia, string Telefono, string Comentarios, int Tipo
            , string apellidos , string mayorista,int activo, string provincia, string canton, string distrito, string direccion, string observaciones)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spUsuarioNew");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Nombre", Nombre);
            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@NombreUsuario", NombreUsuario);
            comando.Parameters.AddWithValue("@Contrasennia", Contrasennia);
            comando.Parameters.AddWithValue("@Telefono", Telefono);
            comando.Parameters.AddWithValue("@Comentarios", Comentarios);
            comando.Parameters.AddWithValue("@Tipo", Tipo);
            comando.Parameters.AddWithValue("@apellidos", apellidos);
            comando.Parameters.AddWithValue("@mayorista", mayorista);
            comando.Parameters.AddWithValue("@activo", activo);
            comando.Parameters.AddWithValue("@provincia", provincia);
            comando.Parameters.AddWithValue("@canton", canton);
            comando.Parameters.AddWithValue("@distrito", distrito);
            comando.Parameters.AddWithValue("@direccion", direccion);
            comando.Parameters.AddWithValue("@observaciones", observaciones);

            db.ExecuteNonQuery(comando);
        }

        // Update 
        public static void Update(int idUsuario, string Nombre, string Email, string NombreUsuario, string Contrasennia, string Telefono, string Comentarios, int Tipo
                        , string apellidos, string mayorista, int activo, string provincia, string canton, string distrito, string direccion, string observaciones)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spUsuarioUpdate");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@idUsuario", idUsuario);
            comando.Parameters.AddWithValue("@Nombre", Nombre);
            comando.Parameters.AddWithValue("@Email", Email);
            comando.Parameters.AddWithValue("@NombreUsuario", NombreUsuario);
            comando.Parameters.AddWithValue("@Contrasennia", Contrasennia);
            comando.Parameters.AddWithValue("@Telefono", Telefono);
            comando.Parameters.AddWithValue("@Comentarios", Comentarios);
            comando.Parameters.AddWithValue("@Tipo", Tipo);
            comando.Parameters.AddWithValue("@apellidos", apellidos);
            comando.Parameters.AddWithValue("@mayorista", mayorista);
            comando.Parameters.AddWithValue("@activo", activo);
            comando.Parameters.AddWithValue("@provincia", provincia);
            comando.Parameters.AddWithValue("@canton", canton);
            comando.Parameters.AddWithValue("@distrito", distrito);
            comando.Parameters.AddWithValue("@direccion", direccion);
            comando.Parameters.AddWithValue("@observaciones", observaciones);

            db.ExecuteNonQuery(comando);
        }

        // Read 
        public static DataSet All()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spUsuarioAll");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Usuario");
            return ds;
        }

        // One 
        public static DataSet One(int idUsuario)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spUsuarioOne");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@idUsuario", idUsuario);

            DataSet ds = db.ExecuteReader(comando, "Usuario");
            return ds;
        }

        // One 
        public static DataSet IniciarSesion(string Usuario,string Contrasennia)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("IniciarSesion");

            comando.CommandType = CommandType.StoredProcedure;
            comando.Parameters.AddWithValue("@Usuario", Usuario);
            comando.Parameters.AddWithValue("@Contrasennia", Contrasennia);

            DataSet ds = db.ExecuteReader(comando, "Usuario");
            return ds;
        }
    }
}