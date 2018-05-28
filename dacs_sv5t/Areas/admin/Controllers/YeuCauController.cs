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
    public class YeuCauController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/YeuCau
        public ActionResult Index(long? ID_LTCHI = null)
        {
            getTieuChi(ID_LTCHI);
            return View();
        }
        public void getTieuChi(long? selectedId = null)
        {
            ViewBag.YeuCau = new SelectList(db.LOAITIEUCHIs, "ID_LTCHI", "TEN_LTCHI", selectedId);
        }

        public ActionResult getYeuCau(long? id)
        {
            if (id == null)
            {
                var v = db.TIEUCHIs.ToList();
                return PartialView(v);
            }
            var m = db.TIEUCHIs.Where(x => x.ID_LTCHI == id).ToList();
            return PartialView(m);
        }

        // GET: admin/YeuCau/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TIEUCHI tIEUCHI = db.TIEUCHIs.Find(id);
            if (tIEUCHI == null)
            {
                return HttpNotFound();
            }
            return View(tIEUCHI);
        }

        // GET: admin/YeuCau/Create
        public ActionResult Create()
        {
            ViewBag.ID_LTCHI = new SelectList(db.LOAITIEUCHIs, "ID_LTCHI", "TEN_LTCHI");
            return View();
        }

        // POST: admin/YeuCau/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_TCHI,TEN_TCHI,ID_LTCHI")] TIEUCHI tIEUCHI)
        {
            if (ModelState.IsValid)
            {
                db.TIEUCHIs.Add(tIEUCHI);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_LTCHI = new SelectList(db.LOAITIEUCHIs, "ID_LTCHI", "TEN_LTCHI", tIEUCHI.ID_LTCHI);
            return View(tIEUCHI);
        }

        // GET: admin/YeuCau/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TIEUCHI tIEUCHI = db.TIEUCHIs.Find(id);
            if (tIEUCHI == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_LTCHI = new SelectList(db.LOAITIEUCHIs, "ID_LTCHI", "TEN_LTCHI", tIEUCHI.ID_LTCHI);
            return View(tIEUCHI);
        }

        // POST: admin/YeuCau/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_TCHI,TEN_TCHI,ID_LTCHI")] TIEUCHI tIEUCHI)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tIEUCHI).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_LTCHI = new SelectList(db.LOAITIEUCHIs, "ID_LTCHI", "TEN_LTCHI", tIEUCHI.ID_LTCHI);
            return View(tIEUCHI);
        }

        // GET: admin/YeuCau/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TIEUCHI tIEUCHI = db.TIEUCHIs.Find(id);
            if (tIEUCHI == null)
            {
                return HttpNotFound();
            }
            return View(tIEUCHI);
        }

        // POST: admin/YeuCau/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TIEUCHI tIEUCHI = db.TIEUCHIs.Find(id);
            db.TIEUCHIs.Remove(tIEUCHI);
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
