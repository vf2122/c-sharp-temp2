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
    public class ClienteNegocios
    {

        AcessoDadosSqlServer acessoDados = new AcessoDadosSqlServer();


        public string inserir(int iDPessoaCliente)
        {

            try
            {
                acessoDados.LimparParametros();
                acessoDados.AdicionarParametros("@IDPessoaCliente", iDPessoaCliente);
                return acessoDados.ExecutarManipulacao(CommandType.StoredProcedure, "uspClienteInserir").ToString();
            }
            catch(Exception ex)
            {
                return ex.Message;
            }

        }


        public void excluir(int iDPessoaCliente)
        {
            try
            {
                acessoDados.LimparParametros();
                acessoDados.AdicionarParametros("@IDPessoaCliente", iDPessoaCliente);
                acessoDados.ExecutarManipulacao(CommandType.StoredProcedure, "uspClienteExcluir");
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }




        public ClienteColecao consultar()
        {
            try
            {
                ClienteColecao clienteColecao = new ClienteColecao();

                acessoDados.LimparParametros();
                acessoDados.AdicionarParametros("@Nome", "%");
                DataTable dataTable = acessoDados.ExecutarConsulta(CommandType.StoredProcedure, "uspConsultarClientePorCodigoNome");

                foreach (DataRow dataRow in dataTable.Rows)
                {
                    Cliente cliente = new Cliente();
                    cliente.Pessoa = new Pessoa();
                    cliente.Pessoa.IDPessoa = Convert.ToInt32(dataRow["IDPessoaCliente"]);
                    cliente.Pessoa.Nome = Convert.ToString(dataRow["Nome"]);
                    cliente.Pessoa.IDPessoaTipo = new PessoaTipo();
                    cliente.Pessoa.IDPessoaTipo.IDPessoaTipo = Convert.ToInt32(dataRow["IDPessoaTipo"]);
                    cliente.Pessoa.IDPessoaTipo.descricaoTipo = dataRow["DescricaoTipo"].ToString();

                    clienteColecao.Add(cliente);
                }

                return clienteColecao;

            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao consultar item do pedido. Detalhe: " + ex.Message);
            }
            
        }


    }
}
