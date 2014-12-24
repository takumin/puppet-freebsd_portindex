# == Class freebsd_portindex::config
#
# This class is called from freebsd_portindex for service config.
#
class freebsd_portindex::config {
  file { $::freebsd_portindex::config:
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template($::freebsd_portindex::template),
  }
}
