using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace situationLourdeBTS
{
    /// <summary>
    /// Interaction logic for DatabaseUserControl.xaml
    /// </summary>
    public partial class DatabaseUserControl : UserControl
    {
        private string dbKey;
        public DatabaseUserControl(string _dbKey)
        {
            InitializeComponent();
            dbKey = _dbKey;
            FillControls();
            
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            string potentialError;
            if (!DatabaseController.CreateNewConnection(CnxTitleTextBox.Text, ServerNameTextBox.Text, DbNameTextBox.Text, UserIdTextBox.Text, UserPwdTextBox.Text, out potentialError))
            {
                WarningTextBlock.Text = potentialError;
            }
            else
            {
                WarningTextBlock.Text = "Base de données ajouté avec succès.";
            }
        }

        private void FillControls()
        {
            if (dbKey != "")
            {
                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(Properties.Settings.Default.Connections[dbKey]);

                CnxTitleTextBox.Text = dbKey;
                ServerNameTextBox.Text = builder.DataSource;
                DbNameTextBox.Text = builder.InitialCatalog;
                UserIdTextBox.Text = builder.UserID;
                UserPwdTextBox.Text = builder.Password;
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Properties.Settings.Default.Connections.Remove(dbKey);
                Properties.Settings.Default.Save();
                Console.WriteLine(dbKey + " removed");
            }
            catch(ArgumentNullException exception)
            {
                WarningTextBlock.Text = "ERREUR: Base de donnée non-existante.";
                Console.WriteLine(exception);
            }
        }
    }
}
