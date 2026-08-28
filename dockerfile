FROM ros:jazzy-ros-base

# Install system dependencies, usbmuxd, I2C tools, and ROS 2 image processing libraries
RUN apt-get update && apt-get install -y \
    libprotobuf-dev \
    protobuf-compiler \
    libusbmuxd-dev \
    usbmuxd \
    python3-smbus \
    i2c-tools \
    python3-numpy \
    python3-pip \
    ros-jazzy-cv-bridge \
    && rm -rf /var/lib/apt/lists/*

# Set default working directory
WORKDIR /root/workspace

# Change shell type
SHELL ["/bin/bash", "-c"]

# Source ROS 2 setup scripts in bash configuration
RUN echo "source /opt/ros/jazzy/setup.bash" >> /root/.bashrc && \
    echo 'if [ -f /root/workspace/install/setup.bash ]; then source /root/workspace/install/setup.bash; fi' >> /root/.bashrc
