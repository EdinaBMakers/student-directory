# Modify your program to only print the students whose name begins with a specific letter.
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

def input_first_letter_of_name
  input = ""
  until /^[a-zA-Z]$/.match(input) do
    puts "Please enter the first letter of students name you want to list"
    input = gets.chomp
  end
  input
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

students = input_students
first_letter_of_name = input_first_letter_of_name
filtered_students = students.select { |student| student[:name][0].upcase == first_letter_of_name.upcase }
puts "Students whose name start with '#{first_letter_of_name}':"
print(filtered_students)
