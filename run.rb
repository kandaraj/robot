require_relative 'lib/simulator'

simulator = Simulator.new

while command = gets.chomp!
  result = simulator.execute(command)  
  puts result if result
end