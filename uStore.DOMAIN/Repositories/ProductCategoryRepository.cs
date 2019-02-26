using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uStore3.DATA.EF;
using uStore3.Domain.Repositories;


namespace uStore.DOMAIN.Repositories
{
    public class ProductCategoryRepository : GenericRepository<ProductCategory>
    {
        //V3 add unit of work
        public ProductCategoryRepository(DbContext db) : base(db) { }
    }
}