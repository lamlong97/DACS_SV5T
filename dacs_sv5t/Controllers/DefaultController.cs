using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;


namespace DACS_SV5T.Controllers
{
    public class DefaultController : Controller
    {
        DACS_SV5TEntities _db = new DACS_SV5TEntities();
        // GET: Default
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult getSlider()
        {
            var v = from t in _db.Sliders
                    where t.HIDE == false
                    orderby t.ORDER ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}