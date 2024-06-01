#!/bin/sh

contains() {  if    [ "$1" ] &&            # Is there a source string.
                    [ "$2" ] &&            # Is there a substring.
                    [ -z "${1##*"$2"*}" ]; # Test substring in source.
              then  echo 0;                # Print a "0" for a match.
              else  echo 1;                # Print a "1" if no match.
              fi;
            }

contains "$1" "$2"