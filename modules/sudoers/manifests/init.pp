class sudoers {
  file { '/etc/sudoers':
    mode => '0400',
    source => 'puppet:///modules/sudoers/sudoers',
    owner => 'root',
    group => 'root'
  }
}
