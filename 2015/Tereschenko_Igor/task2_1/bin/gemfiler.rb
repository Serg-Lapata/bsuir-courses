Dir['../lib/*.rb'].each { |f| require_relative(f) }
require 'optparse'
name = ARGV[0].to_s
ARGV.shift

parser = OptionParser.new do|opts|
  opts.banner = "Usage: ./gemfiler [gem_name] [gem_versions]
  Examples: ./gemfiler devise '~> 2.1.3'
  ./gemfiler rails '>= 3.1' '< 4.0'"
end

parser.parse!

input = InputParser.new(name, ARGV)
versions = VersionFinder.new(name)
output = Parser.new(versions.vget, input.operators)
output.output
