
# GTSAM - Example Project

## Prerequisites
- **eigen**
  - v3.4.0 - Will be Fetched by this project
- **gtsam**
  - ``` git clone https://github.com/borglab/gtsam.git ```
  - ``` cmake -B target -S .  -DGTSAM_BUILD_PYTHON=1 -DGTSAM_PYTHON_VERSION=3.10.12 -DGTSAM_WITH_TBB=OFF  -DGTSAM_USE_SYSTEM_EIGEN=ON ```
  - ```cd target/```
  - ```make -j`nproc```
  - ```make python install```
  - ```sudo make install```
  - ```export LD_LIBRARY_PATH=/usr/local/lib/```
