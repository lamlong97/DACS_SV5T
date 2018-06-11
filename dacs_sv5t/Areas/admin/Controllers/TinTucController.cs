using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Areas.admin.Controllers
{
    public class TinTucController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/TinTuc
        public ActionResult Index()
        {
            return View(db.TINTUCs.ToList());
        }

        // GET: admin/TinTuc/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TINTUC tINTUC = db.TINTUCs.Find(id);
            if (tINTUC == null)
            {
                return HttpNotFound();
            }
            return View(tINTUC);
        }

        // GET: admin/TinTuc/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/TinTuc/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_TT,TITLE,DETAIL,DATEBEGIN,META,ORDER,LINK,HIDE,IMG,MOTA")] TINTUC tINTUC)
        {
            if (ModelState.IsValid)
            {
                db.TINTUCs.Add(tINTUC);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tINTUC);
        }

        // GET: admin/TinTuc/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TINTUC tINTUC = db.TINTUCs.Find(id);
            if (tINTUC == null)
            {
                return HttpNotFound();
            }
            return View(tINTUC);
        }

        // POST: admin/TinTuc/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "ID_TT,TITLE,DETAIL,DATEBEGIN,META,ORDER,LINK,HIDE,IMG,MOTA")] TINTUC tINTUC, HttpPostedFileBase img)
        {
            var path = "";
            var filename = "";
            TINTUC temp = getbyID(tINTUC.ID_TT);
            if (ModelState.IsValid)
            {
                if (img != null)
                {
                    filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss") + img.FileName;
                    path = Path.Combine(Server.MapPath("~/Content/img/upload/tintuc"), filename);
                    img.SaveAs(path);
                    temp.IMG = filename;
                }
                temp.DATEBEGIN = tINTUC.DATEBEGIN;
                temp.DETAIL = tINTUC.DETAIL;
                temp.HIDE = tINTUC.HIDE;
                temp.LINK = tINTUC.LINK;
                temp.META = tINTUC.META;
                temp.MOTA = tINTUC.MOTA;
                temp.ORDER = tINTUC.ORDER;
                temp.TITLE = tINTUC.TITLE;
                db.Entry(temp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tINTUC);
        }
        public TINTUC getbyID(long id)
        {
            return db.TINTUCs.Where(x => x.ID_TT == id).FirstOrDefault();
        }
        // GET: admin/TinTuc/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TINTUC tINTUC = db.TINTUCs.Find(id);
            if (tINTUC == null)
            {
                return HttpNotFound();
            }
            return View(tINTUC);
        }

        // POST: admin/TinTuc/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TINTUC tINTUC = db.TINTUCs.Find(id);
            db.TINTUCs.Remove(tINTUC);
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
