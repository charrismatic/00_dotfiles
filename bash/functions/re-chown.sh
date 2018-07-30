cat >check.bsh << EOF
#!/bin/bash

while IFS=':' read -r login pass uid gid uname usrdir comment; do
  if [[ "\$usrdir" = **/usr/** ]]; then
    if [ -d "\$usrdir" ]; then
      echo sudo chown -R \$uid:\$gid "\$usrdir";
    fi
  fi
done < /etc/passwd
EOF

chmod +x check.bsh
./check.bsh
