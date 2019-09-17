﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CDConexion
    {
      //  private SqlConnection Conexion = new SqlConnection("Data Source=DESKTOP-B91CM40\OSCAR;Initial Catalog=BDTEC;Integrated Security=True");
         private SqlConnection Conexion = new SqlConnection("Data Source=.;Initial Catalog=BDTEC;Integrated Security=True");
        public SqlConnection AbrirConexion()
        {
            if (Conexion.State == System.Data.ConnectionState.Closed)
                Conexion.Open();
            return Conexion;
        }
        public SqlConnection CerrarConexion()
        {
            if (Conexion.State == System.Data.ConnectionState.Open)
                Conexion.Close();
            return Conexion;
        }
    }
}
