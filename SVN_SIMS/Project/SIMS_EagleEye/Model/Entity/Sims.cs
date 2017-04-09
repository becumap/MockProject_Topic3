namespace Model.Entity
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Sims : DbContext
    {
        public Sims()
            : base("name=Sims")
        {
        }

        public virtual DbSet<Account> Account { get; set; }
        public virtual DbSet<Bill> Bill { get; set; }
        public virtual DbSet<BillDetail> BillDetail { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Item> Item { get; set; }
        public virtual DbSet<ReportExeception> ReportExeception { get; set; }
        public virtual DbSet<ReturnItem> ReturnItem { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .Property(e => e.UseName)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Bill)
                .WithOptional(e => e.Account)
                .HasForeignKey(e => e.CreateBy);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.ReportExeception)
                .WithOptional(e => e.Account)
                .HasForeignKey(e => e.CreateBy);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.ReturnItem)
                .WithMany(e => e.Account)
                .Map(m => m.ToTable("ReturnItemDetail").MapLeftKey("CreateBy").MapRightKey("ReturnItemID"));

            modelBuilder.Entity<Bill>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Bill>()
                .Property(e => e.CreateBy)
                .IsUnicode(false);

            modelBuilder.Entity<Bill>()
                .HasMany(e => e.BillDetail)
                .WithRequired(e => e.Bill)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BillDetail>()
                .Property(e => e.ItemID)
                .IsFixedLength();

            modelBuilder.Entity<BillDetail>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Item>()
                .Property(e => e.ItemID)
                .IsFixedLength();

            modelBuilder.Entity<Item>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Item>()
                .Property(e => e.CreateBy)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.BillDetail)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ReportExeception>()
                .Property(e => e.CreateBy)
                .IsUnicode(false);

            modelBuilder.Entity<ReturnItem>()
                .Property(e => e.ReturnItem1)
                .IsFixedLength();
        }
    }
}
