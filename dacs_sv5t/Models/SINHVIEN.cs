//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class SINHVIEN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SINHVIEN()
        {
            this.MINHCHUNGs = new HashSet<MINHCHUNG>();
        }
    
        public int ID_SV { get; set; }
        public string TEN_SV { get; set; }
        public string LOP { get; set; }
        public string DIACHI { get; set; }
        public string EMAIL { get; set; }
        public string SDT { get; set; }
        public int ID_KV { get; set; }
        public string PASSWORD { get; set; }
        public Nullable<int> MSSV { get; set; }
        public Nullable<int> ID_CAP { get; set; }
    
        public virtual KHOAVIEN KHOAVIEN { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MINHCHUNG> MINHCHUNGs { get; set; }
        public virtual CAP CAP { get; set; }
    }
}
