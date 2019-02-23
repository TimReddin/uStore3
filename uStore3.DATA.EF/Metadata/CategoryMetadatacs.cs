using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uStore3.Data.EF//.Metadata
{
    [MetadataType(typeof(CategoryMetadata))]
    public partial class Category { }

    public partial class CategoryMetadata
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
    }
}
