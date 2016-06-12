using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace situationLourdeBTS.UserControls
{
    /// <summary>
    /// Interaction logic for EmployeeUserControl.xaml
    /// </summary>
    public partial class EmployeeUserControl : UserControl
    {
        private Employee emp;
        private List<SecurityLevel> secLevels;
        private Gestionnaire mainWindow;
        public EmployeeUserControl(Employee _emp, List<SecurityLevel> _secLevels)
        {
            emp = _emp;
            secLevels = _secLevels;
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            AddButton.IsEnabled = (emp == null);
            DeleteButton.IsEnabled = !(emp == null);
            mainWindow = (Window.GetWindow(this) as Gestionnaire);

            if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            {
                if (emp == null)
                {
                    emp = new Employee();
                }
                nameTextBox.DataContext = emp;
                idTextBox.DataContext = emp;
                clearanceExpirationDatePicker.DataContext = emp;
                securityLevelComboBox.ItemsSource = secLevels;
                securityLevelComboBox.DataContext = emp;
                
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.context.Employees.Remove(emp);
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.context.Employees.Add(emp);
            mainWindow.context.SaveChanges();
            UserControl_Loaded(sender, e);
        }
    }
}
