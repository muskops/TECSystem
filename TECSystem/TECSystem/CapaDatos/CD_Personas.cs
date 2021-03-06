﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class CD_Personas
    {
        CD_Conexion conexion = new CD_Conexion();
        SqlDataReader leer;
        DataTable tablaPersonas = new DataTable();
        SqlCommand comando = new SqlCommand();
        public DataTable MostrarPersonas()
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "select * from personas";
            comando.CommandType = CommandType.Text;
            leer = comando.ExecuteReader();
            tablaPersonas.Load(leer);
            conexion.CerrarConexion();
            return tablaPersonas;
        }

        public void AgregarPersonas(String paterno, String materno, String nombres, DateTime fecha_nac, int sexo, String curp, String telefono, String numExt, String numInt, String cp, int edoCivil, int discapacidad, String calle, int localidad)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "insert into personas (paterno,materno,nombres,fecha_nac,sexo,curp,telefono,numExt,numInt,cp," +
                "edoCivil,discapacidad,calle,localidades) values('"+paterno+"', '"+materno+"', '"+nombres+"', convert(datetime,'"+fecha_nac.ToString("MM-dd-yyyy")+"',101)," +
                " "+sexo+", '"+curp+"', '"+telefono+"', '"+numExt+"', '"+numInt+"', '"+cp+"', "+edoCivil+", "+discapacidad+", '"+calle+"', "+localidad+")";
            //comando.CommandText = "insert into personas" +
            //    "(paterno, materno, nombres,fecha_nac, sexo, curp, telefono, idCalle, numExt, numInt, cp, edoCivil, discapacidad) " +
            //    "values('"+paterno+"', '"+materno+ "', '"+nombres+ "', '"+fecha_nac.ToShortDateString()+ "', "+sexo+ ", '"+curp+ "', '"+telefono+ "', "+idCalle+ ", '"+numExt+ "', '"+numInt+ "', '"+cp+ "', "+edoCivil+ ", "+discapacidad+");";
            comando.CommandType = CommandType.Text;
            comando.ExecuteNonQuery();
        }

        public void EditarPersonas(int idPersona, String paterno, String materno, String nombres, DateTime fecha_nac, int sexo, String curp, String telefono, String numExt, String numInt, String cp, int edoCivil, int discapacidad, String calle, int localidad)
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "update personas set paterno = '" + paterno + "', materno = '" + materno + "', nombres = '" + nombres + "',fecha_nac = convert(datetime,'" + fecha_nac.ToString("MM-dd-yyyy") + "',101), sexo =" + sexo+ ", curp = '"+curp+ "', telefono = '"+telefono+"', numExt = '"+numExt+ 
                "', numInt = '"+numInt+ "', cp = '"+cp+ "', edoCivil = "+edoCivil+", discapacidad = " +discapacidad+ ", calle = '" + calle + "', localidades = " + localidad + " where idPersona = " +idPersona+";";
            comando.CommandType = CommandType.Text;
            comando.ExecuteNonQuery();
        }

        public void EliminarPersona(int idPersona) 
        {
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "delete from personas where idPersona = '"+idPersona+"';";
            comando.CommandType = CommandType.Text;
            comando.ExecuteNonQuery();
        }

        public int ultimoID()
        {
            int id;
            comando.Connection = conexion.AbrirConexion();
            comando.CommandText = "select top 1 idPersona from personas order by idPersona DESC";
            comando.CommandType = CommandType.Text;
            leer = comando.ExecuteReader();
            leer.Read();
            id = Convert.ToInt32(leer["idPersona"].ToString());
            conexion.CerrarConexion();
            return id;
        }
    }
}
