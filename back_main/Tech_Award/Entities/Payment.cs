using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Teach_Award.Entities
{
    public class Payment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int TransactionId { get; set; }
        public int SenderId { get; set; }
        public int ReceiverId { get; set; }
        public double Amount { get; set; }
        public DateTime Date {  get; set; }
    }
}
