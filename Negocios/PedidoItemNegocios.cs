using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using AcessoBancoDados;
using ObjetoTransferecia;
using System.Data;

namespace Negocios
{
    public class PedidoItemNegocios
    {
        AcessoDadosSqlServer acessoDados = new AcessoDadosSqlServer();

        public string Inserir(PedidoItem pedidoItem)
        {
            try
            {

                acessoDados.LimparParametros();
                acessoDados.AdicionarParametros("@IDPedido", pedidoItem.Pedido.IDPedido);
                acessoDados.AdicionarParametros("@IDProduto", pedidoItem.Produto.IDProduto);
                acessoDados.AdicionarParametros("@Quantidade", pedidoItem.Quantidade);
                acessoDados.AdicionarParametros("@ValorUnitario", pedidoItem.ValorUnitario);
                acessoDados.AdicionarParametros("@PercentualDesconto", pedidoItem.PercentualDesconto);
                acessoDados.AdicionarParametros("@ValorDesconto", pedidoItem.ValorDesconto);
                acessoDados.AdicionarParametros("@ValorTotal", pedidoItem.ValorTotal);

                string IDProduto = acessoDados.ExecutarManipulacao(CommandType.StoredProcedure, "uspPedidoItemInserir").ToString();
                return IDProduto;
                
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }


        public PedidoItemColecao Consultar(int iDPedido)
        {
            try
            {
                PedidoItemColecao pedidoItemColecao = new PedidoItemColecao();
                acessoDados.LimparParametros();
                acessoDados.AdicionarParametros("@IDPedido", iDPedido);


                DataTable dataTable = acessoDados.ExecutarConsulta(CommandType.StoredProcedure, "uspPedidoItemConsultar");

                foreach (DataRow dataRow in dataTable.Rows)
                {
                    PedidoItem pedidoItem = new PedidoItem();

                    pedidoItem.Pedido = new Pedido();
                    pedidoItem.Pedido.IDPedido = Convert.ToInt32(dataRow["IDPedido"]);

                    pedidoItem.Produto = new Produto();
                    pedidoItem.Produto.IDProduto = Convert.ToInt32(dataRow["IDProduto"]);
                    pedidoItem.Produto.Descricao = Convert.ToString(dataRow["DescProduto"]);

                    pedidoItem.Quantidade = Convert.ToInt32(dataRow["Quantidade"]);
                    pedidoItem.ValorUnitario = Convert.ToDecimal(dataRow["Quantidade"]);
                    pedidoItem.PercentualDesconto = Convert.ToDecimal(dataRow["Quantidade"]);
                    pedidoItem.ValorDesconto = Convert.ToDecimal(dataRow["ValorDesconto"]);
                    pedidoItem.ValorTotal = Convert.ToDecimal(dataRow["ValorTotal"]);

                    pedidoItemColecao.Add(pedidoItem);

                }

                return pedidoItemColecao;
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao consultar item do pedido. Detalhe: " + ex.Message);
            }
        }
    }
}
