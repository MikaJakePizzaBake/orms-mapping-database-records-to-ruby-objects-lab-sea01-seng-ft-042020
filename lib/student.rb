class Student
  attr_accessor :id, :name, :grade
def self.new_from_db(row)
  new_student = self.new
  new_student.id = row[0]
  new_student.name = row[1]
  new_student.grade = row[2]
  new_student
end
def self.find_by_name
  sql = <<-SQL
  SELECT*FROM students WHERE name = ? LIMIT 1
  SQL
  DB[:conn].execute(sql,name).map {|row| self.new_from_db(row)}.first
end
def self.all
  sql = <<-SQL
  SELECT*FROM students
  SQL
  DB[:conn].execute(sql).map {|row| self.new_from_db(row)}
end
def save
  sql = <<-SQL
  INSERT INTO students (name, grade) VALUES (?, ?)
  SQL
  DB[:conn].execute(sql)
end
end
