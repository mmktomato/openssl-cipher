# openssl-cipher
Encrypt and decrypt files with openssl.

## Usage

### Encrypt
```bash
# Enter password interactively.
$ docker run --rm -it -v $PWD:/tmp mmktomato/openssl-cipher -e <in_file> <out_file>

# Password via command line.
$ docker run --rm -v $PWD:/tmp mmktomato/openssl-cipher -e -p <password> <in_file> <out_file>
```

### Decrypt
```bash
# Enter password interactively.
$ docker run --rm -it -v $PWD:/tmp mmktomato/openssl-cipher -d <in_file> <out_file>

# Password via command line.
$ docker run --rm -v $PWD:/tmp mmktomato/openssl-cipher -d -p <password> <in_file> <out_file>
```

### Other
```bash
# Show help
$ docker run --rm mmktomato/openssl-cipher -h

# Show version
$ docker run --rm mmktomato/openssl-cipher -v

# Show available cipher commands
# Note: currently only `aes-256-cbc` is supported.
$ docker run --rm mmktomato/openssl-cipher -l
```
