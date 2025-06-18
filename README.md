My 3rd Party Packages for Solus 
=============================

This repo contains the build files required to create some 3rd-party eopkg packages.

For more information about 3rd party applications in Solus, visit our Help Center page at https://help.getsol.us/docs/user/software/third-party/.

## Installing Packages (easy method)

Head over to the [releases page](https://github.com/msork/my-3rdparty-solus/releases) and download the latest release for your favourite app, then install it using the following command, replacing <package_name> with the name of the file you downloaded:
```
sudo eopkg it ./<package_name>.eopkg
```

## Installing Packages manually (harder method)

A script to install the each package manually is included in the `scripts` folder of this repository under `/scripts/update-<package_name>-solus.sh`

Enjoy!
