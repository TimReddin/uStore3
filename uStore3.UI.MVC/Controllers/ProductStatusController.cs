﻿using System;
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
    public class ProductStatusController : Controller
    {
        //private uStore2Entities db = new uStore2Entities();
        UnitOfWork uow = new UnitOfWork();

        // GET: ProductStatus
        public ActionResult Index()
        {
            //return View(db.ProductStatuses.ToList());
            var products = uow.ProductStatusRepository.Get();
            return View(products.ToList());
           
        }

        // GET: ProductStatus/Details/5
        public ActionResult Details(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //ProductStatus productStatus = db.ProductStatuses.Find(id);
            ProductStatus productStatus = uow.ProductStatusRepository.Find(id);
            if (productStatus == null)
            {
                return HttpNotFound();
            }
            return View(productStatus);
        }

        // GET: ProductStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductStatusId,StatusName")] ProductStatus productStatus)
        {
            if (ModelState.IsValid)
            {
                //db.ProductStatuses.Add(productStatus);
                //db.SaveChanges();

                uow.ProductStatusRepository.Add(productStatus);
                uow.Save();
                return RedirectToAction("Index");
            }

            return View(productStatus);
        }

        // GET: ProductStatus/Edit/5
        public ActionResult Edit(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //ProductStatus productStatus = db.ProductStatuses.Find(id);
            ProductStatus productStatus = uow.ProductStatusRepository.Find(id);
            if (productStatus == null)
            {
                return HttpNotFound();
            }
            return View(productStatus);
        }

        // POST: ProductStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductStatusId,StatusName")] ProductStatus productStatus)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(productStatus).State = EntityState.Modified;
                //db.SaveChanges();

                uow.ProductStatusRepository.Update(productStatus);
                uow.Save();
                return RedirectToAction("Index");
            }
            return View(productStatus);
        }

        // GET: ProductStatus/Delete/5
        public ActionResult Delete(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //ProductStatus productStatus = db.ProductStatuses.Find(id);
            ProductStatus productStatus = uow.ProductStatusRepository.Find(id);
            if (productStatus == null)
            {
                return HttpNotFound();
            }
            return View(productStatus);
        }

        // POST: ProductStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(byte id)
        {
            //ProductStatus productStatus = db.ProductStatuses.Find(id);
            ProductStatus productStatus = uow.ProductStatusRepository.Find(id);

            //db.ProductStatuses.Remove(productStatus);
            //db.SaveChanges();

            uow.ProductStatusRepository.Remove(productStatus);
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
