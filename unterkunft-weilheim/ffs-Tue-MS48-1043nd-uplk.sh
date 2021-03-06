#/bin/sh

# ssh fd21:b4dc:4b02:0:c66e:1fff:fe97:7956

uci set system.@system[0].hostname='ffs-Tue-MS48-1043nd-uplk'

uci set gluon-node-info.@location[0]=location
uci set gluon-node-info.@location[0].share_location='1'
uci set gluon-node-info.@location[0].altitude='350'
uci set gluon-node-info.@location[0].latitude='48.5037770'
uci set gluon-node-info.@location[0].longitude='9.05386582'

# Sehr stark limitiertes Internetnutzung 
uci set simple-tc.mesh_vpn='interface'
uci set simple-tc.mesh_vpn.ifname='mesh-vpn'
uci set simple-tc.mesh_vpn.enabled='1'
uci set simple-tc.mesh_vpn.limit_ingress='4500'
uci set simple-tc.mesh_vpn.limit_egress='700'

#uci set network.mesh_wan.mesh_no_rebroadcast='0'
uci set network.mesh_lan.mesh_no_rebroadcast='1' # Wir machen ja Mesh-On-LAN nach Weilheim

# Seit das Mesh mit KirchWeilheim besteht, hier nur noch einen Gateway verwenden
uci set fastd.mesh_vpn_backbone.peer_limit=1

# Per Cron Nachts um 4:15 rebooten
crontab -e
# und dann diese Zeile einfuegen:      15 4 * * * reboot 


uci commit && reboot
