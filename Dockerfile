# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
#
# nginx-ssl-proxy
#
# VERSION   0.0.2

FROM nginx:1.10.0

MAINTAINER Evan Brown <evanbrown@google.com>
MAINTAINER Stijn Opheide <stijn@panenka76.com>

RUN rm /etc/nginx/conf.d/*.conf

RUN mkdir -p /etc/nginx/extra-conf.d

WORKDIR /usr/src

ADD start.sh /usr/src/
ADD nginx/nginx.conf /etc/nginx/
ADD nginx/proxy*.conf /usr/src/
ADD nginx/extra/*.conf /etc/nginx/extra-conf.d/
ADD nginx/health_check /usr/src/health_check

ENTRYPOINT ./start.sh
