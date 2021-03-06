﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;

namespace TECSystem
{
    public partial class Profesores : Form
    {
        CN_Profesores _CN_Profesores = new CN_Profesores();
        public Profesores()
        {
            InitializeComponent();
        }

        private void Label1_Click(object sender, EventArgs e)
        {

        }

        private void Profesores_Load(object sender, EventArgs e)
        {
            MostrarProfesores();
        }

        private void MostrarProfesores()
        {
            CN_Profesores _CN_Profesores = new CN_Profesores();
            dtgProfesores.DataSource = _CN_Profesores.MostrarProfesores();
        }

        private void DtgProfesores_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            txtIdProfesor.Text = dtgProfesores.CurrentRow.Cells["idProfesor"].Value.ToString();
            txtIdEmpleado.Text = dtgProfesores.CurrentRow.Cells["idEmpleado"].Value.ToString();
            txtIdAcademia.Text = dtgProfesores.CurrentRow.Cells["idAcademia"].Value.ToString();
            txttipoMem.Text = dtgProfesores.CurrentRow.Cells["tipoMemb"].Value.ToString();
            btnEditar.Enabled = true;
            btnEliminar.Enabled = true;
        }

        private void BtnAgregar_Click(object sender, EventArgs e)
        {
            if (txtIdProfesor.Text == "" || txtIdEmpleado.Text == "" || txtIdAcademia.Text == "" || txtNuevoIdProfesor.Text == "" || txttipoMem.Text == "")
            {
                MessageBox.Show("No puede ingresar un profesor, aún faltan datos por completar", "Datos incompletos",
                               MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            }
            else
            {
                _CN_Profesores.AgregarProfesores(txtIdProfesor.Text, txtIdEmpleado.Text, txtIdAcademia.Text, txttipoMem.Text);
                MostrarProfesores();
                Limpiartxt();
            }
        }

        private void Limpiartxt()
        {
            txtIdProfesor.Clear();
            txtIdEmpleado.Clear();
            txtIdAcademia.Clear();
            txttipoMem.Clear();
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            if (txtIdProfesor.Text == "" || txtIdEmpleado.Text == "" || txtIdAcademia.Text == "" || txtNuevoIdProfesor.Text == "" || txttipoMem.Text == "")
            {
                MessageBox.Show("No puede editar un profesor, aún faltan datos por completar", "Datos incompletos",
                               MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            }
            else
            {
                _CN_Profesores.EditarProfesores(txtIdProfesor.Text, txtIdEmpleado.Text, txtIdAcademia.Text, txttipoMem.Text, txtNuevoIdProfesor.Text);
                MostrarProfesores();
                Limpiartxt();
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
            }
        }

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            _CN_Profesores.EliminarProfesores(dtgProfesores.CurrentRow.Cells["idProfesor"].Value.ToString());
            MostrarProfesores();
            Limpiartxt();
            btnEditar.Enabled = false;
            btnEliminar.Enabled = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Reportes r = new Reportes();
            r.setReporte(4);
            r.ShowDialog();
        }

        private void txtIdEmpleado_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar)) { e.Handled = false; }
            else if (Char.IsControl(e.KeyChar)) { e.Handled = false; }
            else if (Char.IsSeparator(e.KeyChar)) { e.Handled = false; }
            else
            {
                e.Handled = true;
            }
        }

        private void txtIdAcademia_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar)) { e.Handled = false; }
            else if (Char.IsControl(e.KeyChar)) { e.Handled = false; }
            else if (Char.IsSeparator(e.KeyChar)) { e.Handled = false; }
            else
            {
                e.Handled = true;
            }
        }

        private void txttipoMem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar)) { e.Handled = false; }
            else if (Char.IsControl(e.KeyChar)) { e.Handled = false; }
            else if (Char.IsSeparator(e.KeyChar)) { e.Handled = false; }
            else
            {
                e.Handled = true;
            }
        }
    }
}
