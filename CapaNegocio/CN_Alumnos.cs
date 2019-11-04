﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using CapaDatos;

namespace CapaNegocio
{
    public class CN_Alumnos
    {
        CD_Alumnos obj = new CD_Alumnos();

        public DataTable mostrarAlumnos()
        {
            DataTable tabla = new DataTable();
            tabla = obj.mostrar();
            return tabla;
        }
        
        public void agregar_alumno(string matricula, int idPersona, int idCarrera, string tutor, int idEspecialidad, int estatus)
        {
            obj.insertar(matricula,idPersona,idCarrera,tutor,idEspecialidad,estatus);
        }
        public void editar_alumno(string matricula, int idPersona, int idCarrera, string tutor, int idEspecialidad, int estatus)
        {
            obj.editar(matricula, idPersona, idCarrera, tutor, idEspecialidad, estatus);
        }
        public void eliminar_alumno(string matricula)
        {
            obj.eliminar(matricula);
        }
    }
}
