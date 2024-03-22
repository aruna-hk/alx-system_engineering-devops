#!/usr/bin/pup
#flask installation

package { 'flask':
  ensure   => installed,
  provider => 'pip3',
}

