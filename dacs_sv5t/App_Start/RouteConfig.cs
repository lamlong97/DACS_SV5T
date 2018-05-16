using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DACS_SV5T
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute("DangNhap", "{type}",
                new { controller = "SinhVien", action = "DangNhap" },
                new RouteValueDictionary
                {
                    {"type","dang-nhap" }
                },
                new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("DangXuat", "{type}",
                new { controller = "SinhVien", action = "DangXuat" },
                new RouteValueDictionary
                {
                    {"type","dang-xuat" }
                },
                new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("ThongTinSV", "{type}",
                new { controller = "SinhVien", action = "ThongTinSV" },
                new RouteValueDictionary
                {
                    {"type","thong-tin-sv" }
                },
                new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("TrangChu", "{type}",
               new { controller = "Default", action = "Index" },
               new RouteValueDictionary
               {
                    {"type","trang-chu" }
               },
               new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
