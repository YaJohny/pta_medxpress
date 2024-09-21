using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Teach_Award.Entities
{
    public class User
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Sex { get; set; } 

        [NotMapped]
        public string FullName => FirstName + " " + MiddleName + " " + LastName;
        public int Age { get; set; }
        public DateTime DateTime { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public double Balance { get; set; }

        [NotMapped]
        public virtual List<Payment> PaymentHistory { get; set; }
        [NotMapped]
        public virtual List<Appointment> Appointments { get; set; }
    }
}
