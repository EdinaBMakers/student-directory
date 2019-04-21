VALID_COHORTS = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
DEFAULT_COHORT = :september
@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
 end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [
      student[:name],
      student[:cohort],
      student[:country_of_birth],
      student[:height],
      student[:hobby]
  ]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, country_of_birth, height, hobby = line.chomp.split(",")
    @students << {
      name: name,
      cohort: cohort.to_sym,
      country_of_birth: country_of_birth,
      height: height,
      hobby: hobby
    }
  end
  file.close
end

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

  begin
    name = get_name
    cohort = get_cohort
    country_of_birth = get_country_of_birth
    height = get_height
    hobby = get_hobby
    # add the student hash to the array
    @students << {
      name: name,
      cohort: cohort,
      country_of_birth: country_of_birth,
      height: height,
      hobby: hobby
    }

    puts "Now we have #{@students.count} student#{"s" if @students.count > 1}"

    # check if user wants to add another student
  end while yes_no_question?("Would you like to add another student? Press 'Y' or 'N'")
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
  puts
end

def get_column_widths
  column_widths = {name: "Header".size, cohort: "Cohort".size, country_of_birth: "CoB".size, height: "Height".size, hobby: "Hobby".size}

  @students.each do |student|
    column_widths[:name] = [column_widths[:name], student[:name].size].max
    column_widths[:cohort] = [column_widths[:cohort], student[:cohort].size].max
    column_widths[:country_of_birth] = [column_widths[:country_of_birth], student[:country_of_birth].size].max
    column_widths[:height] = [column_widths[:height], student[:height].size].max
    column_widths[:hobby] = [column_widths[:hobby], student[:hobby].size].max
  end

  column_widths
end

def print_students_list
  column_widths = get_column_widths
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

  @students.each do |student|
    puts \
    "#{student[:name].center(name_width)} | " + \
    "#{student[:cohort].to_s.center(cohort_width)} | " + \
    "#{student[:country_of_birth].center(cob_width)} | " + \
    "#{student[:height].center(height_width)} | " + \
    "#{student[:hobby].center(hobby_width)}"
  end
end

def print_footer
  puts
  puts "Overall, we have #{@students.count} great student#{"s" if @students.count > 1}"
end

interactive_menu
