class jetty::config {
  if defined(Class['openjava']) {
    $java = 'openjava'
  } elsif defined(Class['sunjava']) {
    $java = 'sunjava'
  }

  service { 'jetty':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => false,
  }

  File {
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    notify => Service['jetty'],
  }

  file {
    '/etc/default/jetty':
      content => template('jetty/jetty.erb');

    '/etc/jetty/jetty.xml':
      content => template('jetty/jetty.xml.erb');
  }
}
