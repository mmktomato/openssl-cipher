#!/bin/sh

set -eu

show_usage() {
    echo 'Usage: [-h|-e|-d|-l] [input_file] [output_file]'
    echo
    echo '-h) shows this usage.'
    echo '-l) shows cipher commands.'
    echo '-e) encrypts [input_file] and writes to [output_file].'
    echo '-d) decrypts [input_file] and writes to [output_file].'
}

mode=

while getopts hled OPT
do
    case $OPT in
        h)
            show_usage
            exit
            ;;
        l)
            openssl list-cipher-commands
            exit
            ;;
        e)
            mode=encrypt
            ;;
        d)
            mode=decrypt
            ;;
        \?)
            show_usage
            exit
            ;;
    esac
done
shift $((OPTIND - 1))

in=${1:-''}
out=${2:-''}
cipher_opt=-aes-256-cbc

check_args_for_enc_and_dec() {
    if [ "$in" = "" -o "$out" = "" ]; then
        echo "input file and output file must be specified."
        return 1
    fi

    if [ ! -f $in ]; then
        echo "'$in' does not exist."
        return 1
    fi

    if [ -f $out ]; then
        echo "'$out' already exists."
        return 1
    fi

    return 0
}

case $mode in
    encrypt)
        check_args_for_enc_and_dec && openssl enc -e $cipher_opt -in $in -out $out
        ;;
    decrypt)
        check_args_for_enc_and_dec && openssl enc -d $cipher_opt -in $in -out $out
        ;;
    *)
        echo "mode must be specified."
        ;;
esac

