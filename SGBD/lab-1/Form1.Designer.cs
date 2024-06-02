
using System.Drawing;
using System.Windows.Forms;

namespace lab_1
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            this.nume = new System.Windows.Forms.Label();
            this.pret = new System.Windows.Forms.Label();
            this.dataNastere = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dataNastereInput = new System.Windows.Forms.DateTimePicker();
            this.addDog = new System.Windows.Forms.Button();
            this.updateDog = new System.Windows.Forms.Button();
            this.deleteDog = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.dataGridParent = new System.Windows.Forms.DataGridView();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridParent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // nume
            // 
            this.nume.AutoSize = true;
            this.nume.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nume.Location = new System.Drawing.Point(59, 9);
            this.nume.Name = "nume";
            this.nume.Size = new System.Drawing.Size(51, 24);
            this.nume.TabIndex = 0;
            this.nume.Text = "Nume:";
            // 
            // pret
            // 
            this.pret.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.pret.AutoSize = true;
            this.pret.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.pret.Location = new System.Drawing.Point(69, 49);
            this.pret.Name = "pret";
            this.pret.Size = new System.Drawing.Size(41, 24);
            this.pret.TabIndex = 1;
            this.pret.Text = "Pret:";
            // 
            // dataNastere
            // 
            this.dataNastere.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.dataNastere.AutoSize = true;
            this.dataNastere.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dataNastere.Location = new System.Drawing.Point(12, 87);
            this.dataNastere.Name = "dataNastere";
            this.dataNastere.Size = new System.Drawing.Size(98, 24);
            this.dataNastere.TabIndex = 2;
            this.dataNastere.Text = "Data Nastere:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(116, 13);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(183, 22);
            this.textBox1.TabIndex = 3;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(116, 49);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(143, 22);
            this.textBox2.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(265, 49);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(37, 24);
            this.label1.TabIndex = 6;
            this.label1.Text = "RON";
            // 
            // dataNastereInput
            // 
            this.dataNastereInput.CustomFormat = "";
            this.dataNastereInput.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dataNastereInput.Location = new System.Drawing.Point(116, 89);
            this.dataNastereInput.MinDate = new System.DateTime(1900, 1, 1, 0, 0, 0, 0);
            this.dataNastereInput.Name = "dataNastereInput";
            this.dataNastereInput.Size = new System.Drawing.Size(183, 22);
            this.dataNastereInput.TabIndex = 7;
            this.dataNastereInput.Value = new System.DateTime(1900, 1, 1, 0, 0, 0, 0);
            // 
            // addDog
            // 
            this.addDog.Font = new System.Drawing.Font("Courier New", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.addDog.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.addDog.Location = new System.Drawing.Point(16, 534);
            this.addDog.Name = "addDog";
            this.addDog.Size = new System.Drawing.Size(121, 46);
            this.addDog.TabIndex = 8;
            this.addDog.Text = "ADD";
            this.addDog.UseVisualStyleBackColor = true;
            this.addDog.Click += new System.EventHandler(this.addDog_Click);
            // 
            // updateDog
            // 
            this.updateDog.Font = new System.Drawing.Font("Courier New", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.updateDog.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.updateDog.Location = new System.Drawing.Point(529, 534);
            this.updateDog.Name = "updateDog";
            this.updateDog.Size = new System.Drawing.Size(121, 46);
            this.updateDog.TabIndex = 9;
            this.updateDog.Text = "UPDATE";
            this.updateDog.UseVisualStyleBackColor = true;
            this.updateDog.Click += new System.EventHandler(this.updateDog_Click);
            // 
            // deleteDog
            // 
            this.deleteDog.Font = new System.Drawing.Font("Courier New", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.deleteDog.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.deleteDog.Location = new System.Drawing.Point(667, 534);
            this.deleteDog.Name = "deleteDog";
            this.deleteDog.Size = new System.Drawing.Size(121, 46);
            this.deleteDog.TabIndex = 10;
            this.deleteDog.Text = "DELETE";
            this.deleteDog.UseVisualStyleBackColor = true;
            this.deleteDog.Click += new System.EventHandler(this.deleteDog_Click);
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(20, 233);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(123, 24);
            this.label2.TabIndex = 11;
            this.label2.Text = "Selecteaza Rasa:";
            // 
            // dataGridParent
            // 
            this.dataGridParent.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridParent.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridParent.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dataGridParent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridParent.Location = new System.Drawing.Point(24, 279);
            this.dataGridParent.Name = "dataGridParent";
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Consolas", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.InfoText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.ButtonShadow;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridParent.RowHeadersDefaultCellStyle = dataGridViewCellStyle7;
            this.dataGridParent.RowHeadersWidth = 51;
            dataGridViewCellStyle8.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Consolas", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.Color.Black;
            this.dataGridParent.RowsDefaultCellStyle = dataGridViewCellStyle8;
            this.dataGridParent.RowTemplate.Height = 24;
            this.dataGridParent.Size = new System.Drawing.Size(409, 244);
            this.dataGridParent.TabIndex = 12;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView1.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView1.BackgroundColor = System.Drawing.Color.PowderBlue;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(439, 89);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            dataGridViewCellStyle9.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle9.Font = new System.Drawing.Font("Consolas", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle9.ForeColor = System.Drawing.Color.Black;
            this.dataGridView1.RowsDefaultCellStyle = dataGridViewCellStyle9;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.RowTemplate.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(961, 434);
            this.dataGridView1.TabIndex = 13;
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(435, 62);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(168, 24);
            this.label3.TabIndex = 14;
            this.label3.Text = "Caini din rasa selectata:";
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Bahnschrift Condensed", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(12, 124);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(398, 96);
            this.label4.TabIndex = 15;
            this.label4.Text = "selecteaza 2 caini din tabela de caini, \r\npt a alege tatal si mama.\r\nnu selectati" +
    " nimic daca parintii nu apar.\r\nPt update trebuie modificati si mama si tata ca s" +
    "a mearga.\r\n";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Teal;
            this.ClientSize = new System.Drawing.Size(1428, 592);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.dataGridParent);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.deleteDog);
            this.Controls.Add(this.updateDog);
            this.Controls.Add(this.addDog);
            this.Controls.Add(this.dataNastereInput);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.dataNastere);
            this.Controls.Add(this.pret);
            this.Controls.Add(this.nume);
            this.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.Name = "Form1";
            this.Text = "Vanzari Caini";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridParent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Label nume;
        private Label pret;
        private Label dataNastere;
        private TextBox textBox1;
        private TextBox textBox2;
        private Label label1;
        private DateTimePicker dataNastereInput;
        private Button addDog;
        private Button updateDog;
        private Button deleteDog;
        private Label label2;
        private DataGridView dataGridParent;
        private DataGridView dataGridView1;
        private Label label3;
        private Label label4;
    }
}

