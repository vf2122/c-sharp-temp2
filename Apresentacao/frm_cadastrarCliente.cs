using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Negocios;
using ObjetoTransferecia;

namespace Apresentacao
{
    public partial class frm_cadastrarCliente : Form
    {
        ClienteNegocios clienteNegocios = new ClienteNegocios();

        public frm_cadastrarCliente()
        {
            InitializeComponent();
            atualizarGrid();
            
        }


        public void atualizarGrid()
        {
            ClienteColecao clienteColecao = clienteNegocios.consultar();
            var colecao = clienteColecao.Select(selecao => new
            {
                IDPessoa = selecao.Pessoa.IDPessoa,
                Nome = selecao.Pessoa.Nome,
                IDPessoaTipo = selecao.Pessoa.IDPessoaTipo.IDPessoaTipo,
                descricaoTipo = selecao.Pessoa.IDPessoaTipo.descricaoTipo

            }).ToList();

            dataGridView1.DataSource = null;
            dataGridView1.DataSource = colecao;
        }


        private void frm_cadastrarCliente_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(clienteNegocios.inserir(Convert.ToInt32(textBox1.Text)),"alerta");
            atualizarGrid();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            clienteNegocios.excluir(Convert.ToInt32(textBox1.Text));
            atualizarGrid();
        }
    }
}
