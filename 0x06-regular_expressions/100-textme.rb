#!/usr/bin/env ruby
#!/usr/bin/env ruby
puts ARGV[0].scan(/(?<=sender:|from:|to:|flags:)[A-Za-z0-9:+-]+/).join(",")
