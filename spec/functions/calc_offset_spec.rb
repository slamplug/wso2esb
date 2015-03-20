require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'calc_offset' do
  describe 'Test calculate port offset' do
    it { should run.with_params('data', 'mgt').and_return(16) }
    it { should run.with_params('data', 'worker').and_return(6) }
    it { should run.with_params('corp', 'mgt').and_return(12) }
    it { should run.with_params('corp', 'worker').and_return(2) }
    it { should run.with_params('uc_corp', 'mgt').and_return(12) }
    it { should run.with_params('uc_corp', 'worker').and_return(2) }
  end
end
