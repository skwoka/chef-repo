#
# Cookbook Name:: owncloud
# Recipe:: _php_fpm
#
# Copyright 2013, Onddo Labs, Sl.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#==============================================================================
# Installs PHP-FPM
#==============================================================================

include_recipe 'php-fpm'

web_server = node['owncloud']['web_server']

php_fpm_pool node['owncloud']['php-fpm']['pool'] do
  user node[web_server]['user']
  group node[web_server]['group']
  if node['owncloud']['max_upload_size']
    php_options({
      'php_admin_value[upload_max_filesize]' => node['owncloud']['max_upload_size'],
      'php_admin_value[post_max_size]' => node['owncloud']['max_upload_size']
    })
  end
end
