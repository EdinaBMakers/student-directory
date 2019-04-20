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

def get_column_widths(students)
  column_widths = {name: "Header".size, cohort: "Cohort".size, country_of_birth: "CoB".size, height: "Height".size, hobby: "Hobby".size}

  students.each do |student|
    column_widths[:name] = [column_widths[:name], student[:name].size].max
    column_widths[:cohort] = [column_widths[:cohort], student[:cohort].size].max
    column_widths[:country_of_birth] = [column_widths[:country_of_birth], student[:country_of_birth].size].max
    column_widths[:height] = [column_widths[:height], student[:height].size].max
    column_widths[:hobby] = [column_widths[:hobby], student[:hobby].size].max
  end

  column_widths
end

def print(students)
  column_widths = get_column_widths(students)
  name_width = column_widths[:name]
  cohort_width = column_widths[:cohort]
  cob_width = column_widths[:country_of_birth]
  height_width = column_widths[:height]
  hobby_width = column_widths[:hobby]

  puts \
  "#{"Name".center(name_width)} | " + \
  "#{"Cohort".center(cohort_width)} | " + \
  "#{"CoB".center(cob_width)} | " + \
  "#{"Height".center(height_width)} | " + \
  "#{"Hobby".center(hobby_width)}"

  puts \
  "#{"-" * name_width} | " + \
  "#{"-" * cohort_width} | " + \
  "#{"-" * cob_width} | " + \
  "#{"-" * height_width} | " + \
  "#{"-" * hobby_width}"

  students.each do |student|
    puts \
    "#{student[:name].center(name_width)} | " + \
    "#{student[:cohort].center(cohort_width)} | " + \
    "#{student[:country_of_birth].center(cob_width)} | " + \
    "#{student[:height].center(height_width)} | " + \
    "#{student[:hobby].center(hobby_width)}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
puts
print(students)
puts
print_footer(students)
