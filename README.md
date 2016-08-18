The collection of all Erlang OTP releases in one image

The image is based on Ubuntu trusty:  https://hub.docker.com/_/ubuntu/

[Source: https://github.com/tpdock/erlang.git ](https://github.com/tpdock/erlang.git)

```
R14B
R14B03
R14B04

R15B
R15B01
R15B02
R15B03

R16B
R16B01
R16B02
R16B03
R16B03-1

17.0
17.1
17.3
17.4
17.5

18.0
18.1
18.2
18.2.1
18.3

19.0
```


Default is OTP 19.0 version active. To activate other versions just type:


```$ . erlang-{$VERSION}```

For example: ```$ . erlang-R15B03```

Usage:

```$ docker run -itd --name erlang tpdock/erlang:latest```
