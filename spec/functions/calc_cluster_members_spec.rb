require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'calc_cluster_members' do

  describe 'Test WSO2 Cluster Member Calculation' do
    it 'should return { \'desesb01a\' => 4061, \'desesb01b\' => 4062 }' do
      should run.with_params('data', 'mgt').and_return({ 'desesb01a' => 4061, 'desesb01b' => 4062 }) 
    end
    it 'should return { \'desesb01m\' => 4060 }' do
      should run.with_params('data', 'worker').and_return({ 'desesb01m' => 4060 }) 
    end
    it 'should return { \'desesb02a\' => 4021, \'desesb02b\' => 4022 }' do
      should run.with_params('corp', 'mgt').and_return({ 'desesb02a' => 4021, 'desesb02b' => 4022 }) 
    end
    it 'should return { \'desesb02m\' => 4020 }' do
      should run.with_params('corp', 'worker').and_return({ 'desesb02m' => 4020 }) 
    end
    it 'should return { \'desesb03a\' => 4021, \'desesb03b\' => 4022 }' do
      should run.with_params('uc_corp', 'mgt').and_return({ 'desesb03a' => 4021, 'desesb03b' => 4022 }) 
    end
    it 'should return { \'desesb03m\' => 4020 }' do
      should run.with_params('uc_corp', 'worker').and_return({ 'desesb03m' => 4020 }) 
    end
  end
end
