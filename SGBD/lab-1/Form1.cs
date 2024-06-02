using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab_1
{
    public partial class Form1 : Form
    {
        DataSet dataSet = new DataSet();
        string connectionStr =
            "Server=DESKTOP-BVSNLKM;" +
            "Database=DBDogs;" +
            "Integrated Security=true;" +
            "TrustServerCertificate=true;";
        SqlConnection con;


        SqlDataAdapter pAdapter;
        SqlDataAdapter cAdapter;

        BindingSource pBS = new BindingSource();
        BindingSource cBS = new BindingSource();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            try
            {
                con = new SqlConnection(connectionStr);
                using (con)
                {
                    con.Open();
                    MessageBox.Show(
                        "Conectat la DB", "Vanzari Caini",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Information
                        );

                    pAdapter = new SqlDataAdapter(
                            "Select * From Rasa;", con
                        );

                    cAdapter = new SqlDataAdapter(
                            "select * from Caine;", con
                        );

                    pAdapter.Fill(dataSet, "Rase");
                    cAdapter.Fill(dataSet, "Caini");



                    pBS.DataSource = dataSet.Tables["Rase"];

                    dataGridParent.DataSource = pBS;

                    DataColumn pPK = dataSet.Tables["Rase"].Columns["id"];
                    DataColumn cFK = dataSet.Tables["Caini"].Columns["rasa_id"];

                    DataRelation dataRelation = new DataRelation(
                        "fk_parent_child", pPK, cFK
                        );

                    dataSet.Relations.Add(dataRelation);

                    cBS.DataSource = pBS;
                    cBS.DataMember = "fk_parent_child";

                    dataGridView1.DataSource = cBS;
                }
            }
            catch (Exception err)
            {
                MessageBox.Show("Eroare conectare:\n" + err.ToString(),
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error
                    );
                Application.Exit();
            }
            con.Close();
        }

        private void addDog_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(connectionStr);
            if (dataGridParent.SelectedRows.Count == 0)
            {
                MessageBox.Show("O linie in parinte trebuie slectata!", "Warning",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (dataGridParent.SelectedRows.Count > 1)
            {
                MessageBox.Show("O singura linie in parinte trebuie slectata!", "Warning",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            {
                if (textBox1.Text.Length == 0 || textBox2.Text.Length == 0)
                {
                    MessageBox.Show(
                        "Missing Data!", "Warning",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Warning
                        );
                    return;
                }
                String nume = textBox1.Text.ToString();
                float pret = 0.0f;
                int blana_id = 1;
                int rasa_id = int.Parse(dataSet.Tables[0].Rows[dataGridParent.CurrentCell.RowIndex][0].ToString());
                try
                {
                    pret = float.Parse(textBox2.Text.ToString());
                }
                catch
                {
                    MessageBox.Show(
                        "Error: Pret not float", "Error",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Error
                        );
                }
                cAdapter.InsertCommand = new SqlCommand(
                    "INSERT INTO Caine(nume, pret, rasa_id, data_nastere, blana_id, tata_id, mama_id) VALUES" +
                    "(@n, @p, @id, @d, @b, @t, @m);", con);

                if (dataGridView1.SelectedRows.Count != 2)
                {

                    cAdapter.InsertCommand.Parameters.Add("@t",
                    SqlDbType.Int).Value = -1;

                    cAdapter.InsertCommand.Parameters.Add("@m",
                    SqlDbType.Int).Value = -1;

                } else
                {
                    var tata = int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());
                    var mama = int.Parse(dataGridView1.SelectedRows[1].Cells[0].Value.ToString());

                    cAdapter.InsertCommand.Parameters.Add("@t",
                    SqlDbType.Int).Value = tata;

                    cAdapter.InsertCommand.Parameters.Add("@m",
                    SqlDbType.Int).Value = mama;

                }

                cAdapter.InsertCommand.Parameters.Add("@id",
                SqlDbType.Int).Value = rasa_id;
                cAdapter.InsertCommand.Parameters.Add("@b",
                SqlDbType.Int).Value = blana_id;
                cAdapter.InsertCommand.Parameters.Add("@n",
                SqlDbType.VarChar).Value = nume;
                cAdapter.InsertCommand.Parameters.Add("@p",
                SqlDbType.Float).Value = pret;
                cAdapter.InsertCommand.Parameters.Add("@d",
                SqlDbType.Date).Value = dataNastereInput.Value;


                con.Open();
                cAdapter.InsertCommand.ExecuteNonQuery();
                con.Close();
                dataSet.Tables["Caini"].Clear();
                cAdapter = new SqlDataAdapter(
                        "select * from Caine;", con
                    );
                cAdapter.Fill(dataSet, "Caini");
            }
        }

        private void deleteDog_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(connectionStr);
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("O linie in parinte trebuie slectata!", "Warning",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (dataGridView1.SelectedRows.Count > 1)
            {
                MessageBox.Show("O singura linie in parinte trebuie slectata!", "Warning",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            int id = int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());

            cAdapter.DeleteCommand = new SqlCommand("Delete From Caine where id = @id;", con);
            cAdapter.DeleteCommand.Parameters.Add("@id",
                SqlDbType.Int).Value = id;

            con.Open();
            cAdapter.DeleteCommand.ExecuteNonQuery();
            con.Close();
            dataSet.Tables["Caini"].Clear();
            cAdapter = new SqlDataAdapter(
                    "select * from Caine;", con
                );
            cAdapter.Fill(dataSet, "Caini");
        }

        private void dataGridParent_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void updateDog_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(connectionStr);
            if (dataGridView1.SelectedRows.Count == 0)
            {
                MessageBox.Show("Selecteaza Cainele de modiicat!", "Warning",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (dataGridView1.SelectedRows.Count > 1)
            {
                MessageBox.Show("Prea multe randuri selectate!", "Warning",
                    MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            var data = dataGridView1.SelectedRows[0].Cells[6].Value;
            var nume_nou = dataGridView1.SelectedRows[0].Cells[1].Value.ToString();
            var pret_nou = float.Parse(dataGridView1.SelectedRows[0].Cells[4].Value.ToString());

            if (dataNastereInput.Value.ToString() != "1/1/1900")
            {
                data = dataNastereInput.Value;
            }
            if (textBox1.Text.Length != 0)
            {
                nume_nou = textBox1.Text;
            }
            if (textBox2.Text.Length != 0)
            {
                pret_nou = float.Parse(textBox2.Text.ToString());
            }

            cAdapter.UpdateCommand = new SqlCommand(
                    "update Caine " + 
                    "set nume = @n, pret = @p, data_nastere = @d " +
                    "where id = @id;", con
                );

            cAdapter.UpdateCommand.Parameters.Add("@id", SqlDbType.Int).Value = int.Parse(dataGridView1.SelectedRows[0].Cells[0].Value.ToString());
            cAdapter.UpdateCommand.Parameters.Add("@n", SqlDbType.VarChar).Value = nume_nou;
            cAdapter.UpdateCommand.Parameters.Add("@d", SqlDbType.Date).Value = data;
            cAdapter.UpdateCommand.Parameters.Add("@p", SqlDbType.Float).Value = pret_nou;

            con.Open();
            cAdapter.UpdateCommand.ExecuteNonQuery();
            con.Close();
            dataSet.Tables["Caini"].Clear();
            cAdapter = new SqlDataAdapter(
                    "select * from Caine;", con
                );
            cAdapter.Fill(dataSet, "Caini");
        }
    }
}
