using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Controllers
{
    public class SkinController : Controller
    {
        DACS_SV5TEntities   db = new DACS_SV5TEntities();
        // GET: Skin
        public ActionResult getGioiThieu()
        {
            var v = from t in db.GIOITHIEUx
                    select t;
            return PartialView(v.ToList());
        }
    }
}