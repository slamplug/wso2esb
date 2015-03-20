require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'calc_mgmt_host' do
  describe 'Test calc_mgmt_host' do
    it { should run.with_params('desesb01m').and_return('desesb01m-mgmt') }
    it { should run.with_params('desesb01a').and_return('localhost') }
    it { should run.with_params('desesb02m').and_return('desesb02m-mgmt') }
    it { should run.with_params('desesb02a').and_return('localhost') }
    it { should run.with_params('desesb03m').and_return('desesb03m-mgmt') }
    it { should run.with_params('desesb03a').and_return('localhost') }
  end
end
