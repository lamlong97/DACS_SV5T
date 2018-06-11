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

            routes.MapRoute("HoatDong", "{type}",
              new { controller = "HoatDong", action = "LoaiTieuChi"},
              new RouteValueDictionary
              {
                    {"type","hoat-dong" }
              },
              namespaces: new[] { "DACS_SV5T.Controllers" });
            routes.MapRoute("HoatDongMeta", "{type}/{meta}",
              new { controller = "HoatDong", action = "LoaiTieuChi", meta = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","hoat-dong" }
              },
              namespaces: new[] { "DACS_SV5T.Controllers" });
            routes.MapRoute("HoatDongId", "{type}/{meta}/{id}",
              new { controller = "HoatDong", action = "LoaiTieuChi", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","hoat-dong" }
              },
              namespaces: new[] { "DACS_SV5T.Controllers" });
            routes.MapRoute("HoatDongQL", "{type}/{meta}/{id}",
              new { controller = "HoatDong", action = "QuanLyMinhChung",id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","hoat-dong" }
              },
              namespaces: new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("DangNhap", "{type}",
                new { controller = "SinhVien", action = "DangNhap" },
                new RouteValueDictionary
                {
                    {"type","dang-nhap" }
                },
                namespaces: new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("DangXuat", "{type}",
                new { controller = "SinhVien", action = "DangXuat" },
                new RouteValueDictionary
                {
                    {"type","dang-xuat" }
                },
                namespaces: new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("ThongTinSV", "{type}",
                new { controller = "SinhVien", action = "ThongTinSV" },
                new RouteValueDictionary
                {
                    {"type","thong-tin-sv" }
                },
                namespaces: new[] { "DACS_SV5T.Controllers" });

            routes.MapRoute("TrangChu", "{type}",
               new { controller = "Default", action = "Index" },
               new RouteValueDictionary
               {
                    {"type","trang-chu" }
               },
               namespaces: new[] { "DACS_SV5T.Controllers" });
            //-------------
            //----------------
            routes.MapRoute("News", "{type}",
            new { controller = "Blog", action = "Index" },
          new RouteValueDictionary
          {
                { "type", "tin-tuc" }
          },
          namespaces: new[] { "DACS_SV5T.Controllers" });
            //---------------
            //-------------
            routes.MapRoute("DetailNews", "{type}/{meta}-{id}",
            new { controller = "Blog", action = "DetailBlog", id = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "chi-tiet-tin-tuc" }
            },
            namespaces: new[] { "DACS_SV5T.Controllers" });
            //-------------
            //----------------
            routes.MapRoute("VB", "{type}",
            new { controller = "VanBan", action = "Index" },
            new RouteValueDictionary
            {
                { "type", "van-ban" }
            },
            namespaces: new[] { "DACS_SV5T.Controllers" });
            //---------------
            //-------------
            routes.MapRoute("DetailVanBan", "{type}/{meta}-{id}",
            new { controller = "VanBan", action = "DetailVanBan", id = UrlParameter.Optional },
            new RouteValueDictionary
            {
                { "type", "chi-tiet-van-ban" }
            },
            namespaces: new[] { "DACS_SV5T.Controllers" });
            //-------------
            //-----------------------
            routes.MapRoute("Contactc", "{type}",
           new { controller = "Contact", action = "Index" },
           new RouteValueDictionary
           {
                { "type", "lien-he" }
           },
            namespaces: new[] { "DACS_SV5T.Controllers" });
            //-------------
            //-----------------------
            routes.MapRoute("AboutUs", "{type}",
          new { controller = "GioiThieu", action = "Index" },
          new RouteValueDictionary
          {
                { "type", "gioi-thieu" }
          },
          namespaces: new[] { "DACS_SV5T.Controllers" });
            //-------------
            //-----------------------
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] {"DACS_SV5T.Controllers"} 
            );
        }
    }
}
