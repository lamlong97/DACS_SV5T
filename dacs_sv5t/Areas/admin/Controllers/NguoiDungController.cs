using DACS_SV5T.Help;
using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DACS_SV5T.Areas.admin.Controllers
{
    public class NguoiDungController : Controller
    {
        DACS_SV5TEntities db = new DACS_SV5TEntities();
        // GET: admin/NguoiDung
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(string username, string password)
        {
            string passwordMD5 = Common.EncryptMD5(username + password);
            var user = db.NGUOIDUNGs.SingleOrDefault(x => x.TENDN == username && x.MK == passwordMD5);
            if (user != null)
            {
                Session["ID_ND"] = user.ID_ND;
                Session["TENDN"] = user.TENDN;
                Session["MK"] = user.MK;
                Session["TENND"] = user.TENND;
                Session["PQ"] = user.PQ;
                return RedirectToAction("Index", "Default");
            }
            ViewBag.error = "Đăng nhập thất bại";
            return View();
        }

        public ActionResult DangXuat()
        {
            Session["ID_ND"] = null;
            Session["TENDN"] = null;
            Session["MK"] = null;
            Session["TENND"] = null;
            Session["PQ"] = null;
            return RedirectToAction("Index", "Default");
        }

        public ActionResult ThongTinNguoiDung()
        {
            var id = Session["ID_ND"];
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NGUOIDUNG nGUOIDUNG = db.NGUOIDUNGs.Find(id);
            if (nGUOIDUNG == null)
            {
                return HttpNotFound();
            }
            return View(nGUOIDUNG);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThongTinNguoiDung([Bind(Include = "ID_ND,TENDN,MK,TENND,PQ")] NGUOIDUNG nGUOIDUNG)
        {
            var MK = Session["MK"];
            if (ModelState.IsValid)
            {
                nGUOIDUNG.MK = (string)MK;
                db.Entry(nGUOIDUNG).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.success = "Cập nhật thông tin thành công";
                Session["TENND"] = nGUOIDUNG.TENND;
            }
            return View(nGUOIDUNG);
        }

        public ActionResult Index()
        {
            return View(db.NGUOIDUNGs.ToList());
        }

        public bool CheckUserName(string TENDN)
        {
            return db.NGUOIDUNGs.Count(x => x.TENDN == TENDN) > 0;
        }

        // GET: admin/NGUOIDUNGs/Create
        public ActionResult DangKy()
        {
            return View();
        }

        // POST: admin/NGUOIDUNGs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangKy([Bind(Include = "ID_ND,TENDN,MK,XNMK,TENND,PQ")] NGUOIDUNG nGUOIDUNG)
        {
            if (ModelState.IsValid)
            {
                if(CheckUserName(nGUOIDUNG.TENDN))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else {
                string passwordMD5 = Common.EncryptMD5(nGUOIDUNG.TENDN + nGUOIDUNG.MK);
                nGUOIDUNG.MK = passwordMD5;
                db.NGUOIDUNGs.Add(nGUOIDUNG);
                db.SaveChanges();
                ViewBag.success = "Đăng ký thành công";
                }
            }

            return View(nGUOIDUNG);
        }

        // GET: admin/NGUOIDUNGs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NGUOIDUNG nGUOIDUNG = db.NGUOIDUNGs.Find(id);
            if (nGUOIDUNG == null)
            {
                return HttpNotFound();
            }
            return View(nGUOIDUNG);
        }

        // POST: admin/NGUOIDUNGs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_ND,TENDN,MK,TENND,PQ")] NGUOIDUNG nGUOIDUNG)
        { 
            if (ModelState.IsValid)
            {
                db.Entry(nGUOIDUNG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nGUOIDUNG);
        }

        // GET: admin/NGUOIDUNGs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NGUOIDUNG nGUOIDUNG = db.NGUOIDUNGs.Find(id);
            if (nGUOIDUNG == null)
            {
                return HttpNotFound();
            }
            return View(nGUOIDUNG);
        }

        // POST: admin/NGUOIDUNGs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NGUOIDUNG nGUOIDUNG = db.NGUOIDUNGs.Find(id);
            db.NGUOIDUNGs.Remove(nGUOIDUNG);
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