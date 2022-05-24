# Interception tools config

I'm kind of in a hurry, so no script because it's not tested.

1. `# pacman -S interception-tools interception-dual-function-keys`
2. `gcc mac2linux.c -o mac2linux`
3. `gcc swapaltmeta.c -o swapaltmeta`
4. `cp ./udevmon.yaml /etc/interception/udevmon.yaml`
5. `cp ./caps.yaml /etc/interception/caps.yaml`
6. Review paths in `/etc/interception/udevmon.yaml` are correct
7. `sudo systemctl enable udevmon.service`
8. Profit. Don't ask me too much

## Troubleshooting

Hopefully nothing has to be done, but here are some resources that shouldn't be needed

- [interception tools readme](https://gitlab.com/interception/linux/tools). It's quite a long document, but everything should be understood now that I have tinkered with this
- [wincent's video on mac keybindings with linux](https://www.youtube.com/watch?v=TBqTHesnzkI). The `.c` sources I mostly copied from there. It's also explained why interception tools is a superior option (which it is)
- Just in case. This config with dual function and such works wonders even if ran under wayland, so no worries there
