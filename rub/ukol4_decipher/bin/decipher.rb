FILE_NAME = '../lib/file.txt'

require '../lib/decipher/runner'
runner = Decipher::Runner.new(FILE_NAME)
runner.run()
