namespace Model.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BillDetail")]
    public partial class BillDetail
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int BillID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(7)]
        public string ItemID { get; set; }

        public int? Quantity { get; set; }

        public decimal? Price { get; set; }

        public virtual Bill Bill { get; set; }

        public virtual Item Item { get; set; }
    }
}
