
# GTSAM - Example Project

## Prerequisites
- **eigen**
  - v3.4.0 - Will be Fetched by this project
- **gtsam**

``` bash
    git clone https://github.com/borglab/gtsam.git
    cmake -B target -S .  -DGTSAM_BUILD_PYTHON=1 -DGTSAM_PYTHON_VERSION=3.10.12 -DGTSAM_WITH_TBB=OFF -DGTSAM_USE_SYSTEM_EIGEN=ON
    cd target/
    make -j`nproc`
    make python install
    sudo make install
    export LD_LIBRARY_PATH=/usr/local/lib/
```

## Notes

Getting this simple project to compile with **gtsam** was a bit more involved than I had anticipated.  
After thinking I had done everything correctly I would continue to get issues with **eigen** not being compatible with what gtsam was compiled with.   The make flag ```-DGTSAM_USE_SYSTEM_EIGEN=ON ``` fixed this issue but I still had some problems using a standard cmake module for eigen and ended up using a different cmake feature ```ExternalProject_Add(...)``` instead.  I may need to revisit this as this "workaround" stores eigen headers to the **include** folder which has some unfortunate side effects (git etc).

The project scaffolding itself was generated with 
```
cargo newccp <project name>
```
It was actually quite handy :D


## Build / Run

``` bash
cmake -B target -S .
cd target/ && make -j`nproc` && ./gtsam-example 
```

## Going Forward

I clearly have a lot to learn but I would like to be able to use GTSam in collaboration with the OpenCV [feature detector](https://github.com/sjbeskur/featuresdetect) to estimate the relative poses (transformations) between camera frames. GTSAM can help optimize these poses while considering noise and uncertainties.

Then figure out the GTSam bundle adjustment stuff?
