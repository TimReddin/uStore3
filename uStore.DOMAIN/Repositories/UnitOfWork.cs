using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using uStore3.DATA.EF;

namespace uStore.DOMAIN.Repositories
{
    #region Unit of Work Notes
    /*
    * Various design patterns can drastically improve our maintainability
    * of our application, however, these patterns can present various issues
    * of their own. In the titleController, we have 3 different repositories
    * being instantiated. (GenreRepo, Publisher, Title) Besides the increase
    * in code and the performance issues of maintaining those objects there
    * are other issues dealing with multiple database connections that we can
    * run into. These issues can be resolved by implementing the Unit of Work
    * pattern.
    * 
    * Martin Fowler: Unit of Work- Maintains a list of objects affected by
    * a business transaction and coordinates the writing out of changes and
    * the resolution of concurrency problems.
    * 
    * Our implementation of unit of work will:
    * -Manage the instantiation of our various repositories
    * -Manage the call to save changes made to the database from changes
    * made across all models through their respective repositories
    * -Instantiation of repos
    * -Instantiation of database context
    * -Saving all changes
    * -Disposing the database context 
    * 
    * 
    *Items of Note:
    * -Pay attention to the Casing of UoW properties these are important
    * -Typically implementing UoW pattern is a process that is all done
    * in ONE step (rather than converting one repository and testing before
    * converting ALL repositories. ALL repositories need to be converted
    * BEFORE any testing can occur due to changes in the GenericRepository).
    */
    #endregion

    //create an interface to be implemented on our class 
    //- forcing the fullfillment of a method called Save.

    //interface IUnitOfWork "EXTENDS" IDisposable

    public interface IUnitOfWork : IDisposable
    {
        void Save();
    }


    public class UnitOfWork : IUnitOfWork
    {

        //fields
        internal uStore2Entities context = new uStore2Entities();//represents db access


        //field-property pairs
        private ProductRepository _productRepository;
        public ProductRepository ProductRepository
        {
            get
            {
                if (this._productRepository == null)
                {
                    this._productRepository = new ProductRepository(context);
                }
                return _productRepository;
            }
        }

        private ProductStatusRepository _productStatusRepository;
        public ProductStatusRepository ProductStatusRepository
        {
            get
            {
                if (this._productStatusRepository == null)
                {
                    this._productStatusRepository = new ProductStatusRepository(context);
                }
                return _productStatusRepository;
            }
        }

        private ProductCategoryRepository _productCategoryRepository;
        public ProductCategoryRepository ProductCategoryRepository
        {
            get
            {
                if (this._productCategoryRepository == null)
                {
                    this._productCategoryRepository = new ProductCategoryRepository(context);
                }
                return _productCategoryRepository;
            }
        }

        private CategoryRepository _categoryRepository;
        public CategoryRepository CategoryRepository
        {
            get
            {
                if (this._categoryRepository == null)
                {
                    this._categoryRepository = new CategoryRepository(context);
                }
                return _categoryRepository;
            }
        }

        //(other) methods
        public void Save()
        {
            context.SaveChanges();
        }

        //----Dispose code...
        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }


    }
}
