﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_Actividades
    {
        CD_Conexion conexion = new CD_Conexion();
        SqlCommand comando = new SqlCommand();
        SqlDataReader leer;
        DataTable mos = new DataTable();
        public DataTable MostrarActividades()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "select * from actividades";
            leer = comando.ExecuteReader();
            mos.Load(leer);
            conexion.CerrarConexion();
            return mos;
        }

        public void InsertarActividades(string nombre,string descripcion,string grupo,int tema,int ponderacion,DateTime fecha)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "insert into actividades values(@nombre,@descripcion,@grupo,@tema,@ponderacion,@fecha)";
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@descripcion", descripcion);
            comando.Parameters.AddWithValue("@grupo", grupo);
            comando.Parameters.AddWithValue("@tema", tema);
            comando.Parameters.AddWithValue("@ponderacion", ponderacion);
            comando.Parameters.AddWithValue("@fecha", fecha);
            leer = comando.ExecuteReader();

            conexion.CerrarConexion();
        }
        public void EliminarActividades(int id)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "delete from actividades where idActividad = @idActividad";
            comando.Parameters.AddWithValue("@idActividad", id);
            leer = comando.ExecuteReader();
            conexion.CerrarConexion();
        }
        public void EditarActividades(int id,string nombre, string descripcion, string grupo, int tema, int ponderacion, DateTime fecha)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "update actividades set nombre=@nombre,descripcion=@descripcion,grupo=@grupo,tema=@tema,ponderacion=@ponderacion,fecha=@fecha where idActividad=@idActividad";
            comando.Parameters.AddWithValue("@nombre", nombre);
            comando.Parameters.AddWithValue("@descripcion", descripcion);
            comando.Parameters.AddWithValue("@grupo", grupo);
            comando.Parameters.AddWithValue("@tema", tema);
            comando.Parameters.AddWithValue("@ponderacion", ponderacion);
            comando.Parameters.AddWithValue("@fecha", fecha);
            comando.Parameters.AddWithValue("@idActividad", id);
            comando.ExecuteNonQuery();
            comando.Parameters.Clear();
        }
    }
}
