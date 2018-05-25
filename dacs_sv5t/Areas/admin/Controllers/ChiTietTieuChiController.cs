using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Help;
using DACS_SV5T.Models;

namespace DACS_SV5T.Areas.admin.Controllers
{
    public class ChiTietTieuChiController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/ChiTietTieuChi
        public ActionResult Index()
        {
            var cT_TEUCHI = db.CT_TEUCHI.Include(c => c.TIEUCHI);
            return View(cT_TEUCHI.ToList());
        }

        // GET: admin/ChiTietTieuChi/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CT_TEUCHI cT_TEUCHI = db.CT_TEUCHI.Find(id);
            if (cT_TEUCHI == null)
            {
                return HttpNotFound();
            }
            return View(cT_TEUCHI);
        }

        // GET: admin/ChiTietTieuChi/Create
        public ActionResult Create()
        {
            ViewBag.ID_TCHI = new SelectList(db.TIEUCHIs, "ID_TCHI", "TEN_TCHI");
            return View();
        }

        // POST: admin/ChiTietTieuChi/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_CTTCHI,ID_TCHI,NOIDUNG")] CT_TEUCHI cT_TEUCHI)
        {
            if (ModelState.IsValid)
            {
                db.CT_TEUCHI.Add(cT_TEUCHI);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_TCHI = new SelectList(db.TIEUCHIs, "ID_TCHI", "TEN_TCHI", cT_TEUCHI.ID_TCHI);
            return View(cT_TEUCHI);
        }

        // GET: admin/ChiTietTieuChi/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CT_TEUCHI cT_TEUCHI = db.CT_TEUCHI.Find(id);
            if (cT_TEUCHI == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_TCHI = new SelectList(db.TIEUCHIs, "ID_TCHI", "TEN_TCHI", cT_TEUCHI.ID_TCHI);
            return View(cT_TEUCHI);
        }

        // POST: admin/ChiTietTieuChi/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_CTTCHI,ID_TCHI,NOIDUNG")] CT_TEUCHI cT_TEUCHI)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cT_TEUCHI).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_TCHI = new SelectList(db.TIEUCHIs, "ID_TCHI", "TEN_TCHI", cT_TEUCHI.ID_TCHI);
            return View(cT_TEUCHI);
        }

        // GET: admin/ChiTietTieuChi/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CT_TEUCHI cT_TEUCHI = db.CT_TEUCHI.Find(id);
            if (cT_TEUCHI == null)
            {
                return HttpNotFound();
            }
            return View(cT_TEUCHI);
        }

        // POST: admin/ChiTietTieuChi/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CT_TEUCHI cT_TEUCHI = db.CT_TEUCHI.Find(id);
            db.CT_TEUCHI.Remove(cT_TEUCHI);
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
