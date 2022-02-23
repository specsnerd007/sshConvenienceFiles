#!/bin/bash
echo 'What do you wanna do?'
echo $'\n[0]:AddServer\n[1]:Download\n[2]:Upload\n'
read option

if [ $option -eq 1 ]
then
    echo 'Which server you wanna download from? '
    read serverName
    echo 'Enter directory of the files in the server '
    read directory
    printf "Where do you want it to be downloaded \n . for current directory"
    read -e direcInPc
    scp -r $serverName:$directory $direcInPc
elif [ $option -eq 2 ]
then
    echo 'Which server you want to upload to? '
    read serverName
    echo 'Enter directory of the files in your system '
    read -e directory
    echo 'Enter the directory where you want it to be uploaded in your server(for eg. /home/username/filename/ and so on)'
    read directoryInServer
    scp -r $directory $serverName:$directoryInServer
elif [ $option -eq 0 ]
then
    echo "Enter Server Nickname(this will be the name you put to ssh into the server so keep it consise)"
    read  hostNickName
    echo "Enter HostName(ip/url):"
    read hostName
    echo "Enter SSH Key destination:"
    read -e keyDest

    if [ ! -e ~/.ssh ]; then
        mkdir ~/.ssh
    fi

    echo "Specify User to login with:"
    read user

    cd ~/.ssh/
    cp $keyDest ~/.ssh/
    mostRecentFilename=$(ls -rt | tail -n 1)
    chmod 600 $mostRecentFileName

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

else
    printf "::codl:;;;;;;;;;;;;;col:;;;;;,,,,,,,,,,,;;;:xkkkkkOOkkkxxxxxxxxxxxxxxkxc;:,'.........,;;
::cddlc::;;;;;;::;;:loc:;;;;;;,,,,,,,,;clllxkkkkkkkxxxxxkkkkkkxxxxxxxxxxl;,;;'.........,;;,'........
cclddlc::::::::::::cooc:;;;;;;;;,,,;;:coclxxxxxxxxxxxxxxxxxkkkkkkkkkxxxxxx:.,;;,'.........,;,'......
cclddoc:::::::::::cldl:::;;;;;;;,,;;col:;odxxxxxxxxxxxxxxxxxxxxkkkkkkkkkkkx;..';;;'.........',,'....
ccloxoccc:c:::cccccldcc::::;;;,;:ccldlll:ccoxxxxxkkkkkkkOOOOOOkkxxxkkkkkOOko,....,,,'..........,,'..
cccoddlccccccccccccldcc:;:clccccooddxolool::xxxxkkkkxxxxxkkkkkkkkkkkkkkkkkkdl;'....''''..........,,'
ccclddolcccccccccccldl::llllloocloodxodol;:lxxxkOkxxxxxxxxxxkkkkkkkkkkkkkkkdcc:;'.....''..........';
cllloddlccccccccccccdlldloddllloololdxo:c',xxxxkOkxxxxxxxxxkkOOOOOOOOOOkkkko:c,,:;......','........'
cclllddolcccccccccccckkxolloddllloocldl;'..oxxxxOkxxxxxxkxkkOOOOOOOOOOkkOOkl::,.';,......,;,........
cclllodolccccccccl:cxkkxoxxollo::;;,;co:,,.,xxxxkkkkkxxxxxkOOOOOOO00OOkkkOkl::,...,,'.....';;.......
ccllllddollcccccl:cxxxkkdllolc:;,,'.:coxkkx':xxxxkOOkkxxxxkOOOOOOOOOOOkkkkdoc:'....','.....';;......
lllllloxdollllll::dxxxxkxdoc;;,'',;'::lk0Okd':xxxxkOOkdoxkkkkOOOOOOOOkkxxdcll:......,,......';,.....
llllllldxoollll:cdxxxxxxxo::;,.,'':;::cxk0Okx;;xxxxxkOOdxkkkkkkkkkOkkkxxxl;oo:'.....';,......,;.....
llllllloxdolll:lxxxxxxdocll:,;';;';:::cdkkxkkx::xxxxxkkkOOkkxdddddkkkkkko:;dxdl;;...';;'......;,....
lllllllodkxol:oxxxxxxdc;::cllc,:,,:;coxxxdoloxOccxkkxxkkkOOOxxkxkkkkkkxd::oxodxdcl:'';:'......,:'...
llccccccoxkxldxxxxxxdc;;;,;oxx::,::cxxxxxdoxdodxdldkkxxkdxkkkkOOOOOOkdl;;:llxoloodldc::'......':,...
;,,,,,''codxkkxxxxxdc;;;';ccldlc;:,dxxxxxxxkkkxoddddxxxxoxxxxxxxxocllol,;',:lxdllxxldxl'.......;:'..
;;;;;;;kOxox00kxxxxc;;;':cccll;lcc;dxxxxxxxxxxxxddxkdkkxdddxdlc::coxxxo,;,;:oldxxlxxokO;.......,:,..
;;;;;;dXOoxxk0Okxxo;;;':cccccl:;:olokxxxxxxxxxxkkkkkxkkkdc:;::coddooxd:;:,':cllxxxodkxxx'......,:,..
;;;;;,OXdxxxxkO0Oxc:;,:lccccccc;:looOkkkkxxxxxkkkkkkkkkx:cdxdddolllol:::;,..:cdlxxxdkkldd......,:'..
;;;;;,KXoxxxxxkOOxl:;clllcccccc,::c:x0Okkkxxxxkkxxkkxxxc;cxxkkkkOOkd:cc;,;'.':lxoxkklxxldo.....,:'..
;;;;;:XKoxxxxxdolooodoolllccccc,:cdllkOOOkkxxddddxkkkkd,:dxxxxxkkkkkool::c;;,clxkxkkdlxxdx,....,:'..
;;;;;oXKoxxdol::::dOOxoollllcc:;:dxxlkxkkOOkxxdloxxxxx;;cxxxxxxxkxxxcc,::,;;;;cokddxxdlxxx:....,,...
;;;;;xX0cc::;;;;;ldxkkxdoll:;,.;lxxxdkxkkkkOOOkdxxxxxc;;cxxxxxxxxxxo:,.,......,:oxlxkxoxxx:...','...
;;;;,xK0:,,''',;:::clodxdlc;;',;oxkkkkkkkxxxkOOOxdxxd::;;lxxxxxxxxd:'..''......:cxddkkkkxxc..,;'....
;;;;,dK0dko;;;;;;;;:::::lddoc:d:oxxxxxkx;xO000Okkkxdocccc,dxxxxxxo;'..'''......;:dkkxkkkxkc';:,.....
;;;;,lKKkOc;;;;;;;;;,'';:cloxxOloxxxxkkkdcxNNWWNKOkkxddoolokxxxxl;;.',,,,......;:okxkkkxkkl;:'......
;,,'';00Oc,;;,,,,,,..',,,;;xxx0kdkkkxxxxxxokKNWWWWWNX00xdOOOOkxlc:,;;;;,,,'....::oxkkkkkkOd;'.......
;,,''.dc,.''''',''..''',,,lXxdkOxkOOkkxodxxxdxkO0XWWN00Olkkkkxlllclolllccc:;;,,clokOOOOO0Ol.........
c;,,,'.'..'''''''.''''',,;KNkdxxxokO00Oxolodxxxxxxxkl::ccxxxdc::,;::::cccccc:::lodOOOOOkkxlc;.......
0x;;,,.'..''''''.',',,,,'ONNKlxxxocxkOO00Okddooodxxd::::oxxd:;,..',,,,,,,,,,''.:ccdkkkkxxxlKNK;:::;,
xdl:;,'...''''..',',,,,,cNNNNoxddxcxxkkkOO00OOkdc::;;:coxxdc;'.''.',,,,,,,,'...'::cxxxxxxkd0WN;c::::
:ldol:,..'''''.''',,;;;;ONNNNKodoxolxxxxkkkO000Okl:;;cxxxo;'.',,,'..'.''''''....;::lxxxxxxlKWN;:::::
,;:clc:;,,,''..',,;;;;;cXNNNNNkdcxxllxxxxxxxkkO0Oxoollooc,;',,,,,,'.,,,''.......':::cxkkkkcNWN;:::::
'',;cool:;,,..,;;;;;;;;xNNNNNNNxcdxxdoooodddxxxkdloodollcxk;;;;,,,,.',,,,,,,,''..';::coxxxdNNO;:::::
'',,;:cool:'';;;;;;;;;'KNNNNNNNXlcxxxxxxdc;;:lol:::::cldKNOoolc::;;,',,,,,,,,,,,,'',;:::::KNNd::::::
,,,,,,;:col:lc:;;;;;;;;NNNNNNNNNKldxxxxxxxc:;;;,,;,;;cxKXXdoddddoolc;:;;;;;;,,,,,,,'',;:;oXXXc:ccccc
',,,,,,,;;;dxoc:;;;;;;cNNNNNNNNNNXxdxxxxxxo;;;;;::;cxKXXXK;:::clooodloollcc:::;;;;,,,,cdlKXXk:cclllo
'',,,,,,;';coddlc::;;;cNNNNNNNNNNNN0ddxxxxd:;;;;;lkKXXXXXO',,,;;;;:cccoodddddoollcc::;dxKXX0lclodxkk
'',,;;;;;.;:clddlc:::;;XNNNNNNNNNNNNXodxxxd::;;cOKXXXXXXXo',,,,,,,,;,,::clodddxxxddddockKXXkodxxkkkx"
fi
