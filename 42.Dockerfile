FROM ubuntu:20.04

RUN apt update \
    && \
        # prevent wait input
        DEBIAN_FRONTEND=noninteractive \
        # prevent wait input (tzdata)
        TZ=Asia/Seoul \
        apt install -y \
            # basic
            git \
            # to install norminette, cpplint
            python3-pip \
            # build system
            clang-10 make \
            # debug
            valgrind gdb lldb \
            # C/C++ lint
            clang-tidy cppcheck flawfinder cppcheck \
            # SonarLint dependency
            openjdk-17-jdk \
            # ... more lint
            shellcheck \
            # etc
            doxygen \
    && \
        pip3 install \
            # 42
            norminette \
            # C/C++ lint
            cpplint lizard
