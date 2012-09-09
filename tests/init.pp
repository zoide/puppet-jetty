class { 'jetty':
  bind_local => true,
  port       => '8080',
  proxy_host => 'proxy.example.com',
  proxy_port => '3128',
}
