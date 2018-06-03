using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DACS_SV5T.Areas.admin.Controllers
{
    public class DefaultController : Controller
    {
        DACS_SV5TEntities _db = new DACS_SV5TEntities();
        // GET: admin/Default
        public ActionResult Index()
        {
            List<int> SV_KV = new List<int>();
            List<int> SV_CAP = new List<int>();

            //Biểu đồ sinh viên theo khoa/viện
            var Tenkv = _db.KHOAVIENs.Select(x => x.TEN_KV).Distinct();
            var ID_kv = _db.KHOAVIENs.Select(x => x.ID_KV).Distinct();
            var Total_SV_KV = _db.SINHVIENs.Count();
            foreach(var item in ID_kv)
            {
                SV_KV.Add(_db.SINHVIENs.Count(x => x.ID_KV == item));
            }
            var CountSV = SV_KV;

            ViewBag.KhoaVien = Tenkv;
            ViewBag.SinhVien_KV = CountSV.ToList();

            //Biểu đồ sinh viên theo cấp
            var TEN_CAP = _db.CAPs.Select(x => x.TEN_CAP);
            var ID_CAP = _db.CAPs.Select(x => x.ID_CAP).Distinct();
            foreach(var item in ID_CAP)
            {
                SV_CAP.Add(_db.SINHVIENs.Count(x => x.ID_CAP == item));
            }
            var CountSV_Cap = SV_CAP;

            ViewBag.Cap = TEN_CAP;
            ViewBag.SinhVien_Cap = CountSV_Cap.ToList();
            
            ViewBag.TongSV = Total_SV_KV;
            return View();
        }
    }
}