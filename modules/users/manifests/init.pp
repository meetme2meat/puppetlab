class users {
  group { 'deployer':
    ensure => present,
    before => User['deployer']
  }

  ##
  user { 'deployer':
    ensure => present,
    comment => 'git pull, push , deploy do whatever you want',
    managehome => true,
    home => '/home/deployer',
    shell => '/bin/bash',
    group => 'deployer',
    password => '*'
  }

  ssh_authorized_key { 'deployer':
    ensure => present,
    user => 'deployer',
    type => 'rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD3TKTE6C5znRjC3erRaSyibL+1LdNzCk9D38+gFs5Pph5w3w+W2DREsj3BRyfe6E2Y1ZjtH1AjnCm5YD8hwKyf5jLp6Tuka+n7CYiCoOwSjSW5/HfXwK9cCD3i6GnZKqzTTMiALj0w/XbNTOmAG43XBO3rHvMpZRGtGGZIIS7g/THS0NzeZqgeN8gKwAOtfahx32SUx1th1j0Id4Jkg0I7mJ0hBuPk9Mey0XQJD1Vzjl72VR2SFiT9zTA2bxV9WPOjWBILi5cjUiz+LMensDfxxl+LRXHiXz5wjkhKqcQVxUCv564G1RUAeTS+ZMa+K/ckbQPvgaIqkxdK4RZ1MmVF',
    require => User['deployer']
  }

}
