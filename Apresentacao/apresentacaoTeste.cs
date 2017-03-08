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
    public partial class apresentacaoTeste : Form
    {
        public apresentacaoTeste()
        {
            InitializeComponent();


            PedidoNegocios pedidoNegocios = new PedidoNegocios();
            PedidoColecao pedidoColecao = pedidoNegocios.ConsultarPorData(dateTimePicker1.Value, dateTimePicker2.Value);
            dataGridView1.DataSource = null;
            var novaLista = pedidoColecao.Select(Pedido => new
            {

                IDOperacao = Pedido.Operacao.IDOperacao,
                DescOperacao = Pedido.Operacao.Descricao,
                IDSituacao = Pedido.Situacao.IDSituacao,
                DescSituacao = Pedido.Situacao.Descricao,
                NomeEmitente = Pedido.Emitente.Nome,
                IDPessoaDestinatario = Pedido.Destinatario.IDPessoa,
                NomeDestinatario = Pedido.Destinatario.Nome

            }).ToList();

            dataGridView1.DataSource = novaLista;

        }

        private void apresentacaoTeste_Load(object sender, EventArgs e)
        {

        }
    }
}
