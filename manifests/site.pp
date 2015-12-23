node puppet {
  include sudoers
  include users
  include '::mysql::server'
  include '::mysql::client'
  include '::mysql-bindings'
} 

class { '::mysql::server':
  root_password           => 'root123',
  remove_default_accounts => true
}
