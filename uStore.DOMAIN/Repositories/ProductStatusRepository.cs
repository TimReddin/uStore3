using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uStore3.DATA.EF;//Added
using uStore3.Domain.Repositories;//Added
using System.Data.Entity;//Added

namespace uStore.DOMAIN.Repositories
{
    public class ProductStatusRepository : GenericRepository<ProductStatus>
    {
        //V3 add unit of work
        public ProductStatusRepository(DbContext db) : base(db) { }
    }
}
