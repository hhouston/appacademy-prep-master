#
# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.
require 'byebug'
require 'course'
class Student
  attr_reader :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def has_conflict?(new_course)
    self.courses.any? do |current_course|
      new_course.conflicts_with?(current_course)
    end
  end

  def enroll(course)
    raise 'conflict' if has_conflict?(course)

      unless courses.include?(course)
        @courses << course
        course.students << self
      end
  end

  #return hash of departments to # of credits student is taking in that departments
  def course_load
    load_hash = Hash.new(0)
    self.courses.each do |course|
      load_hash[course.department] += course.credits
    end
    load_hash
  end

end
