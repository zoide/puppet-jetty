class jetty::logback {
  package { ['liblogback-java', 'libslf4j-java']: }

  File {
    require => [Package['liblogback-java'], Package['libslf4j-java']],
    owner   => 'jetty',
    group   => 'jetty'
  }

  file {
    '/usr/share/jetty/lib/logback-core.jar':
      ensure => '/usr/share/java/logback-core.jar';

    '/usr/share/jetty/lib/logback-classic.jar':
      ensure => '/usr/share/java/logback-classic.jar';

    '/usr/share/jetty/lib/slf4j-api.jar':
      ensure => '/usr/share/java/slf4j-api.jar';

    $jetty::logbackconf:
      source => 'puppet:///modules/jetty/logback.xml';
  }

}
