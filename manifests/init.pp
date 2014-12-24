# == Class: freebsd_portindex
#
# Full description of class freebsd_portindex here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freebsd_portindex (
  $package             = $::freebsd_portindex::params::package,
  $prefix              = $::freebsd_portindex::params::prefix,
  $config              = $::freebsd_portindex::params::config,
  $template            = $::freebsd_portindex::params::template,
  $CacheDir            = $::freebsd_portindex::params::CacheDir,
  $CacheFilename       = $::freebsd_portindex::params::CacheFilename,
  $CrunchWhitespace    = $::freebsd_portindex::params::CrunchWhitespace,
  $EndemicMakefiles    = $::freebsd_portindex::params::EndemicMakefiles,
  $Format              = $::freebsd_portindex::params::Format,
  $Input               = $::freebsd_portindex::params::Input,
  $Output              = $::freebsd_portindex::params::Output,
  $PortDBDir           = $::freebsd_portindex::params::PortDBDir,
  $OutputStyle         = $::freebsd_portindex::params::OutputStyle,
  $PortsDir            = $::freebsd_portindex::params::PortsDir,
  $ReadmeDir           = $::freebsd_portindex::params::ReadmeDir,
  $ReadmeTemplateDir   = $::freebsd_portindex::params::ReadmeTemplateDir,
  $ScrubEnvironment    = $::freebsd_portindex::params::ScrubEnvironment,
  $ShLibs              = $::freebsd_portindex::params::ShLibs,
  $Strict              = $::freebsd_portindex::params::Strict,
  $TimestampFile       = $::freebsd_portindex::params::TimestampFile,
  $UbiquitousMakefiles = $::freebsd_portindex::params::UbiquitousMakefiles,
  $Verbose             = $::freebsd_portindex::params::Verbose,
  $Warnings            = $::freebsd_portindex::params::Warnings,
) inherits ::freebsd_portindex::params {

  class { '::freebsd_portindex::install': } ->
  class { '::freebsd_portindex::config': } ~>
  Class['::freebsd_portindex']
}
