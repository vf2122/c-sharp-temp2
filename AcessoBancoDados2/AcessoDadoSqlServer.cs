using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;
using AcessoBancoDados2.Properties;

namespace AcessoBancoDados2
{
    public class AcessoDadoSqlServer
    {
        public SqlConnection CriarConexao()
        {
            SqlConnection conn = new SqlConnection(Settings.Default.stringConexao);
            return conn;
        }


        SqlParameterCollection sqlParameterCollection = new SqlParameterCollection();

        public void LimparParametros()
        {
            sqlParameterCollection.Clear();
        }


        public void AdicionarParametros(string nomeParametro, object valorParametro)
        {
            sqlParameterCollection.Add(new SqlParameter(nomeParametro, valorParametro));
        }

        


        public object ExecutarManipulacao(CommandType commandType, string nomeStoredProcedureTextoSql)
        {

            try
            {
                SqlConnection conn = CriarConexao();
                conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = commandType;
                cmd.CommandText = nomeStoredProcedureTextoSql;
                cmd.CommandTimeout = 7200;


                foreach (SqlParameter sqlParameter in sqlParameterCollection)
                {
                    cmd.Parameters.Add(sqlParameter.ParameterName, sqlParameter.Value);
                }

                return cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            
        }


        public DataTable ExecultarConsulta(CommandType commandType, string nomeStoredProcedureTextoSql)
        {
            SqlConnection conn = CriarConexao();
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = commandType;
            cmd.CommandText = nomeStoredProcedureTextoSql;
            cmd.CommandTimeout = 7200;




        }
    }
}
