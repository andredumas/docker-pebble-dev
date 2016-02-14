# Supported tags and respective `Dockerfile` links

* [`2.8.1` (*2.8.1/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/2.8.1/Dockerfile)
  * **Note:** No entrypoint is defined for this image, the command `pebble` needs to be passed in addition to other arguments.
* [`3.0` (*3.0/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.0/Dockerfile)
* [`3.2` (*3.2/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.2/Dockerfile)
* [`3.4` (*3.4/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.4/Dockerfile)
* [`3.6` (*3.6/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.6/Dockerfile)
* [`3.6.2` (*3.6.2/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.6.2/Dockerfile)
* [`3.7` (*3.7/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.7/Dockerfile)
* [`3.9.2` (*3.9.2/Dockerfile*)](https://github.com/andredumas/docker-pebble-dev/blob/3.9.2/Dockerfile)

# What is Pebble?

> [Pebble Smartwatch](https://getpebble.com/) is a customizable watch that conveniently and subtly delivers the information that you want directly to your wrist. Pebble connects to your iOS or Android smartphone via Bluetooth and has a rechargeable battery that lasts up to 7 days per charge.

* https://getpebble.com
* https://en.wikipedia.org/wiki/Pebble_watch

# What's in this image?

The Pebble [Development SDK](https://developer.pebble.com/sdk/install/linux/) installed and ready to use.

https://developer.pebble.com/sdk/

# How to use this image

```
docker pull andredumas/pebble-dev
```

Standard usage, assuming you are running from the root of your project, is to use it to execute pebble commands:

```
docker run --rm -it -v $PWD:/pebble andredumas/pebble-dev <pebble command arguments>
```

Or drop the `pebble` shell script in the root of your project or PATH.

For development I was using the `Makefile` below configured with [Eclipse](https://eclipse.org/downloads/)
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

## Building

```
docker build -t andredumas/pebble-dev:$VERSION .
```

## Verify

Verifies that the image is working correctly by creating and building a new Pebble test project:

```
# Second argument is the image name
./verify-image.sh andredumas/pebble-dev:$VERSION
```

# License

By using this image you accept the [Pebble Terms of Use](https://developer.getpebble.com/legal/terms-of-use) and the [Pebble Developer License](https://developer.getpebble.com/legal/sdk-license).
