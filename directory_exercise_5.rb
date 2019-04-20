# Our code only works with the student name and cohort.
# Add more information: hobbies, country of birth, height, etc.

def input_students
  # create an empty array
  students = []
  # get the first name
  should_continue = true
  # while should_continue == true, repeat this code
  while should_continue do
    # get student's information
    puts "Please enter the student's name"
    name = gets.chomp
    puts "Please enter the student's cohort"
    cohort = gets.chomp
    puts "Please enter the student's country of birth"
    country_of_birth = gets.chomp
    puts "Please enter the student's height"
    height = gets.chomp
    puts "Please enter the student's hobby"
    hobby = gets.chomp
    # add the student hash to the array
    students << {
      name: name,
      cohort: cohort,
      country_of_birth: country_of_birth,
      height: height,
      hobby: hobby
    }
    puts "Now we have #{students.count} students"

    continue = ""
    until /^[yn]$/.match(continue) do
      # check if user wants to add another student
      puts "Would you like to add another student? Press 'Y' or 'N'"
      continue = gets.chomp.downcase
    end

    should_continue = false if continue == "n"
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) - country of birth: #{student[:country_of_birth]}, height: #{student[:height]}, hobby: #{student[:hobby]}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
