using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace DACS_SV5T
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Session_Start()
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

            Session["ID_ND"] = null;
            Session["TENDN"] = null;
            Session["MK"] = null;
            Session["TENND"] = null;
            Session["PQ"] = null;
        }
    }
}
