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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private Materials _currentMaterials = new Materials();
        public AddEditPage(Materials selectedMaterials)
        {
            InitializeComponent();
            _currentMaterials = selectedMaterials;
            DataContext = _currentMaterials;
            ComboMaterials.ItemsSource = absoluteExamEntities.GetContext().MaterialsType.ToList();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (_currentMaterials.MaterialsName == null)
                errors.AppendLine("Напишите имя!");
            if (_currentMaterials.MaterialsType == null)
                errors.AppendLine("Выберите тип!");
            if (_currentMaterials.MaterialsMinPrice == null)
                errors.AppendLine("Напишите минимальную стоимость!");
            if (_currentMaterials.MaterialsMinQuantity == null)
                errors.AppendLine("Напишите количество!");
            if (_currentMaterials.MaterialsMinQuantity == null)
                errors.AppendLine("Напишите минимальное количество!");
            if (_currentMaterials.MaterialsInBox == null)
                errors.AppendLine("Напишите количество в коробке!");
            if (_currentMaterials.MaterialsUnit == null)
                errors.AppendLine("Напишите единицу измерения!");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
            }
            if (absoluteExamEntities.GetContext().Entry(_currentMaterials).State == EntityState.Detached)
            {
                absoluteExamEntities.GetContext().Materials.Add(_currentMaterials);
            }
            try
            {
                absoluteExamEntities.GetContext().SaveChanges();
                MessageBox.Show("Данные сохранены");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
