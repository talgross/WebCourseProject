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
    
    public partial class grade
    {
        public int index { get; set; }
        public Nullable<int> studentID { get; set; }
        public Nullable<int> assignmentID { get; set; }
        public Nullable<int> grade1 { get; set; }
        public byte[] submittedAssignment { get; set; }
    
        public virtual assignment assignment { get; set; }
        public virtual student student { get; set; }
    }
}
