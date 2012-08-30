#!/usr/bin/env ruby
###############################################################################
#
# 23b interface to SpaceAPI (https://hackerspaces.nl/spaceapi/)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#    
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#    
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Copyright 2011 Ryan Rix <ry@n.rix.si>
#
###############################################################################

#config = []
#config['space_name'] = "HeatSync Labs"

require 'rubygems'
require 'cgi'
require 'serialport'
require 'json'

#cgi = CGI.new
json = JSON.parse(File.read("spaceapi.conf"))

puts "Content-type: text/json"
puts "Access-Control-Allow-Origin: *\r\n\r\n"

status = File.read('../cached-status')
hs_open = ( /true/ =~ status ? true : false )

json["open"] = hs_open

puts JSON.generate json
