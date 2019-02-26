using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uStore3.Data.EF;//added for cStoreEntites and domain model
using System.Data.Entity;//added for DBSets etc (EF stuff)


namespace uStore3.Domain.Repositories
{
    //v1 - no interface
    //public class GenericRepository<TEntity> where TEntity : class

    //v2 - with interface
    public class GenericRepository<TEntity> where TEntity : class
    {
        /* Generics: make it possible in C# to write code that is NOT specific to any one type/entity,
         * but then use that code for MANY different types/entities.
         * 
         * This repository will be available for use by ANY domain model (entity).
         * 
         * "<TEntity>" says this is a generic where some type will be swapped out.
         * "where TEntity : class " says the type will be a class not a struct.
         * 
         * */

        //---BEFORE UNIT OF WORK - WE HAD OUR OWN BASIC DB variable
        //private cStoreEntities db = new cStoreEntities();

        //---NOW WITH UNIT OF WORK - it exists through the context of the UoW
        //--that it resides in...
        internal DbContext db;
        public GenericRepository(DbContext context)
        {
            this.db = context;
        }


        //v1 - simple Get() -- good for tables with no connected records
        //public List<TEntity> Get()
        //{
        //    return db.Set<TEntity>().ToList();
        //}

        //-----v2 Get() allows us to OPTIONALLY get lookup table info more easily
        public virtual List<TEntity> Get(string includeProperties = "")
        {
            IQueryable<TEntity> query = db.Set<TEntity>();

            foreach (var includeProperty in includeProperties.Split
            (new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries))
            {
                query = query.Include(includeProperty);
            }

            return query.ToList();
        }

        /// <summary>
        /// Allows us to retrieve one record from the database table.
        /// </summary>
        /// <param name="id">Primary key value that uniquely identifies the record</param>
        /// <returns>Targeted record is returned as an object.</returns>
        public TEntity Find(object id)
        {
            return db.Set<TEntity>().Find(id);
        }

        public void Add(TEntity entity)
        {
            db.Set<TEntity>().Add(entity);
            //db.SaveChanges();//removed for unit of work
        }


        public void Update(TEntity entity)
        {
            db.Entry(entity).State = EntityState.Modified;
            //db.SaveChanges();//removed for unit of work
        }

        public void Remove(TEntity entity)
        {
            db.Set<TEntity>().Remove(entity);
            //db.SaveChanges();//removed for unit of work
        }

        //--added after interface required them. can use code hints to "implement interface"
        public void Remove(object id)
        {
            //throw new NotImplementedException();
            //here we'll delete record with only its ID passed.
            var entity = db.Set<TEntity>().Find(id);
            Remove(entity);
        }

        public int CountRecords()
        {
            //throw new NotImplementedException();
            return Get().Count();
        }


        //-------MOVED TO UNIT OF WORK
        ////----Dispose code...
        //private bool disposed = false;

        //protected virtual void Dispose(bool disposing)
        //{
        //    if (!this.disposed)
        //    {
        //        if (disposing)
        //        {
        //            db.Dispose();
        //        }
        //    }
        //    this.disposed = true;
        //}

        //public void Dispose()
        //{
        //    Dispose(true);
        //    GC.SuppressFinalize(this);
        //}


    }
}
