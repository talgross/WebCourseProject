//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebProject
{
    using System;
    using System.Collections.Generic;
    
    public partial class lecturer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public lecturer()
        {
            this.courses = new HashSet<courses>();
        }
    
        public int lecturerID { get; set; }
        public string lecturerFirstName { get; set; }
        public string lecturerLastName { get; set; }
        public string userName { get; set; }
        public string password { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<courses> courses { get; set; }
    }
}
