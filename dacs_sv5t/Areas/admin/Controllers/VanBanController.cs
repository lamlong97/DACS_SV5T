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
    public class VanBanController : Controller
    {
        private DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: admin/VanBan
        public ActionResult Index()
        {
            return View(db.VANBANs.ToList());
        }

        // GET: admin/VanBan/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VANBAN vANBAN = db.VANBANs.Find(id);
            if (vANBAN == null)
            {
                return HttpNotFound();
            }
            return View(vANBAN);
        }

        // GET: admin/VanBan/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: admin/VanBan/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TITLE,DETAIL,DATEBEGIN,META,ORDER,LINK,HIDE,ID_VB,IMG,MOTA")] VANBAN vANBAN)
        {
            if (ModelState.IsValid)
            {
                db.VANBANs.Add(vANBAN);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vANBAN);
        }

        // GET: admin/VanBan/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VANBAN vANBAN = db.VANBANs.Find(id);
            if (vANBAN == null)
            {
                return HttpNotFound();
            }
            return View(vANBAN);
        }

        // POST: admin/VanBan/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "TITLE,DETAIL,DATEBEGIN,META,ORDER,LINK,HIDE,ID_VB,IMG,MOTA")] VANBAN vANBAN,HttpPostedFileBase img)
        {
            var path = "";
            var filename = "";
            VANBAN temp = getbyID(vANBAN.ID_VB);
            if (ModelState.IsValid)
            {
               if(img != null)
                {
                    filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss") + img.FileName;
                    path = Path.Combine(Server.MapPath("~/Content/img/upload/vanban"), filename);
                    img.SaveAs(path);
                    temp.IMG = filename;
                }
                temp.DATEBEGIN = vANBAN.DATEBEGIN;
                temp.DETAIL = vANBAN.DETAIL;
                temp.HIDE = vANBAN.HIDE;
                temp.LINK = vANBAN.LINK;
                temp.META = vANBAN.META;
                temp.MOTA = vANBAN.MOTA;
                temp.ORDER = vANBAN.ORDER;
                temp.TITLE = vANBAN.TITLE;
                db.Entry(temp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vANBAN);
        }
        public VANBAN getbyID(long id)
        {
            return db.VANBANs.Where(x => x.ID_VB == id).FirstOrDefault();
        }
        // GET: admin/VanBan/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VANBAN vANBAN = db.VANBANs.Find(id);
            if (vANBAN == null)
            {
                return HttpNotFound();
            }
            return View(vANBAN);
        }

        // POST: admin/VanBan/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            VANBAN vANBAN = db.VANBANs.Find(id);
            db.VANBANs.Remove(vANBAN);
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
