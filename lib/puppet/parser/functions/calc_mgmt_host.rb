#
# calc_mgmt_host.rb
#
module Puppet::Parser::Functions
  newfunction(:calc_mgmt_host, :type => :rvalue, :doc => <<-EOS
    This calculates wso2 calc_mgmt_host. Takes 1 args
      1. servername
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "calc_mgmt_host(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    servername = arguments[0]

    if servername.end_with? 'm'
      result = servername + '-mgmt'
    else
      result = 'localhost'
    end

    return result
  end
end
