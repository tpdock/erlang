#!/bin/bash

versions=(R14B R14B03 R14B04 R15B R15B01 R15B02 R15B03 R16B R16B01 R16B02 R16B03 R16B03-1 17.0 17.1 17.3 17.4 17.5 18.0 18.1 18.2 18.2.1 18.3 19.0)
for v in "${versions[@]}"
do
    echo "source /usr/lib/erlang/$v/activate" > /usr/bin/erlang-$v -s; chmod +x /usr/bin/erlang-$v
done
