using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
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
using System.Windows.Shapes;

namespace situationLourdeBTS
{
    /// <summary>
    /// Interaction logic for Gestionnaire.xaml
    /// </summary>
    /// 

    public partial class Gestionnaire : Window
    {
        public AccessContext context;

        public enum GridDisplayParameter
        {
            employees, rooms, securityLevels
        }

        //Referenced in XAML, uses radio boxes actions converted through BoolToEnumConverter to set value
        public GridDisplayParameter DisplayParameter
        {
            get
            {
                return displayParameter;
            }
            private set
            {
                displayParameter = value;
                
            }
        }

        private GridDisplayParameter displayParameter = GridDisplayParameter.securityLevels;

        public Gestionnaire()
        {
            InitializeComponent();
            securityLevelDataGrid.LoadingRow += SecurityLevelDataGrid_LoadingRow;
        }

        #region DatabaseControls

        private void ConnexionButton_Click(object sender, RoutedEventArgs e)
        {
            context = new AccessContext(DatabaseController.GetConnection(DatabaseComboBox.SelectedValue.ToString()));
            SetSource();
        }

        private void PropertiesButton_Click(object sender, RoutedEventArgs e)
        {
            if(DatabaseComboBox.SelectedValue != null)
            {
                ControlArea.Content = new DatabaseUserControl(DatabaseComboBox.SelectedValue.ToString());
            }
        }

        private void NewBaseButton_Click(object sender, RoutedEventArgs e)
        {
            ControlArea.Content = new DatabaseUserControl("");
        }


        #endregion

        #region UserControls

        private void AddUserButton_Click(object sender, RoutedEventArgs e)
        {
            ControlArea.Content = new UserControls.EmployeeUserControl(null, context.SecurityLevels.ToList());
        }

        #endregion

        #region RoomControls

        private void AddRoomButton_Click(object sender, RoutedEventArgs e)
        {
            ControlArea.Content = new UserControls.RoomUserControl(null);
        }

        #endregion

        #region SecClearanceControls

        private void AddSecClearanceButton_Click(object sender, RoutedEventArgs e)
        {
            ControlArea.Content = new UserControls.SecurityUserControl(null);
        }

        #endregion

        #region UIControls

        private void QuitButton_Click(object sender, RoutedEventArgs e)
        {
            // Add work saving option?
            Application.Current.Shutdown();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            context.SaveChanges();
            this.securityLevelDataGrid.Items.Refresh();
        }


        private void SetSource()
        {
            CollectionViewSource viewSource;

            if (displayParameter == GridDisplayParameter.employees)
            {
                viewSource = ((CollectionViewSource)(this.FindResource("employeeViewSource")));
                context.Employees.Load();
                viewSource.Source = context.Employees.Local;
            }
            else if (displayParameter == GridDisplayParameter.rooms)
            {
                viewSource = ((CollectionViewSource)(this.FindResource("roomViewSource")));
                context.Rooms.Load();                
                viewSource.Source = context.Rooms.Local;
            }
            else
            {
                viewSource = ((CollectionViewSource)(this.FindResource("securityLevelViewSource")));
                context.SecurityLevels.Load();
                viewSource.Source = context.SecurityLevels.Local;
            }
            
            MainGrid.DataContext = viewSource;
        }


        #endregion

        #region Events

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            context = new AccessContext(DatabaseController.GetConnection(DatabaseComboBox.SelectedValue.ToString()));
            EmployeesRadioButton.Checked += RadioButton_Checked;
            RoomsRadioButton.Checked += RadioButton_Checked;
            SecClearancesRadioButton.Checked += RadioButton_Checked;
            SetSource();
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            DisplayParameter = (GridDisplayParameter)Enum.Parse(typeof(GridDisplayParameter), (sender as RadioButton).Tag.ToString());
            SetSource();
        }

        private void securityLevelDataGrid_AutoGeneratingColumn(object sender, DataGridAutoGeneratingColumnEventArgs e)
        {
            if (e.PropertyType.IsGenericType && e.PropertyType.GetGenericTypeDefinition() == typeof(ObservableCollection<>) || e.PropertyType == typeof(SecurityLevel))
            {
                e.Cancel = true;
            }
        }

        private void securityLevelDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedItem = (sender as DataGrid).SelectedItem;
            if (selectedItem != null)
            {
                if (ObjectContext.GetObjectType(selectedItem.GetType()) == typeof(Employee))
                {
                    ControlArea.Content = new UserControls.EmployeeUserControl(selectedItem as Employee, context.SecurityLevels.ToList());

                }
                else if (ObjectContext.GetObjectType(selectedItem.GetType()) == typeof(SecurityLevel))
                {
                    ControlArea.Content = new UserControls.SecurityUserControl(selectedItem as SecurityLevel);
                }
                else if (ObjectContext.GetObjectType(selectedItem.GetType()) == typeof(Room))
                {
                    ControlArea.Content = new UserControls.RoomUserControl(selectedItem as Room);
                }
            }
        }

        private void SecurityLevelDataGrid_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            if (displayParameter == GridDisplayParameter.employees)
            {
                if ((e.Row.Item as Employee).ClearanceExpiration < DateTime.Now)
                {
                    e.Row.Background = Brushes.Red;
                }
                else if ((e.Row.Item as Employee).ClearanceExpiration < DateTime.Now.AddDays(7))
                {
                    e.Row.Background = Brushes.Orange;
                }
            }
        }
        #endregion
    }
}
