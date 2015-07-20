#!/bin/bash

versions=(R14B03 R14B04 R14B R15B01 R15B02 R15B03 R15B R16B01 R16B02 R16B03 R16B 17.0 17.1 17.3 17.4 17.5 18.0)
for v in "${versions[@]}"
do
    echo "alias erlang-$v='source /usr/lib/erlang/$v/activate'" >> /root/.bash_aliases
done
