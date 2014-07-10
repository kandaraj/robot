require_relative 'lib/simulator'

simulator = Simulator.new

while command = gets
  result = simulator.execute(command) if command && command.strip! 
  puts result if result
end