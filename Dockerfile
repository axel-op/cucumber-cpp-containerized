FROM ubuntu:latest

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get --no-install-recommends -y install \
    # Basic
    git \
    # C++
    build-essential cmake cppcheck \
    # Required for Cucumber
    ruby-full libboost-all-dev qt5-default \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN gem update --system \
    && gem install cucumber

ENV CUCUMBER_CPP_DIR /usr/cucumber-cpp

RUN git clone --branch fix-boost-1.70.0-build https://github.com/homespring/cucumber-cpp ${CUCUMBER_CPP_DIR} \
    && cd ${CUCUMBER_CPP_DIR} \
    && git submodule init && git submodule update \
    && cmake -E make_directory build \
    && cmake -E chdir build cmake -DCUKE_ENABLE_EXAMPLES=on .. \
    && cmake --build build \
    && cmake --build build --target test \
    && cmake --build build --target install \
    && cmake --build build --target features

COPY . /workspace

WORKDIR /workspace

RUN cmake -E make_directory build \
    && cmake -E chdir build cmake .. \
    && cmake --build build

CMD ["bash", "start.sh"]