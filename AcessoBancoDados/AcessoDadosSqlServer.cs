using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;               //banco de dados
using System.Data.SqlClient;    // banco de dados sqlserver
using AcessoBancoDados.Properties;

namespace AcessoBancoDados
{
    public class AcessoDadosSqlServer
    {
        //criar conexao
        private SqlConnection CriarConexao()
        {
            return new SqlConnection(Settings.Default.stringConexao);
        }

        //Paramentro que vao para o banco
        private SqlParameterCollection sqlParameterCollection = new SqlCommand().Parameters;

        //limpar
        public void LimparParametros()
        {
            sqlParameterCollection.Clear();
        }

        //adicionar
        public void AdicionarParametros(string nomeParametro, object valorParametro)
        {
            sqlParameterCollection.Add(new SqlParameter(nomeParametro, valorParametro));
        }


        //Persistencia - Inserir, Alterar, Excluir
        public Object ExecutarManipulacao(CommandType commandType, string nomeStoredProcedureOuTextoSql)
        {
            try
            {
                //criar conexao
                SqlConnection sqlConnection = CriarConexao();
                //abrir Conexao
                sqlConnection.Open();
                //Criar comando que vai levar informacoes para o banco
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                //Colocar as coisas dentro do comando
                sqlCommand.CommandType = commandType;
                sqlCommand.CommandText = nomeStoredProcedureOuTextoSql;
                sqlCommand.CommandTimeout = 7200;

                //Adicionar os parametro no banco
                foreach(SqlParameter sqlParameter in sqlParameterCollection)
                {
                    sqlCommand.Parameters.Add(new SqlParameter(sqlParameter.ParameterName, sqlParameter.Value));
                }

                //executar o comando
                return sqlCommand.ExecuteScalar();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }



        //consultar registros do banco de dados
        public DataTable ExecutarConsulta(CommandType commandType, string nomeStoredProcedureOuTextoSql)
        {
            try
            {
                //Criar a conexao
                SqlConnection sqlConnection = CriarConexao();
                //Abrir a conexao
                sqlConnection.Open();
                //Criar o comando que vai ate o banco de dados
                SqlCommand sqlCommand = sqlConnection.CreateCommand();
                //colocar as coisas dentro do comando
                sqlCommand.CommandType = commandType;
                sqlCommand.CommandText = nomeStoredProcedureOuTextoSql;
                sqlCommand.CommandTimeout = 7200;

                //adicionar os parametros
                foreach (SqlParameter sqlParameter in sqlParameterCollection)
                {
                    sqlCommand.Parameters.Add(sqlParameter.ParameterName, sqlParameter.Value);
                }

                //criar um adaptador
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                //DataTable = tabela de dados vazia
                DataTable dataTable = new DataTable();
                //Mandar o comando ir ate o banco buscar os dados e o adaptador
                sqlDataAdapter.Fill(dataTable);

                return dataTable;
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

    }
}
