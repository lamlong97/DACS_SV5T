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
    
    public partial class CT_TEUCHI
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CT_TEUCHI()
        {
            this.DANHGIAs = new HashSet<DANHGIA>();
            this.MINHCHUNGs = new HashSet<MINHCHUNG>();
        }
    
        public int ID_CTTCHI { get; set; }
        public int ID_TCHI { get; set; }
        public string NOIDUNG { get; set; }
    
        public virtual TIEUCHI TIEUCHI { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DANHGIA> DANHGIAs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MINHCHUNG> MINHCHUNGs { get; set; }
    }
}