using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACS_SV5T.Models;

namespace DACS_SV5T.Controllers
{
    public class BlogController : Controller
    {
        DACS_SV5TEntities db = new DACS_SV5TEntities();

        // GET: Blog
        public ActionResult Index()
        {
            var v = from t in db.TINTUCs
                    select t;
            return View(v.ToList());
        }

        public ActionResult DetailBlog(long id)
        {
            var v = from t in db.TINTUCs
                    where t.ID_TT == id
                    select t;
            return View(v.FirstOrDefault());
        }
    }
}