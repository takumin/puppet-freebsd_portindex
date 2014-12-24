# == Class freebsd_portindex::params
#
# This class is meant to be called from freebsd_portindex.
# It sets variables according to platform.
#
class freebsd_portindex::params {
  case $::osfamily {
    'FreeBSD': {
      $package             = 'ports-mgmt/p5-FreeBSD-Portindex'
      $prefix              = '/usr/local'
      $config              = "$prefix/etc/portindex.cfg"
      $template            = 'freebsd_portindex/portindex.cfg.erb'
      $zfsdir              = undef

      # portindex parameter
      $CacheDir            = '/var/db/portindex'
      $CacheFilename       = 'portindex-cache.db'
      $CrunchWhitespace    = undef
      $EndemicMakefiles    = undef
      $Format              = undef
      $Input               = undef
      $Output              = undef
      $PortDBDir           = undef
      $OutputStyle         = undef
      $PortsDir            = undef
      $ReadmeDir           = undef
      $ReadmeTemplateDir   = undef
      $ScrubEnvironment    = undef
      $ShLibs              = undef
      $Strict              = undef
      $TimestampFile       = undef
      $UbiquitousMakefiles = undef
      $Verbose             = undef
      $Warnings            = undef
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
