﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;

namespace CapaNegocio
{
    public class CN_Empleados
    {
        CD_Empleados _CD_empleados = new CD_Empleados();
        DataTable tablaempleados = new DataTable();

        public DataTable MostrarEmpleados()
        {
            return tablaempleados = _CD_empleados.Mostrarempleados();
        }

        public void Agregarempleados( String idPersona, String idEmpleo)
        {

            _CD_empleados.Agregarempleados( Convert.ToInt32(idPersona), Convert.ToInt32(idEmpleo));
        }

        public void Editarempleados( String idPersona, String idEmpleo)
        {
            _CD_empleados.Editarempleados(Convert.ToInt32(idPersona), Convert.ToInt32(idEmpleo));
        }

        public void Eliminarempleados(String idEmpleado)
        {
            _CD_empleados.Eliminarempleados(Convert.ToInt32(idEmpleado));
        }
        
        public int UltimoID()
        {
            return _CD_empleados.ultimoID();
        }
    }
}
