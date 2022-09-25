# kmonad

So [kmonad](https://github.com/kmonad/kmonad) is a keyboard manager similar to
[interception tools](https://gitlab.com/interception/linux/tools) (as in, they
work the same). They grab your keyboard and transform it.

Historically I used interception tools to achieve my keyboard needs. I was
making heavy use of a mac machine at work everyday and I wanted to keep the
muscle memory in Linux by preserving the Cmd and Super keys between mac and
linux. The tools in interception (which can also be found in this repo) helped
exactly that: to map some key combinations to regular mac bindings (like
super+{v,c,t,l,bksp} and alt-{bksp}).

Kmonad, however, takes an approach based on keyboard layout. I am very fond of
using my own bindings of
[spaceFN](https://geekhack.org/index.php?topic=51069.0) in my keyboards. I have
achieved this in [many](https://github.com/anachronic/spacefn-evdev)
[ways](https://github.com/anachronic/qmk_firmware/blob/17aba11f22550d2222fa8e098b7463ca0ac3dab9/keyboards/massdrop/alt/keymaps/anachronic/keymap.c)
[before](https://github.com/anachronic/dotfiles/blob/main/macos/link/.config/karabiner/karabiner.json).
But I was never happy with any option in Linux. `spacefn-evdev` (linked before)
worked great but it somehow locked the screen to be always on, which isn't very
nice. On the other hand, while QMK is amazing and having a keyboard with a
custom firmware is the ultimate solution, there will always be cases where that
doesn't work, namely **laptops** and (probably) work. Kmonad solves that problem.

In short, if some day I don't remember what this folder is (because it's not
automated yet). Here's what I should do:

- make sure `/etc/kmonad/` exists
- copy `./leopold_fc660c.kbd` into `/etc/kmonad/config.kbd`
- Install `kmonad-git` from the AUR. Would be nice to use `kmonad-bin` instead
  so that I don't pull a lot of haskell nonsense into my OS, but for now
  kmonad-git is fine
- change /etc/kmonad/config.kbd to reflect my current keyboard's `/dev/input`
  file is. I wish it was easier to identify, here are some guidelines:
    - `ls -l /dev/input/by-id` is easier than `/dev/input/by-path`
    - Obviously, failing to find it by id, try path
    - Nothing? then try just by going `/dev/input`. Files should be in the form
      `eventX`, where `X` is an integer
- Run kmonad with init system: `systemctl start kmonad.service`. In the repos
  there's also a version that uses runit if I ever decide to go back to that
  mess
