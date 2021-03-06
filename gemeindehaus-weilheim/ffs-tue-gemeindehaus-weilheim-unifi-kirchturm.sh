# /bin/sh
# Unifi AP LR im Kirchturm, mesht per Kabel über Richtfunkt mit der Unterkunft

# Hostname
uci set system.@system[0].hostname='ffs-tue-gemeindehaus-weilheim-unifi-kirchturm'

# Kontaktdaten angeben
uci set gluon-node-info.@owner[0]='freifunk-tuebingen'
uci set gluon-node-info.@owner[0].contact='anfrage@freifunk-tuebingen.de'

# Autoupdate
uci set autoupdater.settings.enabled=1 #aktiviert
uci set autoupdater.settings.branch=stable #branch stable

# Mesh on WAN
uci set network.mesh_wan.auto=1 #an weil hier die Nanostation angeschlossen ist

# Wifi generell
uci set wireless.radio0.disabled=0 # Wifi ist an

# Client Netzwerk
uci set wireless.client_radio0.disabled=0 # Client Netzwerk ist an

# Mesh on Radio
uci set wireless.ibss_radio0.disabled='0' #ist an

# Geolocation
uci set gluon-node-info.@location[0]='location'
uci set gluon-node-info.@location[0].share_location='1'
uci set gluon-node-info.@location[0].latitude='48.48995241961119'
uci set gluon-node-info.@location[0].longitude='9.031700044897661'

# Rebroadcast, empfohlene Einstellung
uci set network.mesh_wan.mesh_no_rebroadcast='1' #WAN off
uci set network.mesh_lan.mesh_no_rebroadcast='1' #LAN off

uci commit && wifi
reboot
