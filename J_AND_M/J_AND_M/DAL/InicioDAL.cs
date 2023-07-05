using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace J_AND_M.DAL
{
    public class InicioDAL
    {
        // Update 
        public static void Update(int Titulo1, string Titulo2, string Texto, string Titulo1_1, string Titulo2_2, string Texto_1, string SubTexto1, string ImgRuta1, string SubTexto2, string ImgRuta2, string SubTexto3, string ImgRuta3
            , string Imagen_Carrousel_1, string Imagen_Carrousel_2, string ColorCategoria,string Catalogo,string ListaPrecios)
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spInicioUpdate");
            comando.CommandType = CommandType.StoredProcedure;

            comando.Parameters.AddWithValue("@Titulo1", Titulo1);
            comando.Parameters.AddWithValue("@Titulo2", Titulo2);
            comando.Parameters.AddWithValue("@Texto", Texto);
            comando.Parameters.AddWithValue("@Titulo1_1", Titulo1_1);
            comando.Parameters.AddWithValue("@Titulo2_2", Titulo2_2);
            comando.Parameters.AddWithValue("@Texto_1", Texto_1);
            comando.Parameters.AddWithValue("@SubTexto1", SubTexto1);
            comando.Parameters.AddWithValue("@ImgRuta1", ImgRuta1);
            comando.Parameters.AddWithValue("@SubTexto2", SubTexto2);
            comando.Parameters.AddWithValue("@ImgRuta2", ImgRuta2);
            comando.Parameters.AddWithValue("@SubTexto3", SubTexto3);
            comando.Parameters.AddWithValue("@ImgRuta3", ImgRuta3);
            comando.Parameters.AddWithValue("@Imagen_Carrousel_1", Imagen_Carrousel_1);
            comando.Parameters.AddWithValue("@Imagen_Carrousel_2", Imagen_Carrousel_2);
            comando.Parameters.AddWithValue("@ColorCategoria", ColorCategoria);
            comando.Parameters.AddWithValue("@Catalogo", Catalogo);
            comando.Parameters.AddWithValue("@ListaPrecios", ListaPrecios);

            db.ExecuteNonQuery(comando);
        }

        // Read 
        public static DataSet All()
        {
            Database db = DatabaseFactory.CreateDatabase("Default");

            SqlCommand comando = new SqlCommand("spInicioAll");
            comando.CommandType = CommandType.StoredProcedure;

            DataSet ds = db.ExecuteReader(comando, "Inicio");
            return ds;
        }
    }
}