namespace Model.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ReportExeception")]
    public partial class ReportExeception
    {
        public int ID { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(15)]
        public string CreateBy { get; set; }

        public virtual Account Account { get; set; }
    }
}
