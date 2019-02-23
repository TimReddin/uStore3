using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uStore3.DATA.EF//.Metadata
{
    [MetadataType(typeof(ProductMetadata))]
    public partial class Product { }

    public partial class ProductMetadata
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<short> UnitsInStock { get; set; }
        public string ProductImage { get; set; }
        public byte ProductStatusId { get; set; }
    }
}
