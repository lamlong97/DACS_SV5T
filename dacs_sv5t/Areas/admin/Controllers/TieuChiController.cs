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
    public class TieuChiController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/TieuChi
        public ActionResult Index()
        {
            return View(db.LOAITIEUCHIs.ToList());
        }

        // GET: admin/TieuChi/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/TieuChi/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_LTCHI,TEN_LTCHI,NAM")] LOAITIEUCHI lOAITIEUCHI)
        {
            if (ModelState.IsValid)
            {
                db.LOAITIEUCHIs.Add(lOAITIEUCHI);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(lOAITIEUCHI);
        }

        // GET: admin/TieuChi/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LOAITIEUCHI lOAITIEUCHI = db.LOAITIEUCHIs.Find(id);
            if (lOAITIEUCHI == null)
            {
                return HttpNotFound();
            }
            return View(lOAITIEUCHI);
        }

        // POST: admin/TieuChi/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_LTCHI,TEN_LTCHI,NAM")] LOAITIEUCHI lOAITIEUCHI)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lOAITIEUCHI).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lOAITIEUCHI);
        }

        // GET: admin/TieuChi/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LOAITIEUCHI lOAITIEUCHI = db.LOAITIEUCHIs.Find(id);
            if (lOAITIEUCHI == null)
            {
                return HttpNotFound();
            }
            return View(lOAITIEUCHI);
        }

        // POST: admin/TieuChi/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LOAITIEUCHI lOAITIEUCHI = db.LOAITIEUCHIs.Find(id);
            db.LOAITIEUCHIs.Remove(lOAITIEUCHI);
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
