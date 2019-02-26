using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;//added
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using uStore3.DATA.EF;
using System.Drawing.Imaging;//added for PixelFormat
using System.Drawing.Drawing2D;//added for CompositingQuality
using System.IO;//added for FileInfo
using uStore3.SERVICES;
using uStore.DOMAIN.Repositories;

namespace uStore3.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductCategoriesController : Controller
    {
        //private uStore2Entities db = new uStore2Entities();
        UnitOfWork uow = new UnitOfWork();

        // GET: ProductCategories
        public ActionResult Index()
        {
            
            //var productCategories = db.ProductCategories.Include(p => p.Category).Include(p => p.Product);
            var productCategories = uow.ProductCategoryRepository.Get(includeProperties: "Category, Product");
            return View(productCategories.ToList());
        }

        // GET: ProductCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //ProductCategory productCategory = db.ProductCategories.Find(id);
            ProductCategory productCategory = uow.ProductCategoryRepository.Find(id);
            if (productCategory == null)
            {
                return HttpNotFound();
            }
            return View(productCategory);
        }

        // GET: ProductCategories/Create
        public ActionResult Create()
        {
            //ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
            ViewBag.CategoryId = new SelectList(uow.CategoryRepository.Get(), "CategoryId", "CategoryName");
            //ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName");
            ViewBag.ProductId = new SelectList(uow.ProductRepository.Get(), "ProductId", "ProductName");
            return View();
        }

        // POST: ProductCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductCategoryId,CategoryId,ProductId")] ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                //db.ProductCategories.Add(productCategory);
                //db.SaveChanges();

                uow.ProductCategoryRepository.Add(productCategory);
                uow.Save();
                return RedirectToAction("Index");
            }

            //ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", productCategory.CategoryId);
            ViewBag.CategoryId = new SelectList(uow.CategoryRepository.Get(), "CategoryId", "CategoryName");
            //ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productCategory.ProductId);
            ViewBag.ProductId = new SelectList(uow.ProductRepository.Get(), "ProductId", "ProductName");
            return View(productCategory);
        }

        // GET: ProductCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //ProductCategory productCategory = db.ProductCategories.Find(id);
            ProductCategory productCategory = uow.ProductCategoryRepository.Find(id);
            if (productCategory == null)
            {
                return HttpNotFound();
            }
            //ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", productCategory.CategoryId);
            ViewBag.CategoryId = new SelectList(uow.CategoryRepository.Get(), "CategoryId", "CategoryName");
            //ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productCategory.ProductId);
            ViewBag.ProductId = new SelectList(uow.ProductRepository.Get(), "ProductId", "ProductName");
            return View(productCategory);
        }

        // POST: ProductCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductCategoryId,CategoryId,ProductId")] ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(productCategory).State = EntityState.Modified;
                //db.SaveChanges();

                uow.ProductCategoryRepository.Update(productCategory);
                uow.Save();
                return RedirectToAction("Index");
            }
            //ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", productCategory.CategoryId);
            ViewBag.CategoryId = new SelectList(uow.CategoryRepository.Get(), "CategoryId", "CategoryName");
            //ViewBag.ProductId = new SelectList(db.Products, "ProductId", "ProductName", productCategory.ProductId);
            ViewBag.ProductId = new SelectList(uow.ProductRepository.Get(), "ProductId", "ProductName");
            return View(productCategory);
        }

        // GET: ProductCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //ProductCategory productCategory = db.ProductCategories.Find(id);
            ProductCategory productCategory = uow.ProductCategoryRepository.Find(id);
            if (productCategory == null)
            {
                return HttpNotFound();
            }
            return View(productCategory);
        }

        // POST: ProductCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //ProductCategory productCategory = db.ProductCategories.Find(id);
            ProductCategory productCategory = uow.ProductCategoryRepository.Find(id);
            //db.ProductCategories.Remove(productCategory);
            //db.SaveChanges();

            uow.ProductCategoryRepository.Remove(productCategory);
            uow.Save();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                uow.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
