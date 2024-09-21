using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Teach_Award.Data;
using Teach_Award.Entities;

namespace Teach_Award.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly MedXPressContext _db;
        private readonly IConfiguration _cfg;

        public UserController(MedXPressContext context, IConfiguration config)
        {
            _db = context;
            _cfg = config;
        }

        [HttpPost("{id}")]
        public async Task<ActionResult<User>> GetUser(int id)
        {
            var user = await _db.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }

            return user;
        }

        [HttpPost("login")]
        public IActionResult Login(string email, string password)
        {
            var user = AuthenticateUser(email, password);

            if (user != null)
            {
                var token = GenerateJwtToken(user);
                return Ok(new { token });
            }

            return Unauthorized(new { message = "Wrong credentials. Please check your email and password." });
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] User user)
        {
            user.Password = HashPassword(user.Password);  // Hash the password
            _db.Users.Add(user);
            await _db.SaveChangesAsync();
            return Ok();
        }

        [HttpPost("appointments/{id}")]
        public async Task<ActionResult<List<Appointment>>> GetAppointments(int id)
        {
            var appointments = await _db.Users
                .Where(u => u.Id == id)
                .Include(u => u.Appointments)
                .ThenInclude(a => a.TimeFrame)
                .SelectMany(u => u.Appointments)
                .ToListAsync();

            if (appointments == null || !appointments.Any())
            {
                return NotFound();
            }

            return Ok(appointments);
        }

        [HttpPost("upcoming/{id}")]
        public async Task<ActionResult<List<Appointment>>> UpcomingEvents(int id)
        {
            var user = await _db.Users
                .Include(u => u.Appointments) // Include Appointments for the User
                .FirstOrDefaultAsync(u => u.Id == id); // Fetch the User by ID

            if (user == null || user.Appointments == null || !user.Appointments.Any())
            {
                return NotFound();
            }

            // Get upcoming appointments where TimeFrame is not null and DayOfWeek is greater than today
            var upcomingAppointments = user.Appointments
                .Where(a => a.TimeFrame != null && a.TimeFrame.DayOfWeek > DateTime.Now.DayOfWeek)
                .OrderBy(a => a.TimeFrame.DayOfWeek) // Order by DayOfWeek
                .ToList();

            if (!upcomingAppointments.Any())
            {
                return NotFound(); // No upcoming appointments found
            }

            return Ok(upcomingAppointments);
        }



        private User AuthenticateUser(string email, string password)
        {
            var user = _db.Users.SingleOrDefault(x => x.Email == email);
            if (user != null && VerifyPassword(user.Password, password))
            {
                return user;
            }
            return null;
        }

        private string GenerateJwtToken(User user)
        {
            var secretKey = _cfg["Jwt:Key"];  // Fetch secret key from config
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));  // Use UTF8 encoding
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddHours(2),  // Token valid for 2 hours
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }

        private bool VerifyPassword(string hashedPassword, string inputPassword)
        {
            string inputPasswordHash = HashPassword(inputPassword);
            return hashedPassword == inputPasswordHash;
        }

    }
}
