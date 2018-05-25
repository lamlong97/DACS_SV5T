using DACS_SV5T.Help;
using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DACS_SV5T.Controllers
{
    public class SinhVienController : Controller
    {
        DACS_SV5TEntities _db = new DACS_SV5TEntities();
        // GET: SinhVien
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(long mssv, string password)
        {
            string passwordMD5 = Common.EncryptMD5(mssv + password);
            var user = _db.SINHVIENs.SingleOrDefault(x => x.MSSV == mssv && x.PASSWORD == passwordMD5);
            if (user != null)
            {
                Session["ID_SV"] = user.ID_SV;
                Session["TEN_SV"] = user.TEN_SV;
                Session["MSSV"] = user.MSSV;
                Session["LOP"] = user.LOP;
                Session["DIACHI"] = user.DIACHI;
                Session["EMAIL"] = user.EMAIL;
                Session["SDT"] = user.SDT;
                Session["ID_KV"] = user.ID_KV;
                Session["PASSWORD"] = user.PASSWORD;
                return RedirectToAction("Index", "Default");
            }
            ViewBag.error = "Đăng nhập thất bại";
            return View();
        }

        public ActionResult DangXuat()
        {
            Session["ID_SV"] = null;
            Session["TEN_SV"] = null;
            Session["MSSV"] = null;
            Session["LOP"] = null;
            Session["DIACHI"] = null;
            Session["EMAIL"] = null;
            Session["SDT"] = null;
            Session["ID_KV"] = null;
            Session["PASSWORD"] = null;
            return RedirectToAction("Index", "Default");
        }

        public ActionResult ThongTinSV()
        {
            var id = Session["ID_SV"];
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SINHVIEN sINHVIEN = _db.SINHVIENs.Find(id);
            if (sINHVIEN == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_KV = new SelectList(_db.KHOAVIENs, "ID_KV", "TEN_KV", sINHVIEN.ID_KV);
            ViewBag.ID_CAP = new SelectList(_db.CAPs, "ID_CAP", "TEN_CAP", sINHVIEN.ID_CAP);
            return View(sINHVIEN);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThongTinSV([Bind(Include = "ID_SV,TEN_SV,LOP,DIACHI,EMAIL,SDT,ID_KV,PASSWORD,MSSV,ID_CAP")] SINHVIEN sINHVIEN)
        {
            var password = Session["PASSWORD"];
            if (ModelState.IsValid)
            {
                sINHVIEN.PASSWORD = (string)password;
                _db.Entry(sINHVIEN).State = EntityState.Modified;
                _db.SaveChanges();
                ViewBag.success = "Cập nhật thông tin thành công";
            }
            ViewBag.ID_KV = new SelectList(_db.KHOAVIENs, "ID_KV", "TEN_KV", sINHVIEN.ID_KV);
            ViewBag.ID_CAP = new SelectList(_db.CAPs, "ID_CAP", "TEN_CAP", sINHVIEN.ID_CAP);
            return View(sINHVIEN);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}