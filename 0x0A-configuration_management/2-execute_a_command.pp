# create a manifest that kills a process named killmenow
exec { 'killmenow':
  command => '/usr/bin/pkill -15 killmenow',
}
