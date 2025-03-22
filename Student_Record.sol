// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

/**
* Feature:
* Add Student Details (name, age, matric no, grades)
* Remove Student Details by name;
* Update Student Grades;
* Retrieve Student Details;
* Get total number of Students 
*/

contract StudentRecord {
    struct Student{
        string name;
        uint8 age;
        string matricNo;
        Grade [] grades;
    }

    struct Grade{
        int grade;
        string subject;
    }

    mapping (string => Student) public student;

    uint8 public totalNumberOfStudent;

    function AddStudent(string memory _name, uint8 _age, string memory _matricNo) external {
        Student storage newStudent = student[_name];
        newStudent.name = _name;
        newStudent.age = _age;
        newStudent.matricNo = _matricNo;

        totalNumberOfStudent += 1; 
    }
    function RemoveStudent(string memory name) external {
        delete student[name];
        totalNumberOfStudent -= 1;
    }

    function UpdateStudentGrades(string memory _name, int _grade, string memory _subject) external {
        Grade memory newGrade = Grade(_grade, _subject);
        Student storage studentRecord = student[_name];
        studentRecord.grades.push(newGrade);   
    }

    function viewStudentGrades(string memory _name) external view returns (Grade[] memory)  {
        return student[_name].grades;

    }

    function getTotalNumberOfStudent() external view returns(uint256){
        return totalNumberOfStudent;
    }


}