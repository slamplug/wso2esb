#
# calc_offset.rb
#
module Puppet::Parser::Functions
  newfunction(:calc_offset, :type => :rvalue, :doc => <<-EOS
    This calculates wso2 port offset. Takes 2 args
      1. tier (corp or data)
      2. sub_domain (mgt or worker)
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "calc_offset(): Wrong number of arguments " +
      "given (#{arguments.size} for 2)") if arguments.size < 2

    tier = arguments[0]
    subdomain = arguments[1]

    result = case tier
      when /^data$/ then case subdomain
        when /^mgt$/ then 16
        when /^worker$/ then 6
        else
          raise(Puppet::ParseError, 'calc_offset(): Unknown type of subdomain given')
        end
      when /^corp$/ then case subdomain
        when /^mgt$/ then 12
        when /^worker$/ then 2
        else
          raise(Puppet::ParseError, 'calc_offset(): Unknown type of subdomain given')
        end
      when /^uc_corp$/ then case subdomain
        when /^mgt$/ then 12
        when /^worker$/ then 2
        else
          raise(Puppet::ParseError, 'calc_offset(): Unknown type of subdomain given')
        end
      else
        raise(Puppet::ParseError, 'calc_offset(): Unknown type of tier given')
    end

    return result
  end
end
