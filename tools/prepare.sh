#!/bin/bash

versions=(17.4 17.5 18.0)
for v in "${versions[@]}"
do
    #echo "alias erlang-$v='source /usr/lib/erlang/$v/activate'" >> /root/.bash_aliases
    echo "source /usr/lib/erlang/$v/activate" > /usr/bin/erlang-$v -s; chmod +x /usr/bin/erlang-$v
done
