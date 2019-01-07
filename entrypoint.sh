#!/bin/sh

set -eu

mode=${1:-'-h'}
in=${2:-''}
out=${3:-''}

cipher_opt=-aes-256-cbc

show_usage() {
    echo 'Usage: [-h|-e|-d|-l] [input_file] [output_file]'
    echo
    echo '-h) shows this usage.'
    echo '-l) shows cipher commands.'
    echo '-e) encrypts [input_file] and writes to [output_file].'
    echo '-d) decrypts [input_file] and writes to [output_file].'
}

check_args_for_enc_and_dec() {
    if [ ! -f $in ]; then
        echo "$in does not exist."
        return 1
    fi

    if [ -f $out ]; then
        echo "$out already exists."
        return 1
    fi

    return 0
}

case $mode in
    -h)
        show_usage
        ;;
    -l)
        openssl list-cipher-commands
        ;;
    -e)
        check_args_for_enc_and_dec && openssl enc -e $cipher_opt -in $in -out $out
        ;;
    -d)
        check_args_for_enc_and_dec && openssl enc -d $cipher_opt -in $in -out $out
        ;;
    *)
        show_usage
        ;;
esac

