# Takes commands from stdin or from a file.
# cat file | ruby run.rb
# or
# ruby run.rb => gets commands until intrepted


require_relative 'lib/simulator'

simulator = Simulator.new

while command = gets
  result = simulator.execute(command) if command && command.strip! 
  puts result if result
end