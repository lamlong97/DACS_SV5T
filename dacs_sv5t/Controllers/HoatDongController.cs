using DACS_SV5T.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
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
        public ActionResult CTTieuChi(int LTC, int IDTC)
        {
            var TieuChi = _db.TIEUCHIs;
            var ChiTietTC = _db.CT_TEUCHI;
            var v = from t in TieuChi
                    join l in ChiTietTC
                    on t.ID_TCHI equals l.ID_TCHI
                    where t.ID_LTCHI == LTC && l.ID_TCHI == IDTC
                    select l;
            return PartialView(v.ToList());
        }
        public ActionResult TieuChi(int LTC)
        {
            var TieuChi = _db.TIEUCHIs;
            var v = from t in TieuChi
                    where t.ID_LTCHI == LTC
                    select t;
            return View(v.ToList());
        }
        public ActionResult Cap()
        {
            var Cap = _db.CAPs;
            var v = from t in Cap
                    where t.TEN_CAP != "Chưa đạt"
                    select t;
            return View(v.ToList());
        }
        public ActionResult DanhGiaTieuChi(int? ID_CTTCHI)
        {
            int ID_SV = Convert.ToInt32(Session["ID_SV"]);
            //var dANHGIAs = _db.DANHGIAs.Include(d => d.CAP).Include(d => d.CT_TEUCHI);
            var DanhGia = _db.DANHGIAs;
            var v = from a in DanhGia
                    where a.ID_CTTCHI == ID_CTTCHI
                    select a;
            /*
            var MinhChung = _db.MINHCHUNGs;
            var DanhGia = _db.DANHGIAs;
            //var TieuChi = _db.CT_TEUCHI;

            var v = from a in MinhChung
                    //join b in TieuChi on a.ID_CTTCHI equals b.ID_CTTCHI
                    join c in DanhGia on a.ID_CTTCHI equals c.ID_CTTCHI
                    where a.ID_SV == ID_SV && c.ID_CTTCHI == ID_CTTCHI
                    select a ;*/

            return View(v.ToList());
        }

        public ActionResult DuyetTC(int? ID_DANHGIA)
        {
            int ID_SV = Convert.ToInt32(Session["ID_SV"]);
            var DTC = _db.DUYET_TC;
            var DANHGIA = _db.DANHGIAs;
            var CAP = _db.CAPs;

            var v = from a in DTC
                    join b in DANHGIA on a.ID_DANHGIA equals b.ID_DANHGIA
                    join c in CAP on b.ID_CAP equals c.ID_CAP
                    where a.ID_SV == ID_SV && b.ID_DANHGIA == ID_DANHGIA
                    select a;
            return View(v.ToList());
        }

        public ActionResult HinhTieuChi(int? ID_CTTCHI)
        {
            var ID_SV = Session["ID_SV"];
            if (ID_SV == null && ID_CTTCHI == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MINHCHUNG mINHCHUNG = _db.MINHCHUNGs.Find(ID_SV, ID_CTTCHI);
            if (mINHCHUNG == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_CTTCHI = new SelectList(_db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", mINHCHUNG.ID_CTTCHI);
            ViewBag.ID_SV = new SelectList(_db.SINHVIENs, "ID_SV", "TEN_SV", mINHCHUNG.ID_SV);
            return View(mINHCHUNG);
        }

        public bool CheckID_SV(int ID_SV)
        {
            return _db.MINHCHUNGs.Count(x => x.ID_SV == ID_SV) > 0;
        }
        public bool CheckID_CTTC(int ID_CTTC)
        {
            return _db.MINHCHUNGs.Count(x => x.ID_CTTCHI == ID_CTTC) > 0;
        }

        public ActionResult QuanLyMinhChung(int? ID_CTTCHI)
        {
            var id = Session["ID_SV"];
            if (id == null && ID_CTTCHI == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SINHVIEN sINHVIEN = _db.SINHVIENs.Find(id);
            if (sINHVIEN == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_CTTCHI = new SelectList(_db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", ID_CTTCHI);
            ViewBag.ID_SV = new SelectList(_db.SINHVIENs, "ID_SV", "TEN_SV", sINHVIEN.ID_SV);
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult QuanLyMinhChung([Bind(Include = "ID_SV,ID_CTTCHI,HINHANH")] MINHCHUNG mINHCHUNG, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";

                //HttpPostedFileBase img = Request.Files["img"];

                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = img.FileName;

                        if (filename != "logo-hutech.png")
                        {
                            filename = img.FileName;
                            path = Path.Combine(Server.MapPath("~/Content/upload/minhchung"), filename);
                            img.SaveAs(path);
                            mINHCHUNG.HINHANH = filename;
                            if (CheckID_SV(mINHCHUNG.ID_SV) && CheckID_CTTC(mINHCHUNG.ID_CTTCHI))
                            {
                                _db.Entry(mINHCHUNG).State = EntityState.Modified;
                                _db.SaveChanges();
                            }
                            else
                            {
                                _db.MINHCHUNGs.Add(mINHCHUNG);
                                _db.SaveChanges();
                            }
                            return RedirectToAction("LoaiTieuChi","HoatDong");
                        }

                        path = Path.Combine(Server.MapPath("~/Content/upload/minhchung"), filename);
                        img.SaveAs(path);
                        mINHCHUNG.HINHANH = filename;
                    }
                    else
                    {
                        mINHCHUNG.HINHANH = "logo-hutech.png";
                    }
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            ViewBag.ID_SV = new SelectList(_db.SINHVIENs, "ID_SV", "TEN_SV", mINHCHUNG.ID_SV);
            ViewBag.ID_CTTCHI = new SelectList(_db.CT_TEUCHI, "ID_CTTCHI", "NOIDUNG", mINHCHUNG.ID_CTTCHI);
            return View(mINHCHUNG);
        }
    }
}