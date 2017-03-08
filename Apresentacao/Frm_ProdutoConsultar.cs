using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data;
using System.Data.SqlClient;
using System.Data.Odbc;



namespace Apresentacao
{
    public partial class Frm_ProdutoConsultar : Form
    {
        public Frm_ProdutoConsultar()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            try
            {

                SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=professordrausio;Persist Security Info=True;User ID=sa;Password=123");
                conn.Open();

                string query = "SELECT * FROM tblProduto WHERE IDProduto = " + textBox1.Text;

                DataTable dataTable = new DataTable();

                SqlCommand command = new SqlCommand(query, conn);


                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);

                dataGridViewProduto.DataSource = null;
                dataGridViewProduto.DataSource = dataTable;

            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }

        }
    }
}
