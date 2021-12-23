echo "Enter Server Nickname(this will be the name you put to ssh into the server so keep it consise)"
read hostNickName
echo "Enter HostName(ip/url):"
read hostName
echo "Enter SSH Key destination:"
read keyDest

if [ ! -e ~/.ssh ]; then
    mkdir ~/.ssh
fi

echo "Specify User to login with:"
read user

cd ~/.ssh/
cp $keyDest ~/.ssh/
mostRecentFilename=$(ls -rt | tail -n 1)

chmod 600 $mostRecentFilename

if [ ! -e config.txt ]; then
    touch config.txt
fi

printf "\nHost $hostNickName $hostName
        HostName $hostName
        IdentityFile ~/.ssh/$mostRecentFilename
        User $user
        AddKeysToAgent yes" >> config

echo "Done. Now you can just "ssh $hostNickName" into the server"
printf "\n-spex"
