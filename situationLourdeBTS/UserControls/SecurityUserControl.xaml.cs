using System;
using System.Collections.Generic;
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
    /// Interaction logic for SecurityUserControl.xaml
    /// </summary>
    public partial class SecurityUserControl : UserControl
    {
        public SecurityLevel SecurityLevel { get; set; }
        private Gestionnaire mainWindow;
        public SecurityUserControl(SecurityLevel _securityLevel)
        {           
            SecurityLevel = _securityLevel;
            InitializeComponent();
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            AddButton.IsEnabled = (SecurityLevel == null);
            DeleteButton.IsEnabled = !(SecurityLevel == null);

            mainWindow = (Window.GetWindow(this) as Gestionnaire);
            if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            {
                if(SecurityLevel == null)
                {
                    SecurityLevel = new SecurityLevel();
                }
                descriptionTextBox.DataContext = SecurityLevel;
                idTextBox.DataContext = SecurityLevel;                
             }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.context.SecurityLevels.Add(SecurityLevel);
            mainWindow.context.SaveChanges();
            UserControl_Loaded(sender, e);
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.context.SecurityLevels.Remove(SecurityLevel);
        }
    }
}
