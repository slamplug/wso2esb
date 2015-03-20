#
# calc_cluster_members.rb
#
module Puppet::Parser::Functions
  newfunction(:calc_cluster_members, :type => :rvalue, :doc => <<-EOS
    This calculates wso2 port offset. Takes 2 args
      1. tier (corp or data)
      2. sub_domain (mgt or worker)
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "calc_cluster_members(): Wrong number of arguments " +
      "given (#{arguments.size} for 2)") if arguments.size < 2

    tier = arguments[0]
    subdomain = arguments[1]

    result = case tier
      when /^data$/ then case subdomain
        when /^mgt$/ then { 'desesb01a' => 4061, 'desesb01b' => 4062 }
        when /^worker$/ then { 'desesb01m' => 4060 }
        else
          raise(Puppet::ParseError, 'calc_cluster_members(): Unknown type of subdomain given')
        end
      when /^corp$/ then case subdomain
        when /^mgt$/ then { 'desesb02a' => 4021, 'desesb02b' => 4022 }
        when /^worker$/ then { 'desesb02m' => 4020 }
        else
          raise(Puppet::ParseError, 'calc_cluster_members(): Unknown type of subdomain given')
        end
      when /^uc_corp$/ then case subdomain
        when /^mgt$/ then { 'desesb03a' => 4021, 'desesb03b' => 4022 }
        when /^worker$/ then { 'desesb03m' => 4020 }
        else
          raise(Puppet::ParseError, 'calc_cluster_members(): Unknown type of subdomain given')
        end
      else
        raise(Puppet::ParseError, 'calc_cluster_members(): Unknown type of tier given')
    end

    return result
  end
end