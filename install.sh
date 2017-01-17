#!/bin/bash
sudo mkdir -p /pool/minecraft/direwolf20/world
sudo mkdir -p /pool/minecraft/direwolf20/logs
sudo chown -R mike:mike /pool/minecraft
touch /pool/minecraft/direwolf20/banned-ips.json
touch /pool/minecraft/direwolf20/banned-players.json
touch /pool/minecraft/direwolf20/ops.json
touch /pool/minecraft/direwolf20/usercache.json
touch /pool/minecraft/direwolf20/whitelist.json

PLAYERS=$(cat <<'PLAYERS'
[
  {
    "uuid": "7b5f1daf-0942-4e71-a53c-d1faa9e0596e",
    "name": "ilude"
  }
]
PLAYERS
)

echo "$PLAYERS" > /pool/minecraft/direwolf20/whitelist.json

OPS=$(cat <<'OPS'
[
  {
    "uuid": "7b5f1daf-0942-4e71-a53c-d1faa9e0596e",
    "name": "ilude",
    "level": 4
  }
]
OPS
)
echo "$OPS" > /pool/minecraft/direwolf20/ops.json

VAR=$(cat <<'ENDCONFIG'
allow-flight=false
allow-nether=true
announce-player-achievements=true
difficulty=1
enable-command-block=false
enable-query=false
enable-rcon=true
force-gamemode=false
gamemode=0
generate-structures=true
generator-settings=
level-name=world
level-seed=
level-type=DEFAULT
max-build-height=256
max-players=60
motd=iLude Direwolf20 Server
online-mode=true
op-permission-level=4
player-idle-timeout=0
pvp=true
rcon.password=pass
rcon.port=25575
resource-pack=
server-ip=
server-port=25565
snooper-enabled=true
spawn-animals=true
spawn-monsters=true
spawn-npcs=true
view-distance=10
white-list=true
ENDCONFIG
)

echo "$VAR" > /pool/minecraft/direwolf20/server.properties
