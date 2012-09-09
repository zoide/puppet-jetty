# == Class: jetty
#
# Installs and manages Jetty.
#
# === Parameters
#
# [*bind_local*]
#  Listen on localhost only. Default: true
#
# [*port*]
#  Port to listen on. Default: 8080
#
# [*proxy_host*]
#  Use proxy for outbound HTTP and HTTPS connections. Default: false
#
# [*proxy_port*]
#  Proxy server port. Default: none
#
# === Examples
#
# class { 'jetty':
#   bind_local => true,
#   port       => '8080',
#   proxy_host => 'proxy.example.com',
#   proxy_port => '3128',
# }
#
# === Authors
#
# Sergey Stankevich
#
class jetty (
  $bind_local = true,
  $port       = '8080',
  $proxy_host = false,
  $proxy_port = false
) {

  # Module compatibility check
  $compatible = [ 'Debian', 'Ubuntu' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  Class['jetty::install'] -> Class['jetty::config']

  include jetty::install
  include jetty::config

}
