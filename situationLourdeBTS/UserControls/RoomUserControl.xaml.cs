using System;
using System.Collections.Generic;
using System.Collections.Specialized;
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
using System.Collections.ObjectModel;

namespace situationLourdeBTS.UserControls
{
    /// <summary>
    /// Interaction logic for RoomUserControl.xaml
    /// </summary>
    public partial class RoomUserControl : UserControl
    {
        public Room Room { get; set; }
        public ObservableCollection<SecurityLevel> InactiveSecurityLevel { get; private set; }
        private Gestionnaire mainWindow;
        public RoomUserControl(Room _room)
        {
            Room = _room;
            InitializeComponent();
            ((INotifyCollectionChanged)ActiveSecListBox.Items).CollectionChanged += RoomUserControl_CollectionChanged;
        }

        private void RoomUserControl_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if(e.Action == NotifyCollectionChangedAction.Remove)
            {
                InactiveSecurityLevel.Add(e.OldItems[0] as SecurityLevel);
            }
            else if(e.Action == NotifyCollectionChangedAction.Add)
            {
                InactiveSecurityLevel.Remove(e.NewItems[0] as SecurityLevel);
            }
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            AddButton.IsEnabled = (Room == null);
            DeleteButton.IsEnabled = !(Room == null);
            mainWindow = (Window.GetWindow(this) as Gestionnaire);

            if (!System.ComponentModel.DesignerProperties.GetIsInDesignMode(this))
            {
                if (Room == null)
                {
                    Room = new Room();
                }
                nameTextBox.DataContext = Room;
                idTextBox.DataContext = Room;
                ActiveSecListBox.ItemsSource = Room.SecurityLevels;

                FillInactiveList(Room.SecurityLevels.ToList());

                InactiveSecListBox.ItemsSource = InactiveSecurityLevel;
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.context.Rooms.Add(Room);
            mainWindow.context.SaveChanges();
            UserControl_Loaded(sender, e);
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            mainWindow.context.Rooms.Remove(Room);
        }

        private void EnableSecButton_Click(object sender, RoutedEventArgs e)
        {
            Room.SecurityLevels.Add(InactiveSecListBox.SelectedItem as SecurityLevel);
            //InactiveSecurityLevel.Remove(InactiveSecListBox.SelectedItem as SecurityLevel);
            //InactiveSecListBox.Items.Refresh();
        }

        private void DisableSecButton_Click(object sender, RoutedEventArgs e)
        {
            Room.SecurityLevels.Remove(ActiveSecListBox.SelectedItem as SecurityLevel);
            //InactiveSecurityLevel.Add(ActiveSecListBox.SelectedItem as SecurityLevel);
        }

        private void FillInactiveList(List<SecurityLevel> activeList)
        {
            InactiveSecurityLevel = new ObservableCollection<SecurityLevel>(mainWindow.context.SecurityLevels);
            foreach (SecurityLevel sec in activeList)
            {
                InactiveSecurityLevel.Remove(sec);
            }
        }
    }
}
