Collection of tools and scripts that allow you to easily setup a mining rig on Linux.

To install (on ubuntu/debian):
  echo "deb https://repo.cryptid.rs/apt /" > /etc/apt/sources.list.d/cryptid.list
  apt-get update
  apt-get install cryptomine

Adjust configuration in /etc/cryptomine/config.yml

Start the miner with: service cryptomine start

Enable the miner to start at boot (with a 60sec delay):
  systemctl enable cryptomine
  systemctl enable cryptomine.timer

