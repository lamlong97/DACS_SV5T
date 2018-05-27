using DACS_SV5T.Help;
using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DACS_SV5T.Areas.admin.Controllers
{
    public class NguoiDungController : Controller
    {
        DACS_SV5TEntities _db = new DACS_SV5TEntities();
        // GET: admin/NguoiDung
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(string username, string password)
        {
            string passwordMD5 = Common.EncryptMD5(username + password);
            var user = _db.NGUOIDUNGs.SingleOrDefault(x => x.TENDN == username && x.MK == passwordMD5);
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
    }
}