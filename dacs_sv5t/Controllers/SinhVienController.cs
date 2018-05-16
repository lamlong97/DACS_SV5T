using DACS_SV5T.Helps;
using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Linq;
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
    }
}