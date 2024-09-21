using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Teach_Award.Entities
{
    public class Doctor
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Sex { get; set; }
        public double Ranking { get; set; }

        [NotMapped]
        public string FullName => FirstName + " " + MiddleName + " " + LastName;
        public int Age { get; set; }
        public string? WorkPlace { get; set; }
        public string SpecializationArea { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        [NotMapped]
        public virtual List<Payment> PaymentHistory { get; set; }
        [NotMapped]
        public virtual List<TimeFrame> TimeFrames { get; set; }
    }
}

