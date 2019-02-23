using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace uStore3.DATA.EF//.Metadata
{
    [MetadataType(typeof(ProductStatusMetadata))]
    public partial class ProductStatus { }

    public partial class ProductStatusMetadata
    {
        public byte ProductStatusId { get; set; }
        public string StatusName { get; set; }
    }
}