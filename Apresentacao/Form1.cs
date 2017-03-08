using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Apresentacao
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            apresentacaoTeste apres = new apresentacaoTeste();
            apres.Show();
        }

        private void clienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frm_cadastrarCliente frm = new frm_cadastrarCliente();
            frm.Show();
        }

        private void consultarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Frm_ProdutoConsultar frm_ProdutoConsultar = new Frm_ProdutoConsultar();
            frm_ProdutoConsultar.Show();
        }
    }
}
