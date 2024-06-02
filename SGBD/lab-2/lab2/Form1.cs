using System;
using System.Configuration;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab2
{
    public partial class Form1 : Form
    {
        private int id_parent = -1;
        private static readonly string Con = ConfigurationManager.ConnectionStrings["cn"].ConnectionString;
        private static readonly string ParentName = ConfigurationManager.AppSettings["ParentTableName"];
        private static readonly string ChildName = ConfigurationManager.AppSettings["ChildTableName"];
        private static readonly string ChildId = ConfigurationManager.AppSettings["ChildID"];
        private static readonly int ChildNumberOfColumns = int.Parse(ConfigurationManager.AppSettings["ChildNumberOfColumns"]);
        private static readonly string InsertQuery = ConfigurationManager.AppSettings["ChildInsertQUERY"];
        private static readonly string DeleteQuery = ConfigurationManager.AppSettings["ChildDeleteQUERY"];
        private static readonly string UpdateQuery = ConfigurationManager.AppSettings["ChildUpdateQUERY"];
        private static readonly string ChildArr = ConfigurationManager.AppSettings["ChildArr"];
        private static readonly string ChildColumnNames = ConfigurationManager.AppSettings["ChildColumnNames"];
        private static readonly string ChildColumnTypes = ConfigurationManager.AppSettings["ChildColumnTypes"];
        private static readonly string ChildToParentId = ConfigurationManager.AppSettings["ChildToParentID"];

        private readonly SqlConnection _connection = new SqlConnection(Con);
        private readonly SqlDataAdapter _dataAdapter = new SqlDataAdapter();
        private readonly BindingSource _bindingSourceParent = new BindingSource();
        private readonly BindingSource _bindingSourceChild = new BindingSource();
        private readonly DataSet _dataSetParent = new DataSet();
        private readonly DataSet _dataSetChild = new DataSet();
        private readonly TextBox[] _textBoxes = new TextBox[ChildNumberOfColumns];
        private readonly Label[] _labels = new Label[ChildNumberOfColumns];

        public Form1()
        {
            InitializeComponent(); 
            Console.WriteLine(_connection.ConnectionString);
            var names = ChildColumnNames.Split(new[] { ", " }, StringSplitOptions.None);
            for (var i = 0; i < ChildNumberOfColumns; i++)
            {
                _labels[i] = new Label();
                _textBoxes[i] = new TextBox();


                _labels[i].Text = names[i];
                _labels[i].Location = new Point(15, 400 + i * 25);
                _labels[i].AutoSize = true;

                _textBoxes[i].Text = "";
                _textBoxes[i].Location = new Point(100, 400 + i * 25);
            }
        }

        private void dataGridViewParent_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridViewParent.Rows[e.RowIndex].Cells[e.ColumnIndex].Value == null)
                return;

            var id = dataGridViewParent.Rows[e.RowIndex].Cells[0].Value.ToString();
            id_parent = int.Parse(id);
            _dataAdapter.SelectCommand = new SqlCommand(
                $"SELECT * from {ChildName} where {ChildName}.{ChildToParentId} = {id}; ", _connection);
            _dataSetChild.Clear();
            _dataAdapter.Fill(_dataSetChild);
            dataGridViewChild.DataSource = _dataSetChild.Tables[0];
            _bindingSourceChild.DataSource = _dataSetChild.Tables[0];
            dataGridViewChild.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
        }

        private void buttonConnectDB_Click(object sender, EventArgs e)
        {
            _connection.Open();
            _dataAdapter.SelectCommand = new SqlCommand("SELECT * FROM " + ParentName + ";", _connection);
            _dataAdapter.SelectCommand.ExecuteNonQuery();
            _connection.Close();
            _dataSetParent.Clear();
            _dataAdapter.Fill(_dataSetParent);
            dataGridViewParent.DataSource = _dataSetParent.Tables[0];
            _bindingSourceParent.DataSource = _dataSetParent.Tables[0];
            dataGridViewParent.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            _bindingSourceParent.MoveLast();
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if (dataGridViewChild.SelectedCells.Count == 0)
            {
                MessageBox.Show(
                    "Se va selecta o singura linie!",
                    "Warning",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning
                    );
                return;
            }

            if (dataGridViewChild.SelectedCells.Count > 1)
            {
                MessageBox.Show(
                    "Sunt selectate mai multe linii",
                    "Warning",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning
                    );
                return;
            }

            _dataAdapter.DeleteCommand = new SqlCommand(DeleteQuery, _connection);

            _dataAdapter.DeleteCommand.Parameters.Add("@id",
                SqlDbType.Int).Value = _dataSetChild.Tables[0].Rows[dataGridViewChild.CurrentCell.RowIndex][0];

            _connection.Open();
            _dataAdapter.DeleteCommand.ExecuteNonQuery();
            _connection.Close();
            _dataSetChild.Clear();
            _dataAdapter.Fill(_dataSetChild);

        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            if (dataGridViewChild.SelectedCells.Count == 0)
            {
                MessageBox.Show(
                    "Se va selecta o singura linie!",
                    "Warning",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning
                    );
                return;
            }

            if (dataGridViewChild.SelectedCells.Count > 1)
            {
                MessageBox.Show(
                    "Sunt selectate mai multe linii",
                    "Warning",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Warning
                    );
                return;
            }
            _dataAdapter.UpdateCommand = new SqlCommand(UpdateQuery, _connection);
            _dataAdapter.UpdateCommand.Parameters.Add("@id", SqlDbType.Int).Value =
                _dataSetChild.Tables[0].Rows[dataGridViewChild.CurrentCell.RowIndex][0];

            var args = ChildArr.Split(new[] { ", " }, StringSplitOptions.None);
            var types = ChildColumnTypes.Split(new[] { ", " }, StringSplitOptions.None);

            try
            {
                for (var i = 0; i < ChildNumberOfColumns; i++)
                {
                    switch (types[i])
                    {
                        case "string":
                            _dataAdapter.UpdateCommand.Parameters.Add(args[i], SqlDbType.VarChar).Value =
                                _textBoxes[i].Text;
                            break;
                        case "int":
                            _dataAdapter.UpdateCommand.Parameters.Add(args[i], SqlDbType.Int).Value =
                                int.Parse(_textBoxes[i].Text);
                            break;
                        case "float":
                            _dataAdapter.UpdateCommand.Parameters.Add(args[i], SqlDbType.Float).Value =
                                float.Parse(_textBoxes[i].Text);
                            break;
                        case "datetime":
                            _dataAdapter.UpdateCommand.Parameters.Add(args[i], SqlDbType.DateTime).Value =
                                DateTime.Parse(_textBoxes[i].Text);
                            break;
                        default:
                            MessageBox.Show(@"Unsupported data type");
                            break;
                    }
                }

                _connection.Open();
                var x = _dataAdapter.UpdateCommand.ExecuteNonQuery();
                _connection.Close();
                _dataSetChild.Clear();
                _dataAdapter.Fill(_dataSetChild);
                if (x >= 1) MessageBox.Show("Actualizat!", "Done", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                _connection.Close();
                MessageBox.Show("Input gresit! Error: " + ex.Message, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            _dataAdapter.InsertCommand = new SqlCommand(InsertQuery, _connection);

            var args = ChildArr.Split(new[] { ", " }, StringSplitOptions.None);
            var types = ChildColumnTypes.Split(new[] { ", " }, StringSplitOptions.None);

            try
            {
                for (var i = 0; i < ChildNumberOfColumns; i++)
                {
                    switch (types[i])
                    {
                        case "string":
                            _dataAdapter.InsertCommand.Parameters.Add(args[i], SqlDbType.VarChar).Value =
                                _textBoxes[i].Text;
                            break;
                        case "int":
                            _dataAdapter.InsertCommand.Parameters.Add(args[i], SqlDbType.Int).Value =
                                int.Parse(_textBoxes[i].Text);
                            break;
                        case "float":
                            _dataAdapter.InsertCommand.Parameters.Add(args[i], SqlDbType.Float).Value =
                                float.Parse(_textBoxes[i].Text);
                            break;
                        case "datetime":
                            _dataAdapter.InsertCommand.Parameters.Add(args[i], SqlDbType.DateTime).Value =
                                DateTime.Parse(_textBoxes[i].Text);
                            break;
                        default:
                            MessageBox.Show(@"Unsupported data type");
                            break;
                    }
                }


                _dataAdapter.InsertCommand.Parameters.Add("@id", SqlDbType.Int).Value = id_parent;

                _connection.Open();  //pornesc conexiunea
                _dataAdapter.InsertCommand.ExecuteNonQuery();  //execut comanda de insert
                _connection.Close(); //inchid conexiunea
                _dataSetChild.Clear();
                _dataAdapter.Fill(_dataSetChild); //populez DataSetChild
            }
            catch (Exception ex)
            {
                _connection.Close();
                MessageBox.Show("Input gresit! Error: " + ex.Message, "Error",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            for (var i = 0; i < ChildNumberOfColumns; i++)
            {
                Controls.Add(_labels[i]);
                Controls.Add(_textBoxes[i]);
            }
        }
    }
}
