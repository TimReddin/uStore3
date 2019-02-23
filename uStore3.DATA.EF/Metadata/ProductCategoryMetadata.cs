using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uStore3.DATA.EF//.Metadata
{
    [MetadataType(typeof(ProductCategoryMetadata))]
    public partial class ProductCategory { }

    public partial class ProductCategoryMetadata
    {
        public int ProductCategoryId { get; set; }
        public int CategoryId { get; set; }
        public int ProductId { get; set; }
    }
}

