#killing a process using puppet

exec { 'killmenow':
  command  => 'pkill killmenow',
  provider => 'shell',
}
