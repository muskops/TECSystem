﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Carreras
    {
        CDConexion conexion = new CDConexion();
        SqlDataReader leer;
        DataTable tabla = new DataTable();
        SqlCommand comando = new SqlCommand();

        public DataTable MostrarTabla()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "select * from carreras";
            comando.CommandType = CommandType.Text;
            leer = comando.ExecuteReader();
            tabla.Load(leer);
            conexion.CerrarConexion();
            return tabla;
        }
        public void AgregarCarrera(string nombre, string coordinador)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "insert into carreras(nombre,coordinador) values(@nombre,@coordinador);";
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@coordinador", coordinador);
            leer = comando.ExecuteReader();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public void EditarCarrera(string idCarrera, string nombre, string coordinador)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "update carreras set nombre = @nombre, coordinador = @coordinador where idCarrera = @idCarrera";
            comando.Parameters.AddWithValue("@idCarrera", idCarrera);
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@coordinador", coordinador);
            comando.CommandType = CommandType.Text;
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
        }

        public void ElimnarCarrera(string idCarrera)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "delete carreras where idCarrera = @idCarrera";
            comando.Parameters.AddWithValue("@idCarrera", idCarrera);
            leer = comando.ExecuteReader();
            comando.Parameters.Clear();
            conexion.CerrarConexion();
        }
    }
}
