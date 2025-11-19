

cd libs
HOME=$(pwd)
echo $HOME
# echo "INSTALL GNU M4"
# wget https://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.gz
# tar -xvzf m4-1.4.17.tar.gz
# cd m4-1.4.17
# echo "CONFIGURING PREFIX"
# ./configure --prefix=$HOME/m4-1.4.17
# echo "MAKE"
# make
# echo "MAKE INSTALL"
# make install 
# rm -rf ../m4-1.4.17.tar.gz

# echo "UPDATE"
# sudo apt-get update
# sudo apt-get upgrade

# echo "INSTALL autoconf"
# sudo apt-get install autoconf -y

# echo "INSTALL automake"
# sudo apt-get install automake -y

# echo "INSTALL libtool"
# sudo apt-get install libtool-bin -y

# echo "INSTALL GNU32 flex"
# sudo apt-get install flex -y

# echo "INSTALL hwloc"
# HWLOC="$HOME/hwloc-2.12.2"
# cd libs
# wget https://download.open-mpi.org/release/hwloc/v2.12/hwloc-2.12.2.tar.gz
# tar -xvzf hwloc-2.12.2.tar.gz
# cd hwloc-2.12.2
# echo "CONFIGURING PREFIX"
# ./configure --prefix=$HWLOC/install
# export PATH=$PATH:$HWLOC/install/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HWLOC/install/lib
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HWLOC/install/lib/pkgconfig
# export MANPATH=$MANPATH:$HWLOC/install/share/ma
# echo "MAKE"
# make
# echo "MAKE INSTALL"
# make install 
# rm -rf $HOME/hwloc-2.12.2.tar.gz

# echo "INSTALL libevent"
# sudo apt-get install libevent-dev -y

# echo "INSTALL zlib"

# sudo apt-get install zlib1g zlib1g-dev -y
# sudo apt install pkg-config
# pkg-config --modversion zlib

## OU 

# ZLIB="$HOME/zlib-1.3.1"
# cd libs
# wget https://github.com/madler/zlib/archive/refs/tags/v1.3.1.tar.gz
# tar -xvzf v1.3.1.tar.gz
# cd zlib-1.3.1
# echo "CONFIGURING PREFIX"
# ./configure --prefix=$ZLIB
# export PATH=$PATH:$ZLIB/install/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ZLIB/install/lib
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$ZLIB/install/lib/pkgconfig
# export MANPATH=$MANPATH:$ZLIB/install/share/ma
# echo "MAKE"
# make
# echo "MAKE INSTALL"
# make install 
# rm -rf $HOME/v1.3.1.tar.gz
# echo "$ZLIB/lib" | sudo tee /etc/ld.so.conf.d/zlib.conf
# sudo ldconfig
# ls -la $ZLIB/lib/
# export PKG_CONFIG_PATH=$ZLIB/lib/pkgconfig:$PKG_CONFIG_PATH
# echo "export PKG_CONFIG_PATH=$ZLIB/lib/pkgconfig:$PKG_CONFIG_PATH" >> ~/.bashrc
# source ~/.bashrc
# echo $PKG_CONFIG_PATH

# echo "INSTALL Cython"
# sudo apt-get install python-full -y
# sudo apt-get install build-essential python3-dev -y
# sudo pip install Cython --break-system-packages

# echo "INSTALL libfrabric" 
# sudo apt-get install libfabric-dev -y