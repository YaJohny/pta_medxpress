using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Teach_Award.Migrations
{
    /// <inheritdoc />
    public partial class addtimeframe : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Appointment_TimeFrame_TimeFrameId",
                table: "Appointment");

            migrationBuilder.DropForeignKey(
                name: "FK_TimeFrame_Doctors_DoctorId",
                table: "TimeFrame");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TimeFrame",
                table: "TimeFrame");

            migrationBuilder.RenameTable(
                name: "TimeFrame",
                newName: "TimeFrames");

            migrationBuilder.RenameIndex(
                name: "IX_TimeFrame_DoctorId",
                table: "TimeFrames",
                newName: "IX_TimeFrames_DoctorId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TimeFrames",
                table: "TimeFrames",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Appointment_TimeFrames_TimeFrameId",
                table: "Appointment",
                column: "TimeFrameId",
                principalTable: "TimeFrames",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TimeFrames_Doctors_DoctorId",
                table: "TimeFrames",
                column: "DoctorId",
                principalTable: "Doctors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Appointment_TimeFrames_TimeFrameId",
                table: "Appointment");

            migrationBuilder.DropForeignKey(
                name: "FK_TimeFrames_Doctors_DoctorId",
                table: "TimeFrames");

            migrationBuilder.DropPrimaryKey(
                name: "PK_TimeFrames",
                table: "TimeFrames");

            migrationBuilder.RenameTable(
                name: "TimeFrames",
                newName: "TimeFrame");

            migrationBuilder.RenameIndex(
                name: "IX_TimeFrames_DoctorId",
                table: "TimeFrame",
                newName: "IX_TimeFrame_DoctorId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_TimeFrame",
                table: "TimeFrame",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Appointment_TimeFrame_TimeFrameId",
                table: "Appointment",
                column: "TimeFrameId",
                principalTable: "TimeFrame",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_TimeFrame_Doctors_DoctorId",
                table: "TimeFrame",
                column: "DoctorId",
                principalTable: "Doctors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
