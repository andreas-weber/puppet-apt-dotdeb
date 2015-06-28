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

  apt::source { 'dotdeb-php':
    location          => 'http://packages.dotdeb.org',
    release           => $lsbdistcodename,
    repos             => 'all',
    include_src       => true,
    key               => {
      'id'     => '6572BBEF1B5FF28B28B706837E3F070089DF5277',
      'source' => 'http://www.dotdeb.org/dotdeb.gpg',
    },
    notify            => Exec['apt_update']
  }
}
