ARG TAG=humble
FROM ghcr.io/ros-industrial-consortium/scan_n_plan_workshop${TAG}

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractivej

USER root

# Run apt update and install useful utilities like sudo
RUN apt update -y -qq && apt install -y -qq sudo python3-pip

# Install pyquaternion
RUN python3 -m pip install pyquaternion

# Bind mount the source directory so as not to unnecessarily copy source code into the docker image
ARG WORKSPACE_DIR=/opt/pick_and_place
RUN --mount=type=bind,target=${WORKSPACE_DIR}/src/pick_and_place \
  apt update -y -qq \
  && source /opt/snp/install/setup.bash \
  && rosdep install \
    --from-paths ${WORKSPACE_DIR}/src \
    -iry

# Build the repository
# Bind mount the source directory so as not to unnecessarily copy source code into the docker image
RUN --mount=type=bind,target=${WORKSPACE_DIR}/src/pick_and_place \
  source /opt/snp/install/setup.bash \
  && cd ${WORKSPACE_DIR} \ 
  && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release \
  && rm -rf build log

COPY --chmod=755 docker/launch_pick_and_place.sh /opt/launch_pick_and_place.sh
ENTRYPOINT ["/opt/launch_pick_and_place.sh"]
