class Plateau
	attr_accessor :x_max, :y_max, :rover1, :rover2
	def initialize(x_max, y_max, rover1, rover2)
		@x_max = x_max
		@y_max = y_max
		@rover1 = rover1
		@rover2 = rover2
	end

	def check
		if @rover1.x < 0 || @rover1.x > @x_max || @rover2.x <0 || @rover2.x > @x_max
			return false
		elsif rover1.y < 0 || @rover1.y > @y_max || @rover2.y <0 || @rover2.y > @y_max
			return false
		elsif @rover1.x == @rover2.x && @rover1.y == @rover2.y
			return false
		else 
			return true
		end
	end

	def start_moves
		@rover1.moves.zip(@rover2.moves).each{|move1,move2|
			@rover1.move(move1)
			@rover2.move(move2)
			unless check
				puts "Collision Error"
				break
			end
		}
	end
end

class Rover
	attr_accessor :x, :y, :direction, :moves
	def initialize(x,y,direction,moves)
		@x = x
		@y = y
		@direction = direction
		@moves = moves
	end

	def move(movement)
		if movement=='M' && @direction==0
			@y += 1
		elsif movement=='M' && @direction==1
			@x += 1
		elsif movement=='M' && @direction==2
			@y -= 1
		elsif movement=='M' && @direction==3
			@x -= 1
		elsif movement=='R' 
			@direction = (@direction + 1)%4
		elsif movement=='L'
			@direction = (@direction - 1)%4
		end
	end 
end

def get_orientation(x)
	case x
	when 'N'
		return 0
	when 'E'
		return 1
	when 'S'
		return 2
	else
		return 3
	end
end

input = Array.new(5)
puts "Your 5 line rover exercise input:"
input.each_with_index {|item,index| input[index] = gets.chomp}
location = input[0].split()
r1_pos = input[1].split()
rover1 = Rover.new(r1_pos[0].to_i,r1_pos[1].to_i,get_orientation(r1_pos[2]),input[2].split(''))
r2_pos = input[3].split()
rover2 = Rover.new(r2_pos[0].to_i,r2_pos[1].to_i,get_orientation(r2_pos[2]),input[4].split(''))
plateau = Plateau.new(location[0].to_i, location[1].to_i, rover1, rover2)
plateau.start_moves
puts "Rover1 Location: #{plateau.rover1.x} #{plateau.rover1.y}, Rover 2 Location: #{plateau.rover2.x} #{plateau.rover2.y}"
puts "Rover1 Direction: #{plateau.rover1.direction}, Rover2 Direction: #{plateau.rover2.direction}"








