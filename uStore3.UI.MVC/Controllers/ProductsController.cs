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
    [Authorize]
    public class ProductsController : Controller
    {
        //private uStore2Entities db = new uStore2Entities();

        UnitOfWork uow = new UnitOfWork();

        // GET: Products
        [AllowAnonymous]
        public ActionResult Index(string category)
        {
            //var products = db.Products.Include(p => p.ProductStatus);
            var products = uow.ProductRepository.Get(includeProperties: "ProductStatus");

            if (String.IsNullOrEmpty(category))
            {             
                return View(products.ToList());
            }
            else
            {
                //OR LINQ method chaining syntax option (same result):
                List<Product> searchResultsV2 =
                    (uow.ProductRepository.Get()
                    .Where(x => x.ProductStatus.StatusName.Contains(category)).ToList());
                return View(products.ToList());
            }
            
            
        }

        // GET: Products/Details/5
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Product product = db.Products.Find(id);
            Product product = uow.ProductRepository.Find(id);

            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin, Customer Service")]
        public ActionResult Create()
        {
            ViewBag.ProductStatusId = new SelectList(uow.ProductStatusRepository.Get(), "ProductStatusId", "StatusName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Customer Service")]
        public ActionResult Create([Bind(Include = "ProductId,ProductName,ProductDescription,Price,UnitsInStock,ProductImage,ProductStatusId")] Product product, HttpPostedFileBase gmImageUpload)
        {
            if (ModelState.IsValid)
            {
                #region FILE UPLOAD (CREATE) WITH IMAGE SERVICE
                string imageName = "NoImage.jpg";

                if (gmImageUpload != null)
                {
                    //find the extension
                    imageName = gmImageUpload.FileName;
                    string imgExtention = imageName.Substring(imageName.LastIndexOf("."));
                    //string imgExtention = System.IO.Path.GetExtension(bkImageUpload.FileName); Another option to get extension


                    string[] goodExtensions = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExtensions.Contains(imgExtention.ToLower()))
                    {
                        imageName = Guid.NewGuid() + imgExtention; //created unique filename

                        //rather than save this file to the server directly, we'll use the ImageService
                        //to do it - makes 2 copies, main & thumbnail.

                        //let's prep all the parameters that will be needed.
                        string imgPath = Server.MapPath("~/Content/Images/_BoxCovers/"); //folder path

                        Image convertedImage = Image.FromStream(gmImageUpload.InputStream); //get file as image

                        //choose max img size in pixels
                        int maxImageSize = 400;
                        // choose max img size for thumbnail in pixels
                        int maxThumbSize = 100;

                        //call image service to rezie and save images

                        ImageServices.ResizeImage(imgPath, imageName, convertedImage, maxImageSize, maxThumbSize);
                    }
                    else
                    {
                        //handle invalid file type somehow....
                        imageName = "NoImage.jpg";
                    }

                }

                //regardless of whether a file was uploaded, set the image name on the db record (hijack record)
                product.ProductImage = imageName;

                #endregion

                //db.Products.Add(product);
                //db.SaveChanges();

                uow.ProductRepository.Add(product);
                uow.Save();
                return RedirectToAction("Index");
            }

            ViewBag.ProductStatusId = new SelectList(uow.ProductStatusRepository.Get(), "ProductStatusId", "StatusName", product.ProductStatusId);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin, Customer Service")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Product product = db.Products.Find(id);
            Product product = uow.ProductRepository.Find(id);

            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductStatusId = new SelectList(uow.ProductStatusRepository.Get(), "ProductStatusId", "StatusName", product.ProductStatusId);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin, Customer Service")]
        public ActionResult Edit([Bind(Include = "ProductId,ProductName,ProductDescription,Price,UnitsInStock,ProductImage,ProductStatusId")] Product product, HttpPostedFileBase gmImageUpload)
        {
            if (ModelState.IsValid)
            {

                            #region FILE UPLOAD (EDIT) WITH IMAGE SERVICE
                //Variation for EDIT - Don't defaullt to no image
                //string imageName = "NoImage.jpg";

                if (gmImageUpload != null)
                {
                    //find the extension
                    //Variation for EDIT variable declaration happens here add 'string'
                    string imageName = gmImageUpload.FileName;
                    string imgExtention = imageName.Substring(imageName.LastIndexOf("."));
                    //string imgExtention = System.IO.Path.GetExtension(bkImageUpload.FileName); Another option to get extension


                    string[] goodExtensions = { ".jpg", ".jpeg", ".gif", ".png" };

                    if (goodExtensions.Contains(imgExtention.ToLower()))
                    {
                        imageName = Guid.NewGuid() + imgExtention; //created unique filename

                        //rather than save this file to the server directly, we'll use the ImageService
                        //to do it - makes 2 copies, main & thumbnail.

                        //let's prep all the parameters that will be needed.
                        string imgPath = Server.MapPath("~/Content/Images/_BoxCovers/"); //folder path

                        Image convertedImage = Image.FromStream(gmImageUpload.InputStream); //get file as image

                        //choose max img size in pixels
                        int maxImageSize = 400;
                        // choose max img size for thumbnail in pixels
                        int maxThumbSize = 100;

                        //call image service to rezie and save images

                        ImageServices.ResizeImage(imgPath, imageName, convertedImage, maxImageSize, maxThumbSize);

                    }
                    else
                    {
                        //handle invalid file type somehow....
                        //Variation for EDIT
                        //imageName = "NoImage.jpg";
                    }
                    // Variation for EDIT
                    product.ProductImage = imageName;
                }

                //regardless of whether a file was uploaded, set the image name on the db record (hijack record)

                #endregion




                //db.Entry(product).State = EntityState.Modified;
                //db.SaveChanges();

                uow.ProductRepository.Update(product);
                uow.Save();
                return RedirectToAction("Index");
            }
            ViewBag.ProductStatusId = new SelectList(uow.ProductStatusRepository.Get(), "ProductStatusId", "StatusName", product.ProductStatusId);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Product product = db.Products.Find(id);
            Product product = uow.ProductRepository.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            //Product product = db.Products.Find(id);
            Product product = uow.ProductRepository.Find(id);

            #region Delete Associated BookImage If it exists (Use ImageService)
            //Set path on server where images are stored
            string path = Server.MapPath("~/Content/Images/_BoxCovers/");
            ImageServices.Delete(path, product.ProductImage);
            #endregion


            //db.Products.Remove(product);
            //db.SaveChanges();

            uow.ProductRepository.Remove(product);
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
