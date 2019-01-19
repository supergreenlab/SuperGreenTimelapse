#!/bin/bash

# Copyright (C) 2018  SuperGreenLab <towelie@supergreenlab.com>
# Author: Constantin Clauzel <constantin.clauzel@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o latest-linux latest.go
CGO_ENABLED=0 GOOS=windows go build -a -installsuffix cgo -o latest latest.go
CGO_ENABLED=0 GOOS=darwin go build -a -installsuffix cgo -o latest-osx latest.go
docker build -t supergreenlab/supergreenlive .
