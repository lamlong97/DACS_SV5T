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
    public class MINHCHUNGsController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: MINHCHUNGs
        public ActionResult Index()
        {
            var mINHCHUNGs = db.MINHCHUNGs.Include(m => m.CT_TEUCHI).Include(m => m.SINHVIEN);
            return View(mINHCHUNGs.ToList());
        }

        // GET: MINHCHUNGs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MINHCHUNG mINHCHUNG = db.MINHCHUNGs.Find(id);
            if (mINHCHUNG == null)
            {
                return HttpNotFound();
            }
            return View(mINHCHUNG);
        }

        // GET: MINHCHUNGs/Create
        public ActionResult Create()
        {
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG");
            ViewBag.ID_SV = new SelectList(db.SINHVIENs, "ID_SV", "TEN_SV");
            return View();
        }

        // POST: MINHCHUNGs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_SV,ID_CTTCHI,TCHUAN_HOCTAP,TCHUAN_HD,URL,DUYET,MOTA")] MINHCHUNG mINHCHUNG)
        {
            if (ModelState.IsValid)
            {
                db.MINHCHUNGs.Add(mINHCHUNG);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", mINHCHUNG.ID_CTTCHI);
            ViewBag.ID_SV = new SelectList(db.SINHVIENs, "ID_SV", "TEN_SV", mINHCHUNG.ID_SV);
            return View(mINHCHUNG);
        }

        // GET: MINHCHUNGs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MINHCHUNG mINHCHUNG = db.MINHCHUNGs.Find(id);
            if (mINHCHUNG == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", mINHCHUNG.ID_CTTCHI);
            ViewBag.ID_SV = new SelectList(db.SINHVIENs, "ID_SV", "TEN_SV", mINHCHUNG.ID_SV);
            return View(mINHCHUNG);
        }

        // POST: MINHCHUNGs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_SV,ID_CTTCHI,TCHUAN_HOCTAP,TCHUAN_HD,URL,DUYET,MOTA")] MINHCHUNG mINHCHUNG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mINHCHUNG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_CTTCHI = new SelectList(db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", mINHCHUNG.ID_CTTCHI);
            ViewBag.ID_SV = new SelectList(db.SINHVIENs, "ID_SV", "TEN_SV", mINHCHUNG.ID_SV);
            return View(mINHCHUNG);
        }

        // GET: MINHCHUNGs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MINHCHUNG mINHCHUNG = db.MINHCHUNGs.Find(id);
            if (mINHCHUNG == null)
            {
                return HttpNotFound();
            }
            return View(mINHCHUNG);
        }

        // POST: MINHCHUNGs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MINHCHUNG mINHCHUNG = db.MINHCHUNGs.Find(id);
            db.MINHCHUNGs.Remove(mINHCHUNG);
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
