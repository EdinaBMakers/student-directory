# Rewrite the each() method that prints all students using while or until control flow methods (Loops).
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  current_index = 0
  max_index = students.size - 1

  while current_index <= max_index
    student = students[current_index]
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    current_index += 1
  end

  # until current_index > max_index
  #   student = students[current_index]
  #   puts "#{student[:name]} (#{student[:cohort]} cohort)"
  #   current_index += 1
  # end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
