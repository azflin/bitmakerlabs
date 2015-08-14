class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an object"
	end
end

class Person
	attr_accessor :name
	def initialize(name)
		@name = name
	end
	def greeting
		puts "Hi, my name is #{@name}"
	end
end

chris = Instructor.new("Chris")
chris.greeting

cristina = Student.new("Cristina")
cristina.greeting

chris.teach
cristina.learn


