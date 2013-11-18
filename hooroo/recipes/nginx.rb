# Cookbook Name:: hooroo
# Recipe:: nginx
#
# Copyright 2013, Hooroo

node.override['nginx']['event'] = 'epoll'
node.override['nginx']['worker_connections'] = 10240
node.overrid3['nginx']['keepalive_timeout'] = 30

# need to fit in somehow
#
# timer_resolution = '500ms'
# worker_rlimit_nofile = 10240

# server_name_in_redirect = 'off'
# server_tokens = 'off'

# client_body_timeout = 10
# client_header_timeout = 10
# client_header_buffer_size = 128
