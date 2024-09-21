using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Teach_Award.Entities
{
    public class TimeFrame
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public Doctor Doctor { get; set; }
        public DayOfWeek DayOfWeek { get; set; }
    }
}
