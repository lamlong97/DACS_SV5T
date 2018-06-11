using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Areas.admin.Controllers
{
    public class GioiThieuController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/GioiThieu
        public ActionResult Index()
        {
            return View(db.GIOITHIEUx.ToList());
        }

        // GET: admin/GioiThieu/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GIOITHIEU gIOITHIEU = db.GIOITHIEUx.Find(id);
            if (gIOITHIEU == null)
            {
                return HttpNotFound();
            }
            return View(gIOITHIEU);
        }

        // GET: admin/GioiThieu/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/GioiThieu/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_gt,aboutus")] GIOITHIEU gIOITHIEU)
        {
            if (ModelState.IsValid)
            {
                db.GIOITHIEUx.Add(gIOITHIEU);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(gIOITHIEU);
        }

        // GET: admin/GioiThieu/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GIOITHIEU gIOITHIEU = db.GIOITHIEUx.Find(id);
            if (gIOITHIEU == null)
            {
                return HttpNotFound();
            }
            return View(gIOITHIEU);
        }

        // POST: admin/GioiThieu/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "id_gt,aboutus")] GIOITHIEU gIOITHIEU)
        {
            GIOITHIEU temp = getbyID(1);
            if (ModelState.IsValid)
            {
                temp.aboutus = gIOITHIEU.aboutus;
                db.Entry(temp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gIOITHIEU);
        }
        public GIOITHIEU getbyID(long id)
        {
            return db.GIOITHIEUx.Where(x => x.id_gt == id).FirstOrDefault();
        }
        // GET: admin/GioiThieu/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GIOITHIEU gIOITHIEU = db.GIOITHIEUx.Find(id);
            if (gIOITHIEU == null)
            {
                return HttpNotFound();
            }
            return View(gIOITHIEU);
        }

        // POST: admin/GioiThieu/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GIOITHIEU gIOITHIEU = db.GIOITHIEUx.Find(id);
            db.GIOITHIEUx.Remove(gIOITHIEU);
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
