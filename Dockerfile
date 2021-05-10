FROM nickblah/lua:5-luarocks-alpine

RUN apk update
RUN apk add git

WORKDIR /usr/src/app

COPY . .

RUN luarocks build

ENTRYPOINT ["lua", "main.lua"]