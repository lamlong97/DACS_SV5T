﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DACS_SV5T.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DACS_SV5TEntities : DbContext
    {
        public DACS_SV5TEntities()
            : base("name=DACS_SV5TEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CAP> CAPs { get; set; }
        public virtual DbSet<CT_TEUCHI> CT_TEUCHI { get; set; }
        public virtual DbSet<DANHGIA> DANHGIAs { get; set; }
        public virtual DbSet<KHOAVIEN> KHOAVIENs { get; set; }
        public virtual DbSet<LOAITIEUCHI> LOAITIEUCHIs { get; set; }
        public virtual DbSet<MENU> MENUs { get; set; }
        public virtual DbSet<MINHCHUNG> MINHCHUNGs { get; set; }
        public virtual DbSet<NGUOIDUNG> NGUOIDUNGs { get; set; }
        public virtual DbSet<SINHVIEN> SINHVIENs { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<TIEUCHI> TIEUCHIs { get; set; }
        public virtual DbSet<TINTUC> TINTUCs { get; set; }
        public virtual DbSet<DUYET_TC> DUYET_TC { get; set; }
    }
}
