using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Teach_Award.Entities
{
    public class Hospital
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Location { get; set; }
        public string Name { get; set; }
        [NotMapped]
        public virtual List<Payment> PaymentHistory { get; set; }
    }
}
