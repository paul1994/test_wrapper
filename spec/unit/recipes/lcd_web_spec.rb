#
# Cookbook:: test_wrapper
# Spec:: lcd_web
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'test_wrapper::lcd_web' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs package httpd' do
      expect(chef_run).to install_package('httpd')
    end
    it 'installs package net-tools' do
      expect(chef_run).to install_package('net-tools')        
    end
    
    it 'create user webadmin' do
      expect(chef_run).to create_user('webadmin')
    end
    
    it 'create group named developers with webadmin as a memeber' do
      expect(chef_run).to create_group('developers').with(members:['webadmin'])    
    end

    # it 'developer has webadmin as member' do
    #   expect(chef_run).to modify_group('developers').with(members:['webadmin'])
    # end

    it 'service httpd is enabled and started' do
      expect(chef_run).to start_service('httpd')
      expect(chef_run).to enable_service('httpd')
      
      
    end
    
    
  end

#   context 'When all attributes are default, on CentOS 7.4.1708' do
#     let(:chef_run) do
#       # for a complete list of available platforms and versions see:
#       # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
#       runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
#       runner.converge(described_recipe)
#     end

#     it 'converges successfully' do
#       expect { chef_run }.to_not raise_error
#     end
#   end
end

# describe 'test_wrapper::lcd_web' do
#   context 'package httpd is installed on ubuntu'
#     let(:chef_run) do
#       # for a complete list of available platforms and versions see:
#       # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
#       runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
#       runner.converge(described_recipe)
#     end
#     it 'installs httpd' do
#       expect(chef_run).to install_package('httpd')
#    end 
# end
