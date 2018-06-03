using System.Web.Mvc;
using System.Web.Routing;

namespace DACS_SV5T.Areas.admin
{
    public class adminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute("DangNhapAdmin", "{type}",
                new { controller = "NguoiDung", action = "DangNhap" },
                new RouteValueDictionary
                {
                    {"type","dang-nhap-admin" }
                },
                namespaces: new[] { "DACS_SV5T.Controllers" });

            context.MapRoute(
                "admin_default",
                "admin/{controller}/{action}/{id}",
                new { controller="Default", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}