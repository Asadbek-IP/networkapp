class Employee {
    int? id;
    String? employeename;
    int? employeesalary;
    int? employeeage;
    String? profileimage;


    Employee.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        employeename = json['employee_name'];
        employeesalary = json['employee_salary'];
        employeeage = json['employee_age'];
        profileimage = json['profile_image'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['employee_name'] = employeename;
        data['employee_salary'] = employeesalary;
        data['employee_age'] = employeeage;
        data['profile_image'] = profileimage;
        return data;
    }
}