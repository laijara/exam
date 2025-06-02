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

namespace exam15
{
    /// <summary>
    /// Логика взаимодействия для NavigatedPage.xaml
    /// </summary>
    public partial class NavigatedPage : Page
    {
        public NavigatedPage()
        {
            InitializeComponent();
        }

        private void BtnMaterials_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new MaterialsPage());
        }
    }
}
