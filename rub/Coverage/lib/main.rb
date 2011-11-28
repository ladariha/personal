##
##  Input is loaded from file defined in FILE_NAME
##

require '../lib/coverage/runner'
FILE_NAME = './inputFiles/test_singlesolution.txt'

runner = Coverage::Runner.new(FILE_NAME)
runner.run()

