using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using uStore3.DATA.EF;

namespace uStore3.UI.MVC.Controllers
{
    [Authorize(Roles = "Admin")]
    public class UserOrdersController : Controller
    {
        private uStore2Entities db = new uStore2Entities();

        // GET: UserOrders
        public ActionResult Index()
        {
            var userOrders = db.UserOrders.Include(u => u.AspNetUser).Include(u => u.Order);
            return View(userOrders.ToList());
        }

        // GET: UserOrders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserOrder userOrder = db.UserOrders.Find(id);
            if (userOrder == null)
            {
                return HttpNotFound();
            }
            return View(userOrder);
        }

        // GET: UserOrders/Create
        public ActionResult Create()
        {
            ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.OrderId = new SelectList(db.Orders, "OrderId", "OrderId");
            return View();
        }

        // POST: UserOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserOrderId,AspNetUserId,OrderId")] UserOrder userOrder)
        {
            if (ModelState.IsValid)
            {
                db.UserOrders.Add(userOrder);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userOrder.AspNetUserId);
            ViewBag.OrderId = new SelectList(db.Orders, "OrderId", "OrderId", userOrder.OrderId);
            return View(userOrder);
        }

        // GET: UserOrders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserOrder userOrder = db.UserOrders.Find(id);
            if (userOrder == null)
            {
                return HttpNotFound();
            }
            ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userOrder.AspNetUserId);
            ViewBag.OrderId = new SelectList(db.Orders, "OrderId", "OrderId", userOrder.OrderId);
            return View(userOrder);
        }

        // POST: UserOrders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserOrderId,AspNetUserId,OrderId")] UserOrder userOrder)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userOrder).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AspNetUserId = new SelectList(db.AspNetUsers, "Id", "Email", userOrder.AspNetUserId);
            ViewBag.OrderId = new SelectList(db.Orders, "OrderId", "OrderId", userOrder.OrderId);
            return View(userOrder);
        }

        // GET: UserOrders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserOrder userOrder = db.UserOrders.Find(id);
            if (userOrder == null)
            {
                return HttpNotFound();
            }
            return View(userOrder);
        }

        // POST: UserOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserOrder userOrder = db.UserOrders.Find(id);
            db.UserOrders.Remove(userOrder);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
