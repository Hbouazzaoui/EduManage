package com.example.edumanage.Model;

public class StudentCourse {
    private int studentId;
    private int courseId;

    // Constructor بدون معاملات
    public StudentCourse() {
    }

    // Constructor مع معاملات
    public StudentCourse(int studentId, int courseId) {
        this.studentId = studentId;
        this.courseId = courseId;
    }

    // Getters و Setters
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    // toString() لعرض معلومات الكائن
    @Override
    public String toString() {
        return "StudentCourse{" +
                "studentId=" + studentId +
                ", courseId=" + courseId +
                '}';
    }
}