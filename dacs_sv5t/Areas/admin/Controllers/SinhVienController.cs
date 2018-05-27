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
    public class SinhVienController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/SinhVien
        public ActionResult Index(long? KhoaVien = null, long? Cap = null)
        {
            //var sINHVIENs = db.SINHVIENs.Include(s => s.KHOAVIEN).Include(s => s.CAP);
            getKhoa(KhoaVien);
            getCap(Cap);
            return View();
        }

        public void getKhoa(long? selectedId = null)
        {
            ViewBag.KhoaVien = new SelectList(db.KHOAVIENs, "ID_KV", "TEN_KV", selectedId);
        }
        public void getCap(long? selectedId = null)
        {
            ViewBag.Cap = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", selectedId);
        }
        public ActionResult getSinhVien(long? id1, long? id2)
        {
            var SinhVien = db.SINHVIENs;
            var Khoa = db.KHOAVIENs;
            var Cap = db.CAPs;
            if (id1 == null && id2 ==null)
            {
                var v = db.SINHVIENs.ToList();
                return PartialView(v);
            }
            if (id1 != null && id2 == null)
            {
                var n = from a in SinhVien
                        join b in Khoa on a.ID_KV equals b.ID_KV
                        join c in Cap on a.ID_CAP equals c.ID_CAP
                        where b.ID_KV == id1
                        select a;
                return PartialView(n.ToList());
            }
            if (id1 == null && id2 != null)
            {
                var o = from a in SinhVien
                        join b in Khoa on a.ID_KV equals b.ID_KV
                        join c in Cap on a.ID_CAP equals c.ID_CAP
                        where c.ID_CAP == id2
                        select a;
                return PartialView(o.ToList());
            }
            var m = from a in SinhVien
                    join b in Khoa on a.ID_KV equals b.ID_KV
                    join c in Cap on a.ID_CAP equals c.ID_CAP
                    where b.ID_KV == id1 && c.ID_CAP == id2
                    select a;
            return PartialView(m);
        }
        // GET: admin/SinhVien/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SINHVIEN sINHVIEN = db.SINHVIENs.Find(id);
            if (sINHVIEN == null)
            {
                return HttpNotFound();
            }
            return View(sINHVIEN);
        }

        // GET: admin/SinhVien/Create
        public ActionResult Create()
        {
            ViewBag.ID_KV = new SelectList(db.KHOAVIENs, "ID_KV", "TEN_KV");
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP");
            return View();
        }

        // POST: admin/SinhVien/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_SV,TEN_SV,LOP,DIACHI,EMAIL,SDT,ID_KV,PASSWORD,MSSV,ID_CAP")] SINHVIEN sINHVIEN)
        {
            if (ModelState.IsValid)
            {
                db.SINHVIENs.Add(sINHVIEN);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ID_KV = new SelectList(db.KHOAVIENs, "ID_KV", "TEN_KV", sINHVIEN.ID_KV);
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", sINHVIEN.ID_CAP);
            return View(sINHVIEN);
        }

        // GET: admin/SinhVien/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SINHVIEN sINHVIEN = db.SINHVIENs.Find(id);
            if (sINHVIEN == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_KV = new SelectList(db.KHOAVIENs, "ID_KV", "TEN_KV", sINHVIEN.ID_KV);
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", sINHVIEN.ID_CAP);
            return View(sINHVIEN);
        }

        // POST: admin/SinhVien/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_SV,TEN_SV,LOP,DIACHI,EMAIL,SDT,ID_KV,PASSWORD,MSSV,ID_CAP")] SINHVIEN sINHVIEN)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sINHVIEN).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_KV = new SelectList(db.KHOAVIENs, "ID_KV", "TEN_KV", sINHVIEN.ID_KV);
            ViewBag.ID_CAP = new SelectList(db.CAPs, "ID_CAP", "TEN_CAP", sINHVIEN.ID_CAP);
            return View(sINHVIEN);
        }

        // GET: admin/SinhVien/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SINHVIEN sINHVIEN = db.SINHVIENs.Find(id);
            if (sINHVIEN == null)
            {
                return HttpNotFound();
            }
            return View(sINHVIEN);
        }

        // POST: admin/SinhVien/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SINHVIEN sINHVIEN = db.SINHVIENs.Find(id);
            db.SINHVIENs.Remove(sINHVIEN);
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
