<h4 align="center"> ESSW0000CF </h4>
<h3 align="center"> Linux Environment Configuration </h3>

> **Note**
> The content of this repository may change over time. We recommend that you review it carefully to confirm that it is suitable for your systems and conditions.

> **Important**
> The code is open source and you can use it as you like and check it on your system. All the tests that have been done are confirmed in the "TEST" section so you can know in advance on which systems it is compatible.

> **Important**
> The WAN module enabled in polybar by default shows your public IP on the screen. A function will be added later to hide it easily, but for now, keep it in mind when taking screenshots or sharing screenshots.
> The purpose of this module is to know where your traffic is going when you are connected through a VPN and that is why it is enabled by default. However, if you don't have a VPN, it can be dangerous to share that information.
> To disable it, just go to the file `~/.config/polybar/config.ini` and delete `wan` from line 49.

<h3 align="center"> Requirements </h3>

The following requirements are needed for a successful installation:

- One of the allowed systems
- Internet connection
- Sudo allowed user
- `git` installed on your system

<h3 align="center"> Installation </h3>

For installation, you can follow the instructions below:

```
bash
cd ~
mkdir rep
cd rep
git clone https://github.com/iv4n9f/essw0000cf
cd essw0000cf
chmod +x install.sh
./install.sh
```

Or use the one-liner:


```
cd ~ && mkdir rep && cd rep && git clone https://github.com/iv4n9f/essw0000cf && cd essw0000cf && chmod +x install.sh && ./install.sh
```