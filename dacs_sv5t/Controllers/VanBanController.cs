using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Controllers
{
    public class VanBanController : Controller
    {
        DACS_SV5TEntities db = new DACS_SV5TEntities();
        // GET: VanBan
        public ActionResult Index()
        {
            var v = from t in db.VANBANs
                    select t;
            return View(v.ToList());
        }

        public ActionResult DetailVanBan(long id)
        {
            var v = from t in db.VANBANs
                    where t.ID_VB == id
                    select t;
            return View(v.FirstOrDefault());
        }
    }
}