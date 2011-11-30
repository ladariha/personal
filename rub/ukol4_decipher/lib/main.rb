FILE_NAME = 'file.txt'

puts "Hello World"
require '../lib/decipher/runner'
runner = Decipher::Runner.new(FILE_NAME)
runner.run()
