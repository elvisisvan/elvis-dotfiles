download fedora base package:
```bash
wget https://mirror.23m.com/fedora/linux/releases/39/Container/aarch64/images/Fedora-Container-Base-39-1.5.aarch64.tar.xz
```
extract and copy sha256 code from base package:
```
sha256sum Fedora-Container-Base-39-1.5.aarch64.tar.xz
```
navigate to distros list folder:
```bash
cd ~/../usr/etc/proot-distro
```
copy (duplicate) distro index template:
```
cp fedora.sh fedora39.sh
```
modify TARBALL_URL and TARBALL_SHA256 variables (aarch64):
```
TARBALL_URL['aarch64']="https://mirror.23m.com/fedora/linux/releases/39/Container/aarch64/images/Fedora-Container-Base-39-1.5.aarch64.tar.xz"
TARBALL_SHA256['aarch64']="insert copied sha256 hash code"
```
installation:
```
proot-distro install fedora39
```
navigate to installed folder:
```
cd ~/../usr/var/lib/proot-distro/installed-rootfs/fedora39
```
erase contents:
```
rm -rf .
```
navigate to dlcache folder and extract layer.tar archive file:
```
cd ../dlcache
tar xf Fedora-Container-Base-39-1.5.aarch64.tar.xz --strip-components=1 --exclude json --exclude VERSION
```
extract layer.tar to fedora39:
```
tar xf layer.tar -C ../installed-rootfs/fedora39
```
 login:
```
 proot-distro login fedora39
```
add dns resolver:
```
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
```
add regular user:
```
useradd elvis
passwd elvis
```
 add regular user to wheel group:
```
 usermod -aG wheel elvis
```
 change sudo ownership & execution policy:
```
 chown root:root /usr/bin/sudo
 chmod 4755 /usr/bin/sudo
```
assign regular user as sudoer:
```
nano /etc/sudoers
```
```
...
root    ALL=(ALL)    ALL
elvis   ALL=(ALL)    ALL
...
```
login as regular user:
```
su elvis
```
install kde plasma desktop environment:
```
sudo dnf install @kde-desktop
```
install vncserver:
```
sudo dnf install tigervnc
```
