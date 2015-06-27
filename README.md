# docker-pebble-dev

Docker image containing the [pebble watch](https://getpebble.com/) [development SDK](http://developer.getpebble.com/sdk/install/linux/).

```
docker pull andredumas/pebble-dev
```

## Usage

Standard usage, assuming you are running from the root of your project:

```
docker run --rm -it -v $PWD:/pebble pebble-dev <pebble command arguments>
```

Or drop the `pebble` shell script in the root of your project or PATH.

For Pebble SDK 2.8.1 development I was using the below `Makefile` configured with [Eclipse](https://eclipse.org/downloads/) 
Luna [C/C++](http://www.eclipse.org/downloads/packages/eclipse-ide-cc-developers/marsr). 

```
all:
	./pebble build

install:        all
	./pebble install --pebble_id `cat $(HOME)/.pebble-btid`
	./pebble logs

clean:
	./pebble clean
```

The following run profiles were also used:

```
./pebble install --phone 192.168.1.20
```

And:

```
./pebble logs --phone 192.168.1.20
```

## Notes

When running as pebble executable with a mounted volume, any files created by the container will be on the host owned 
as `root`.   