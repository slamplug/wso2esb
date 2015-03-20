require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'calc_wso2_domain' do

  describe 'Test WSO2 Domain Name Calculation' do
    it 'should return desesb01.wso2.damain' do
      should run.with_params('desesb01a').and_return('desesb01.wso2.domain') 
    end
    it 'should return desesb01.wso2.damain' do
      should run.with_params('desesb01m').and_return('desesb01.wso2.domain') 
    end
    it 'should return desesb02.wso2.damain' do
      should run.with_params('desesb02a').and_return('desesb02.wso2.domain') 
    end
    it 'should return desesb02.wso2.damain' do
      should run.with_params('desesb02m').and_return('desesb02.wso2.domain') 
    end
    it 'should return desesb03.wso2.damain' do
      should run.with_params('desesb03a').and_return('desesb03.wso2.domain') 
    end
    it 'should return desesb03.wso2.damain' do
      should run.with_params('desesb03m').and_return('desesb03.wso2.domain') 
    end
  end
end
