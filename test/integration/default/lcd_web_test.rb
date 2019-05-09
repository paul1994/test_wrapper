# # encoding: utf-8

# Inspec test for recipe test_wrapper::lcd_web

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

# testing each package indiviually

describe package('httpd') do
  it { should be_installed }
end

describe package('net-tools') do
  it {should be_installed}
end

describe service('httpd') do
  it {should be_running}
  it {should be_enabled}
end

describe user('webadmin') do
  it {should exist}
  its('group') { should eq 'developers'}
end

describe group('developers') do 
  it { should exist }
  its('members') { should include 'webadmin' }
end


# # using a foreach statement to test packages
# apps = %w(
#   httpd
#   net-tools
# )
# apps.each do |pkg|
#   describe package(pkg) do
#     it {should be_installed}
#   end
# end
