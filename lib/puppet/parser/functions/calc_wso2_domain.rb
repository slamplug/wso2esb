#
# calc_wso2_domain.rb
#
module Puppet::Parser::Functions
  newfunction(:calc_wso2_domain, :type => :rvalue, :doc => <<-EOS
    This calculates wso2 domain name
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "calc_wso2_domain(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    servername = arguments[0]

    result = servername[0..-2] + '.wso2.domain'

    return result
  end
end
