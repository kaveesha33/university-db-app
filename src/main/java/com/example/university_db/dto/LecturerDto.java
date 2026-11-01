package com.example.university_db.dto;
import com.example.university_db.model.Lecturer;
public record LecturerDto(String name, String email, String department) {
 public static LecturerDto from(Lecturer l) {
 return new LecturerDto(l.getName(), l.getEmail(), l.getDepartment().getName());
 }
}