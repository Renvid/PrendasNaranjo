﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace DAL
{

    class Database : IDisposable
    {
        public SqlConnection Conexion { get; set; }

        public SqlDataReader ExecuteReader(SqlCommand sqlCommand)
        {
            SqlDataReader lector = null;
            try
            {

                sqlCommand.Connection = Conexion;
                lector = sqlCommand.ExecuteReader(CommandBehavior.CloseConnection);

                return lector;
            }
            catch (Exception ex)
            {
                ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                throw ex;
            }
            finally
            {

                if (lector != null || sqlCommand != null)
                    lector.Dispose();
                sqlCommand.Dispose();


            }


        }

        public int ExecuteScalar(SqlCommand sqlCommand)
        {
            int lector = 0;
            try
            {

                sqlCommand.Connection = Conexion;
                lector = (Int32)sqlCommand.ExecuteScalar();

                return lector;
            }
            catch (Exception ex)
            {
                ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                throw ex;
            }
            finally
            {

                if (sqlCommand != null)
                    sqlCommand.Dispose();


            }


        }

        public DataSet ExecuteReader(SqlCommand sqlCommand, String tabla)
        {

            DataSet dsTabla = new DataSet();
            try
            {
                using (SqlDataAdapter adaptador = new SqlDataAdapter(sqlCommand))
                {
                    sqlCommand.Connection = Conexion;
                    dsTabla = new DataSet();
                    adaptador.Fill(dsTabla, tabla);
                }
                return dsTabla;
            }
            catch (Exception ex)
            {
                ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                throw ex;
            }
            finally
            {

                if (dsTabla != null || sqlCommand != null)
                    dsTabla.Dispose();
                sqlCommand.Dispose();

            }



        }

        public DataSet ExecuteReaderCommand(SqlCommand sqlCommand)
        {

            DataSet dsTabla = new DataSet();
            try
            {
                using (SqlDataAdapter adaptador = new SqlDataAdapter(sqlCommand))
                {
                    sqlCommand.Connection = Conexion;
                    dsTabla = new DataSet();
                    adaptador.Fill(dsTabla);
                }
                return dsTabla;
            }
            catch (Exception ex)
            {
                ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                throw ex;
            }
            finally
            {

                if (dsTabla != null || sqlCommand != null)
                    dsTabla.Dispose();
                sqlCommand.Dispose();

            }



        }

        public DataTable ExecuteReaderDataTable(SqlCommand sqlCommand)
        {

            DataTable dsTabla = new DataTable();
            try
            {
                using (SqlDataAdapter adaptador = new SqlDataAdapter(sqlCommand))
                {
                    sqlCommand.Connection = Conexion;
                    dsTabla = new DataTable();
                    adaptador.Fill(dsTabla);
                }
                return dsTabla;
            }
            catch (Exception ex)
            {
                ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                throw ex;
            }
            finally
            {

                if (dsTabla != null || sqlCommand != null)
                    dsTabla.Dispose();
                sqlCommand.Dispose();

            }



        }

        public int ExecuteNonQuery(SqlCommand sqlCommand, IsolationLevel isolationLevel)
        {
            //IsolationLevel: Especifica el nivel de aislamiento de la transacción.
            using (SqlTransaction transaccion = Conexion.BeginTransaction(isolationLevel))
            {
                int registrosafectados = 0;
                try
                {

                    sqlCommand.Connection = Conexion;
                    sqlCommand.Transaction = transaccion;
                    registrosafectados = sqlCommand.ExecuteNonQuery();

                    // Commit a la transacción
                    transaccion.Commit();

                    return registrosafectados;
                }

                catch (Exception ex)
                {
                    ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                    Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                    throw ex;
                }
                finally
                {

                    if (sqlCommand != null || transaccion != null)
                        sqlCommand.Dispose();
                    transaccion.Dispose();

                }

            }

        }

        public int ExecuteNonQuery(SqlCommand sqlCommand)
        {

            int registrosafectados = 0;
            try
            {

                sqlCommand.Connection = Conexion;

                registrosafectados = sqlCommand.ExecuteNonQuery();

                return registrosafectados;

            }
            catch (Exception ex)
            {
                ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                throw ex;
            }
            finally
            {

                if (sqlCommand != null)
                    sqlCommand.Dispose();

            }
        }

        public void ExecuteNonQuery(ref SqlCommand sqlCommand, IsolationLevel isolationLevel)
        {
            using (SqlTransaction transaccion = Conexion.BeginTransaction(isolationLevel))
            {

                try
                {

                    sqlCommand.Connection = Conexion;
                    sqlCommand.Transaction = transaccion;
                    sqlCommand.ExecuteNonQuery();

                    // Commit a la transacción
                    transaccion.Commit();


                }

                catch (Exception ex)
                {
                    ex.Source += " SQL: " + sqlCommand.CommandText.ToString();
                    Log.Write(MethodBase.GetCurrentMethod().Name, ex);
                    throw ex;
                }
                finally
                {

                    if (transaccion != null || sqlCommand != null)
                        transaccion.Dispose();
                    sqlCommand.Dispose();

                }

            }

        }

        public void ExecuteNonQuery(List<SqlCommand> commands, IsolationLevel isolationLevel)
        {
            using (SqlTransaction transaccion = Conexion.BeginTransaction(isolationLevel))
            {
                try
                {
                    foreach (SqlCommand command in commands)
                    {
                        command.Connection = Conexion;
                        command.Transaction = transaccion;
                        command.ExecuteNonQuery();
                    }
                    // Commit a la transacción
                    transaccion.Commit();
                }

                catch (Exception ex)
                {
                    ex.Source += " SQL: " + commands.ToString();
                    Log.Write(MethodBase.GetCurrentMethod().Name, ex);

                    throw ex;
                }
                finally
                {

                    if (transaccion != null)
                        transaccion.Dispose();

                }
            }
        }

        #region IDisposable Members

        public void Dispose()
        {
            if (Conexion != null)
                Conexion.Close();
        }

        #endregion
    }

}
