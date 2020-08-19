require "byebug"

class Employee

    attr_reader :name, :title, :boss
    attr_accessor :salary

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus_pay = self.salary * multiplier
    end
end

class Manager < Employee 

    attr_accessor :employees, :salary

    def initialize(name, title, salary, boss=nil)
        super(name,title,salary,boss)
        @employees = []
    end

    def add_employee(employee)
        @employees << employee
    end

    def salary_getter
        
        # all_employees = @employees
        # puts self
        #  total_salary_of_employee = 0

        # until all_employees.empty?
        #     all_employees.each do |employee|
        #         puts employee 
        #         puts '------'
        #         all_employees.shift
        #     end
        # end
        # total_salary_of_employee
        # #(total_salary_of_employee / @employees.length) * multiplier


        return @employees.first.salary if @employees.length == 0
        
        @employees.each do |employee|
            recursive_step = employee.salary_getter
                if recursive_step
                    total_salary_of_employee += recursive_step
                end
        end


    end


end

# we average * multiplier ---> full salary of all employees / number of employees ----> amount * multiply 
head_boss1 = Manager.new('Ned', :Founder, 1000000)
boss2 = Manager.new('Darren', :TA_Manager, 78000, head_boss1)
emp3 = Employee.new('David', :TA, 12000, boss2)
emp4 = Employee.new('Shawna', :TA, 12000, boss2)
head_boss1.add_employee(boss2)
boss2.add_employee(emp3)
boss2.add_employee(emp4)

p head_boss1.employees



# 


# boss1.employees << boss2
# boss2.employees << emp3
# boss2.employees << emp4

# p boss1.employees   
# p boss2.employees




#<Manager:0x00007fb4e7048460 @name="Darren", @title=:TA_Manager, @salary=78000, @boss=#<Manager:0x00007fb4e70484d8 @name="Ned", @title=:Founder, @salary=1000000, @boss=nil, @employees=[#<Manager:0x00007fb4e7048460 ...>]>, @employees=[#<Employee:0x00007fb4e70483e8 @name="David", @title=:TA, @salary=12000, @boss=#<Manager:0x00007fb4e7048460 ...>>, #<Employee:0x00007fb4e7048398 @name="Shawna", @title=:TA, @salary=12000, @boss=#<Manager:0x00007fb4e7048460 ...>>]>
# (byebug) 