# == Class: aw_apt_dotdeb
#
# This module adds the dotdeb repository to apt.
#
# === Parameters
#
# === Examples
#
#   include aw_apt_dotdeb
#
#   class { 'aw_apt_dotdeb': }
#
# === Authors
#
# Andreas Weber <code@andreas-weber.me>
#
# === Copyright
#
# Copyright 2015 Andreas Weber
#
class aw_apt_dotdeb () {
  include apt

  apt::key { 'dotdeb-key':
    key        => '89DF5277',
    key_source => 'http://www.dotdeb.org/dotdeb.gpg',
  }

  apt::source { 'dotdeb-php':
    location          => 'http://packages.dotdeb.org',
    repos             => 'all',
    include_src       => true,
    require           => Apt::Key['dotdeb-key']
  }
}
