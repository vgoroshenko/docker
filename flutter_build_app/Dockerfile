FROM openjdk:8
ENV ng2Version=NG2_VERSION
ENV buildNumber=BUILD_NUMBER
ENV branchName=BRANCH

RUN apt update
RUN apt install -y git curl unzip lib32stdc++6
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/user/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

#Installing Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/user/Android/sdk/platform-tools"

#Installing Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/user/flutter/bin"

# Run basic check to download Dark SDK
#RUN flutter doctor

USER root

# Copy the app files to the container
COPY . /usr/local/bin/app

# Set the working directory to the app files within the container
WORKDIR /usr/local/bin/app

# Get App Dependencies
RUN flutter pub get

# Build the app
RUN flutter build apk

