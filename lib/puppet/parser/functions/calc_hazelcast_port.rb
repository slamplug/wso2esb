#
# calc_hazelcast_port.rb
#
module Puppet::Parser::Functions
  newfunction(:calc_hazelcast_port, :type => :rvalue, :doc => <<-EOS
    This calculates wso2 hazelcast_port. Takes 1 args
      1. server_name
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "calc_hazelcast_port(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    servername = arguments[0]

    result = case servername
      when /^desesb01m$/ then 4060
      when /^desesb01a$/ then 4061
      when /^desesb01b$/ then 4062
      when /^desesb02m$/ then 4020
      when /^desesb02a$/ then 4021
      when /^desesb02b$/ then 4022
      when /^desesb03m$/ then 4020
      when /^desesb03a$/ then 4021
      when /^desesb03b$/ then 4022
      else
        raise(Puppet::ParseError, 'calc_hazelcast_port(): Unknown servername given')
    end

    return result
  end
end
