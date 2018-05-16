using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DACS_SV5T.Controllers
{
    public class HoatDongController : Controller
    {
        DACS_SV5TEntities _db = new DACS_SV5TEntities();
        // GET: HoatDong
        public ActionResult LoaiTieuChi()
        {
            var TieuChi = _db.LOAITIEUCHIs;
            var v = from t in TieuChi
                    select t;
            return View(v.ToList());
        }
        public ActionResult TieuChi(int LTC)
        {
            var TieuChi = _db.TIEUCHIs;
            var v = from t in TieuChi
                    where t.ID_LTCHI == LTC
                    select t;
            return PartialView(v.ToList());
        }
    }
}