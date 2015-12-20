class nginx {
  package { 'apache2.2-common': 
    ensure: absent
  }

  package { 'nginx':
    ensure: installed,
    require: Package['apache2.2-common']
  }

  service { 'nginx':
    ensure: running,
    enable: true,
    require: Package['nginx']
  }

  file { 'nginx-conf': 
    content: template('nginx/nginx.conf'),
    notify: Service['nginx']
  }
}
