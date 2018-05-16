using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Controllers
{
    public class TempController : Controller
    {
        DACS_SV5TEntities db = new DACS_SV5TEntities();

        public ActionResult getMENU()
        {
            var v = from t in db.MENUs
                    where t.HIDE == 0
                    orderby t.ORDER ascending
                    select t;
            return PartialView(v.ToList());
        }

        public ActionResult getTINTUCHOME()
        {
            var v = (from t in db.TINTUCs
                    where t.HIDE == 0
                    orderby t.ORDER ascending
                    select t).Take(4);
            return PartialView(v.ToList());
        }
    }
}