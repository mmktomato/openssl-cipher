# openssl-cipher
Encrypt and decrypt files with openssl.

## Usage

```bash
# Encrypt
$ docker run --rm -it -v $PWD:/tmp mmktomato/openssl-cipher -e <in_file> <out_file>

# Decrypt
$ docker run --rm -it -v $PWD:/tmp mmktomato/openssl-cipher -d <in_file> <out_file>

# Show help
$ docker run --rm mmktomato/openssl-cipher -h

# Show available cipher commands
# Note: currently only `aes-256-cbc` is supported.
$ docker run --rm mmktomato/openssl-cipher -l
```
