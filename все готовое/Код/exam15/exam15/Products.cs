//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace exam15
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.MaterialsProducts = new HashSet<MaterialsProducts>();
        }
    
        public int ProductsId { get; set; }
        public Nullable<int> ProductsTypeLink { get; set; }
        public string ProductsName { get; set; }
        public string ProductsArticle { get; set; }
        public Nullable<double> ProductsMinPrice { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MaterialsProducts> MaterialsProducts { get; set; }
        public virtual ProductType ProductType { get; set; }
    }
}
