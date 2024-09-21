using Microsoft.EntityFrameworkCore;
using System;
using Teach_Award.Entities;

namespace Teach_Award.Data
{
    public class MedXPressContext : DbContext
    {
        public MedXPressContext(DbContextOptions<MedXPressContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Doctor> Doctors { get; set; }
        public DbSet<Hospital> Hospitals { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<TimeFrame> TimeFrames { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Appointment>()
                .HasOne(a => a.User)
                .WithMany(u => u.Appointments)
                .HasForeignKey(a => a.UserId); // Configure the foreign key

            modelBuilder.Entity<Appointment>()
                .HasOne(a => a.TimeFrame)
                .WithMany(); // If TimeFrame doesn't have a collection of appointments
        }
    }
}
