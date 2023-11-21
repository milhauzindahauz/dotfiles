function start-vpn --wraps='cat certs/passwd | sudo openconnect -c certs/dhl.combo.pem cvpn.dhl.com --user petr.skorepa@dhl.com --passwd-on-stdin  >> /var/log/openconnect.log' --description 'alias start-vpn=cat certs/passwd | sudo openconnect -c certs/dhl.combo.pem cvpn.dhl.com --user petr.skorepa@dhl.com --passwd-on-stdin  >> /var/log/openconnect.log'
  cat ~/certs/passwd | sudo openconnect -c ~/certs/dhl.combo.pem cvpn.dhl.com --user petr.skorepa@dhl.com --passwd-on-stdin  >> /var/log/openconnect.log $argv; 
end
