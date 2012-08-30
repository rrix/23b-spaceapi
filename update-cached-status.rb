require 'rubygems'
require 'cgi'
require 'json'
require 'digest/sha2'
require 'open-uri'


# query for status
source = open("http://172.22.110.99?9").read

# ugly as shit
caps = []
for line in source
    m = /([\d])\s$/x.match(line)
    if m then
	caps << m.captures
    end
end

# more ugly. Space is open when the doors are open or unlocked
hs_open = false # because when is anyone open these days?

hs_open = true if caps[2][0].to_i == 1 
hs_open = true if caps[3][0].to_i == 1 
hs_open = true if caps[4][0].to_i == 0 
hs_open = true if caps[5][0].to_i == 0 

File.open('../cached-status', 'w') {|f| f.write(hs_open) }
