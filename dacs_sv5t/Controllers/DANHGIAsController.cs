using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Controllers
{
    public class DANHGIAsController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: DANHGIAs
        public ActionResult Index()
        {
            var dANHGIAs = db.DANHGIAs.Include(d => d.CAP).Include(d => d.CT_TEUCHI);
            return View(dANHGIAs.ToList());
        }

        // GET: DANHGIAs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHGIA dANHGIA = db.DANHGIAs.Find(id);
            if (dANHGIA == null)
            {
                return HttpNotFound();
            }
            return View(dANHGIA);
        }

        // GET: DANHGIAs/Create
        public ActionResult Create()
        {
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP");
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG");
            return View();
        }

        // POST: DANHGIAs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_CAP,ID_CTTCHI,TCHUAN_HOCTAP,TCHUAN_HD,DUYET")] DANHGIA dANHGIA)
        {
            if (ModelState.IsValid)
            {
                db.DANHGIAs.Add(dANHGIA);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", dANHGIA.ID_CAP);
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", dANHGIA.ID_CTTCHI);
            return View(dANHGIA);
        }

        // GET: DANHGIAs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHGIA dANHGIA = db.DANHGIAs.Find(id);
            if (dANHGIA == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", dANHGIA.ID_CAP);
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", dANHGIA.ID_CTTCHI);
            return View(dANHGIA);
        }

        // POST: DANHGIAs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_CAP,ID_CTTCHI,TCHUAN_HOCTAP,TCHUAN_HD,DUYET")] DANHGIA dANHGIA)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dANHGIA).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", dANHGIA.ID_CAP);
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", dANHGIA.ID_CTTCHI);
            return View(dANHGIA);
        }

        // GET: DANHGIAs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DANHGIA dANHGIA = db.DANHGIAs.Find(id);
            if (dANHGIA == null)
            {
                return HttpNotFound();
            }
            return View(dANHGIA);
        }

        // POST: DANHGIAs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DANHGIA dANHGIA = db.DANHGIAs.Find(id);
            db.DANHGIAs.Remove(dANHGIA);
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
