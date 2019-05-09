#
# Cookbook:: test_wrapper
# Recipe:: lcd_web
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apps = %w(
  httpd
  net-tools
)

apps.each do |pkgs|
  package pkgs do
    action :install
  end
end

# package 'httpd' do
#   action :install
# end

service 'httpd' do
  action [:enable, :start]
end

group 'developers' do
  action :create
  append true
end

user 'webadmin' do
  comment 'web admin user'
  uid '2001'
  gid 'developers'
  action :create
end

group 'developers' do
  members 'webadmin'
  action :modify
  append true
end

