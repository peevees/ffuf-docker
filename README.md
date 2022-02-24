# ffuf-docker
Oneliner to run ffuf scan against target URL using a good wordlist

## Running
```
docker run --rm -v ./reports:/var/reports ghcr.io/peevees/ffuf-docker:master https://example.org
```

Example targets:
* https://ffuf.io.fi
* https://example.org

## Building
```
git clone git@github.com:peevees/ffuf-docker.git
cd ffuf-docker
docker build -t peevees/ffuf-docker:latest .
docker run --rm -v $(pwd)/reports:/var/reports peevees/ffuf-docker:latest https://example.org
# to run only for a specified amount of seconds ex 30
docker run --rm -v $(pwd)/reports:/var/reports peevees/ffuf-docker:latest https://example.org 30
```

## Outputs
Outputs will be saved in ./reports

| Report               | Description                                             |
|----------------------|---------------------------------------------------------|
| ffuf_scan.csv        | Full ffuf report in csv                                 |
| fuff.json            | JSON report for with Generic JSON warnings              |
