# launchpad-image
A utility to easily obtain a desired version of launchpad for the OS and platform you are running on.  Supported on linux/arm64 and linux/x86_64 platforms.

## Instructions for use
Using launchpad-image is easy!
1. Set the LAUNCHPAD_VERSION variable to the version you desire:
```
export LAUNCHPAD_VERSION="1.5.12"
```
2. Run the following command to pull the current image and copy launchpad to /usr/local/bin:
```
docker pull msr.ci.mirantis.com/twizda/launchpad:latest && \
    ID=$(docker create msr.ci.mirantis.com/twizda/launchpad:latest) && \
    sudo docker cp ${ID}:/usr/local/launchpad/${LAUNCHPAD_VERSION}/launchpad-$(uname -s)-$(uname -m) /usr/local/bin/launchpad && \
    docker rm ${ID} >/dev/null
```

*NOTE*: If you try to run the container, it will show the usage output:
```
[twizda@mkex-3 launchpad-image]$ docker container run -it --rm msr.ci.mirantis.com/twizda/launchpad:latest
Unable to find image 'msr.ci.mirantis.com/twizda/launchpad:latest' locally
20240228: Pulling from twizda/launchpad
dcccee43ad5d: Pull complete
7da59b2053a0: Pull complete
ff9a6924b247: Pull complete
d32d73cfa661: Pull complete
Digest: sha256:c708cd6822f1f25986a11562c3823d9a2281eee9258da6ffeef10c498231df3c
Status: Downloaded newer image for msr.ci.mirantis.com/twizda/launchpad:latest
*******************************************************************************
* To obtain the launchpad version you want,                                   *
* run the following command:                                                  *
*******************************************************************************

Launchpad versions in this container:
1.4.0
1.4.1
1.5.0
1.5.1
1.5.2
1.5.3
1.5.4
1.5.6-alpha1
1.5.6-alpha2
1.5.6-alpha3
1.5.6
1.5.7
1.5.8
1.5.9-beta1
1.5.9-beta2
1.5.10-rc1
1.5.10-rc2
1.5.10
1.5.11
1.5.12-557-PRODENG-2780
1.5.12-rc1
1.5.12-rc2
1.5.12-rc3
1.5.12-PRODENG-2962
1.5.12-rc4
1.5.12
1.5.13-tp1
1.5.13-rc1
1.5.13-tp2
1.5.13-rc2
```

Export the LAUNCHPAD_VERSION accordingly, for example:
```
  export LAUNCHPAD_VERSION="1.5.12"
```

Then run:
```
  docker pull msr.ci.mirantis.com/twizda/launchpad:latest && \
    ID=$(docker create msr.ci.mirantis.com/twizda/launchpad:latest) && \
    sudo docker cp ${ID}:/usr/local/launchpad/${LAUNCHPAD_VERSION}/launchpad-$(uname -s)-$(uname -m) /usr/local/bin/launchpad && \
    docker rm ${ID} >/dev/null
```
For Windows on Intel/AMD:
```
$LAUNCHPAD_VERSION = "1.5.12"
docker pull msr.ci.mirantis.com/twizda/launchpad:latest ;
    $id=$(docker create msr.ci.mirantis.com/twizda/launchpad:latest) ;
    docker cp $id:/usr/local/launchpad/$LAUNCHPAD_VERSION/launchpad-Windows-x86_64 launchpad.exe ;
    (docker rm $id | out-null)
```

Enjoy!
