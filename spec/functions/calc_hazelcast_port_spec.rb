require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'calc_hazelcast_port' do
  describe 'Test calculate hazelcast_port' do
    it { should run.with_params('desesb01m').and_return(4060) }
    it { should run.with_params('desesb01a').and_return(4061) }
    it { should run.with_params('desesb01b').and_return(4062) }
    it { should run.with_params('desesb02m').and_return(4020) }
    it { should run.with_params('desesb02a').and_return(4021) }
    it { should run.with_params('desesb02b').and_return(4022) }
    it { should run.with_params('desesb03m').and_return(4020) }
    it { should run.with_params('desesb03a').and_return(4021) }
    it { should run.with_params('desesb03b').and_return(4022) }
  end
end
