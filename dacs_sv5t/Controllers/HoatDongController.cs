﻿using DACS_SV5T.Models;
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
                            return RedirectToAction("LoaiTieuChi");
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