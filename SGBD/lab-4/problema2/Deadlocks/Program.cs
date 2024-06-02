using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading;

namespace Deadlocks
{
    class Program
    {
        static string connectionString = "Server=DESKTOP-BVSNLKM; Database=Practic; Integrated Security=true;";
        static int noRetries = 3;

        static void Tran1()
        {
            int noTries = 0;
            while (!StartTran1())
            {
                noTries++;
                if (noTries >= noRetries) break;
            }
            if (noTries == noRetries)
                Console.WriteLine("Tranzactia 1 aborted.");
        }

        static void Tran2()
        {
            int noTries = 0;
            while (!StartTran2())
            {
                noTries++;
                if (noTries >= noRetries) break;
            }
            if (noTries == noRetries)
                Console.WriteLine("Tranzactia 2 aborted.");
        }

        static bool StartTran1()
        {
            bool success = false;
            Console.WriteLine("Tranzactia1 incepe...");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                try
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "EXEC deadlock1";
                    command.ExecuteNonQuery();
                    success = true;
                    Console.WriteLine("Tranzactia 2 incheiata");
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 1205)
                    {
                        Console.WriteLine("Tranzactia 1: exceptie: " + ex.GetType());
                        Console.WriteLine("Message: mesaj:" + ex.Message);
                    }
                }
                return success;
            }
        }

        static bool StartTran2()
        {
            bool success = false;
            Console.WriteLine("Tranzactia2 incepe...");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                try
                {
                    connection.Open();
                    command.Connection = connection;
                    command.CommandText = "EXEC deadlock2";
                    command.ExecuteNonQuery();
                    success = true;
                    Console.WriteLine("Tranzactia2 incheiata!");
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 1205)
                    {
                        Console.WriteLine("Tranzactie2: exceptie:" + ex.GetType());
                        Console.WriteLine("Message: mesaj:" + ex.Message);
                    }

                }
                return success;
            }
        }

        public static void Main(string[] args)
        {
            Thread t1 = new Thread(new ThreadStart(Tran1));
            Thread t2 = new Thread(new ThreadStart(Tran2));
            t1.Start();
            t2.Start();
            t1.Join();
            t2.Join();

            Console.WriteLine("\nPress any key to close...");
            Console.ReadKey();
        }
    }
}
