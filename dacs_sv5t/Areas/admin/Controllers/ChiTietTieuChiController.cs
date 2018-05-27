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
        public ActionResult Index(long? YeuCau, long? LTC)
        {
            //var cT_TEUCHI = db.CT_TEUCHI.Include(c => c.TIEUCHI);
            getYeuCau(YeuCau);
            getLTC(LTC);
            return View();
        }
        public void getYeuCau(long? selectedId = null)
        {
            int temp = Convert.ToInt32(Session["LTC"]);
            if (temp == 0)
            {
                ViewBag.YeuCau = new SelectList(db.TIEUCHIs, "ID_TCHI", "TEN_TCHI", selectedId);

            }
            else
            {
                ViewBag.YeuCau = new SelectList(db.TIEUCHIs.Where(o => o.ID_LTCHI == temp), "ID_TCHI", "TEN_TCHI", selectedId);
            }
        }
        public void getLTC(long? selectedId = null)
        {
            ViewBag.LTC = new SelectList(db.LOAITIEUCHIs, "ID_LTCHI", "TEN_LTCHI", selectedId);
        }
        public ActionResult getTieuChi(long? id1, long? id2)
        {
            var TieuChi = db.TIEUCHIs;
            var ChiTietTC = db.CT_TEUCHI;
            var LTC = db.LOAITIEUCHIs;
            
            if (id1 == null && id2 == null)
            {
                var v = db.CT_TEUCHI.ToList();
                return PartialView(v);
            }
            //var m = db.CT_TEUCHI.Where(x => x.ID_TCHI == id1 ).ToList();
            if(id1 != null && id2 ==null)
            {
                var n = from a in TieuChi
                        join b in ChiTietTC on a.ID_TCHI equals b.ID_TCHI
                        join c in LTC on a.ID_LTCHI equals c.ID_LTCHI
                        where a.ID_TCHI == id1
                        select b;
                return PartialView(n.ToList());
            }
            if(id1 == null && id2 != null)
            {
                var o = from a in TieuChi
                        join b in ChiTietTC on a.ID_TCHI equals b.ID_TCHI
                        join c in LTC on a.ID_LTCHI equals c.ID_LTCHI
                        where c.ID_LTCHI == id2
                        select b;
                return PartialView(o.ToList());
            }
            var m = from a in TieuChi
                    join b in ChiTietTC on a.ID_TCHI equals b.ID_TCHI
                    join c in LTC on a.ID_LTCHI equals c.ID_LTCHI 
                    where a.ID_TCHI == id1 && c.ID_LTCHI == id2
                    select b;
            
            return PartialView(m.ToList());
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
