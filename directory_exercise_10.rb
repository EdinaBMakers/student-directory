# What happens if the user doesn't enter any students?
# It will try to print an empty list.
# How can you use an if statement (Control Flow) to only print the list if there is at least one student in there?
VALID_COHORTS = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
DEFAULT_COHORT = :september

def get_name
  # get student's information
  puts "Please enter the student's name"
  gets.chomp
end

def get_cohort
  puts "Please enter the student's cohort"
  cohort = gets.chomp.to_sym
  cohort = DEFAULT_COHORT unless VALID_COHORTS.include?(cohort)
  cohort
end

def get_country_of_birth
  puts "Please enter the student's country of birth"
  gets.chomp
end

def get_height
  puts "Please enter the student's height"
  gets.chomp
end

def get_hobby
  puts "Please enter the student's hobby"
  gets.chomp
end

def yes_no_question?(question)
  answer = ""
  until /^[yn]$/.match(answer) do
    puts question
    answer = gets.chomp.downcase
  end

  answer == "y"
end

def input_students
  # create an empty array
  students = []
  should_continue = yes_no_question?("Would you like to add a student? Press 'Y' or 'N'")

  # while should_continue == true, repeat this code
  while should_continue do
    name = get_name
    cohort = get_cohort
    country_of_birth = get_country_of_birth
    height = get_height
    hobby = get_hobby
    # add the student hash to the array
    students << {
      name: name,
      cohort: cohort,
      country_of_birth: country_of_birth,
      height: height,
      hobby: hobby
    }

    puts "Now we have #{students.count} student#{"s" if students.count > 1}"

    # check if user wants to add another student
    should_continue = yes_no_question?("Would you like to add another student? Press 'Y' or 'N'")
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

def print_by_cohort(students)
  return if students.empty?

  students_by_cohort = Hash.new{|hash, key| hash[key] = []}

  students.each do |student|
    students_by_cohort[student[:cohort]].push(student)
  end

  students_by_cohort.each do |cohort, students|
    puts "Students of the #{cohort} cohort"
    puts
    print(students)
    puts
  end
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
    "#{student[:cohort].to_s.center(cohort_width)} | " + \
    "#{student[:country_of_birth].center(cob_width)} | " + \
    "#{student[:height].center(height_width)} | " + \
    "#{student[:hobby].center(hobby_width)}"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{"s" if students.count > 1}"
end
# nothing happens until we call the methods
students = input_students
print_header
puts
print_by_cohort(students)
puts
print_footer(students)
