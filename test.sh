#!/bin/bash
read -p "Podaj nazwę nowego użytkownika (małe litery): " USERNAME
USERNAME=$(echo "$USERNAME" | tr 'A-Z' 'a-z')

adduser --shell /bin/bash "$USERNAME"

if [ $? -ne 0 ]; then
    echo "Błąd: użytkownik nie został utworzony"
    exit 1
fi

mkdir -p /home/$USERNAME/odczyt
mkdir -p /home/$USERNAME/odczytzapis

echo "to jest folder odczyt" > /home/$USERNAME/odczyt/.message
echo "to jest folder odczytzapis" > /home/$USERNAME/odczytzapis/.message

chown -R $USERNAME:$USERNAME /home/$USERNAME

chmod 755 /home/$USERNAME
chmod 555 /home/$USERNAME/odczyt
chmod 555 /home/$USERNAME/odczytzapis
chmod 644 /home/$USERNAME/odczyt/.message
chmod 644 /home/$USERNAME/odczytzapis/.message

echo "Użytkownik $USERNAME został poprawnie utworzony."
