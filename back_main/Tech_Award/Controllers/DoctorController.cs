using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Teach_Award.Data;
using Teach_Award.Entities;

namespace Teach_Award.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctorController : ControllerBase
    {
        private readonly MedXPressContext _db;

        public DoctorController(MedXPressContext context)
        {
            _db = context;
        }

        // GET: api/doctor
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Doctor>>> GetDoctors()
        {
            var doctors = await _db.Doctors
                .OrderBy(d => d.Ranking) 
                .ToListAsync();          

            return Ok(doctors); 
        }

        [HttpPost("Search")]
        public async Task<ActionResult<IEnumerable<Doctor>>> Search(string text)
        {
            var doctors = await _db.Doctors
                .Where(d => d.FirstName.Contains(text)
                          || d.LastName.Contains(text)
                          || d.MiddleName.Contains(text)
                          || d.SpecializationArea.Contains(text)
                          || d.WorkPlace.Contains(text))
                .ToListAsync();

            return Ok(doctors);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Doctor>> GetDoctor(int id)
        {
            var doctor = await _db.Doctors
                .Include(d => d.TimeFrames) // Eagerly load TimeFrames
                .FirstOrDefaultAsync(d => d.Id == id); // Use FirstOrDefaultAsync instead

            if (doctor == null)
            {
                return NotFound();
            }

            return doctor;
        }

        // POST: api/doctor
        [HttpPost]
        public async Task<ActionResult<Doctor>> PostDoctor(Doctor doctor)
        {
            _db.Doctors.Add(doctor);
            await _db.SaveChangesAsync();

            return CreatedAtAction(nameof(GetDoctor), new { id = doctor.Id }, doctor);
        }

        // DELETE: api/doctor/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDoctor(int id)
        {
            var doctor = await _db.Doctors.FindAsync(id);
            if (doctor == null)
            {
                return NotFound();
            }

            _db.Doctors.Remove(doctor);
            await _db.SaveChangesAsync();

            return NoContent();
        }

        private bool DoctorExists(int id)
        {
            return _db.Doctors.Any(e => e.Id == id);
        }
    }

    
}

