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
using System.Data.Entity;

namespace exam15
{
    /// <summary>
    /// Логика взаимодействия для MaterialsPage.xaml
    /// </summary>
    public partial class MaterialsPage : Page
    {
        public MaterialsPage()
        {
            InitializeComponent();
            DGridMaterials.ItemsSource = absoluteExamEntities.GetContext().Materials.Include(p => p.MaterialsType).ToList();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                absoluteExamEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridMaterials.ItemsSource = absoluteExamEntities.GetContext().Materials.Include(p => p.MaterialsType).ToList();
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            var selectedItems = (sender as Button).DataContext as Materials;
            var loadedItems = absoluteExamEntities.GetContext().Materials.Include(p => p.MaterialsType).FirstOrDefault(p => p.MaterialsId == selectedItems.MaterialsId);
            Manager.MainFrame.Navigate(new AddEditPage(loadedItems));
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditPage(null));
        }
    }
}
