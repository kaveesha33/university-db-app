package com.example.university_db.dto;
import com.example.university_db.model.Enrollment;
public record EnrollmentDto(String studentCode, String studentName,
 String courseCode, String courseTitle, String grade) {
 public static EnrollmentDto from(Enrollment e) {
 return new EnrollmentDto(e.getStudent().getStudentCode(), e.getStudent().getFullName(),
 e.getCourse().getCode(), e.getCourse().getTitle(), e.getGrade());
 }
}
