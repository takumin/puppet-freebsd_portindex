# == Class freebsd_portindex::install
#
# This class is called from freebsd_portindex for install.
#
class freebsd_portindex::install {
  package { $::freebsd_portindex::package:
    ensure => present,
  }
}
