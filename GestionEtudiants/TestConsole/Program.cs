using ManageSingleConnexion;
using System;

namespace TestConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Connexion connection = new Connexion();

                connection.Serveur = @"NATHAN-WINNER";
                connection.Database = "gestion_etudiant";
                connection.User = "sa";
                connection.Password = "Biacityush";

                ImplementeConnexion.Instance.Initialise(connection, ConnexionType.SQLServer);

                if (ImplementeConnexion.Instance.Conn.State == System.Data.ConnectionState.Closed)
                    ImplementeConnexion.Instance.Conn.Open();

                Console.WriteLine("Connection Successfuly !!!");
            }
            catch(InvalidOperationException ex)
            {
                Console.WriteLine("Connection error, " + ex.Message);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                Console.WriteLine("Connection error, " + ex.Message);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Connection error, " + ex.Message);
            }
            finally
            {
                if(ImplementeConnexion.Instance.Conn != null)
                {
                    if(ImplementeConnexion.Instance.Conn.State == System.Data.ConnectionState.Open)
                        ImplementeConnexion.Instance.Conn.Close();
                }    
            }

            Console.ReadLine();
        }
    }
}
