# == Class freebsd_portindex::config
#
# This class is called from freebsd_portindex for service config.
#
class freebsd_portindex::config {
  if $::freebsd_portindex::zfsdir {
    if $::operatingsystemmajrelease >= 10 {
      $compression = 'lz4'
    } else {
      $compression = 'zle'
    }

    zfs { $::freebsd_portindex::zfsdir:
      atime       => off,
      compression => $compression,
      exec        => off,
      setuid      => off,
      mountpoint  => $::freebsd_portindex::CacheDir,
      before      => File[$::freebsd_portindex::CacheDir],
    }
  }

  file { $::freebsd_portindex::config:
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template($::freebsd_portindex::template),
  }

  file { $::freebsd_portindex::CacheDir:
    ensure  => directory,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
  }

  exec { 'cache-init':
    timeout => 10800,
    path    => "$::freebsd_portindex::prefix/bin",
    creates => "$::freebsd_portindex::CacheDir/$::freebsd_portindex::CacheFilename",
    require => [
      File[$::freebsd_portindex::config],
      File[$::freebsd_portindex::CacheDir],
    ],
  }
}
