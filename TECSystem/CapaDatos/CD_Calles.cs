﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Calles
    {
        CDConexion conexion = new CDConexion();
        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();


        public DataTable MostrarTabla()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "select * from calles";
            comando.CommandType = CommandType.Text;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;
        }

        public void AgregarCalles(string localidad, string nombre)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.Parameters.Clear();
            comando = new SqlCommand("insert into calles(Localidad,nombre) values(@localidad,@nombre);");
            comando.Parameters.AddWithValue("@localidad", localidad);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.ExecuteNonQuery();
            comando.Connection = conexion.CerrarConexion();
        }

        public void EditarCalles(string idCalle, string Localidad, string nombre)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.Parameters.Clear();
            comando = new SqlCommand("update calles set Localidad=@Localidad, nombre=@nombre where idCalle=@idCalle");
            comando.Parameters.AddWithValue("@idCalle", idCalle);
            comando.Parameters.AddWithValue("@Localidad", Localidad);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.ExecuteNonQuery();
            comando.Connection = conexion.CerrarConexion();
        }

        public void EliminarCalles(string idCalle)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.Parameters.Clear();
            comando = new SqlCommand("DELETE FROM calles WHERE idCalle=@idCalle");
            comando.Parameters.AddWithValue("@idCalle", idCalle);
            comando.ExecuteNonQuery();
            comando.Connection = conexion.CerrarConexion();
        }

    }
}
