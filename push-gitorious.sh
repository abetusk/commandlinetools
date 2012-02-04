#!/bin/sh
# taken from http://stackoverflow.com/questions/3496037/how-to-specify-which-ssh-key-to-use-within-git-for-git-push-in-order-to-have-git
#
# to run:
# path/to/push-gitorious.sh run


if [ "run" != "$1" ]; then
  exec ssh -i "$GITORIOUS_IDENTITY_FILE" -o "StrictHostKeyChecking no" "$@"
fi

remote='git@github.com:abetusk/commandlinetools.git'

echo "Mirroring to $remote"

export GITORIOUS_IDENTITY_FILE="`mktemp /tmp/tmp.XXXXXXXXXX`"
export GIT_SSH="$0"

cat >"$GITORIOUS_IDENTITY_FILE" <<EOF
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-128-CBC,9842457EAFFFBADFD8FB6B68D2E760B2

wtC13uLbOMml9jTgMnwxc0yqbi+6t3c92uWxMK2JzdA6W8w5tXnddtfNnYYWX+DY
VX3jwuAYyyldSkpgEoYDSZrF8RBZvgUZ6Y/Td+1eiBAGWzYW4n6KpvmUwDBoaGLN
ImV6TAS1jPIybHBHDnznoyJeLY6CHlM80uYxfoyhNxKCuooPhZ0fV8ny9xPK3pCE
q4oCcgzOLOioCdV5kNMzd7KTspS5d4XMYOO60SaIGdQZybmGrATnY62x1PCvaGWD
iT6a+SdVyNhHfXTIAMZGNhaJQ03Dtj+UNcVgGUr1yy2x8rJaqWnJE7gGmRN20Gfv
FT+6sV/bLGW4RoQAtWurXImmI6KBqWLL3WezID2I9Xwy5l9bPWc5VhX2KjyTvtqH
BZI25zfrx8UKjlB7xbCM8XR9XtZ4eDUK64K6J2nJj7QgBhHT8z4IqWR6S/BA9uxz
JDPEV9WK+E/MHnniPdRyep7qH6qG3VbI3OjFHNpPtvbNN+JaRvT9+bBzN1D9iuiX
ScB5n0fy6B/8XMHnXscMKhbMIEIwyFoAWyqlywQeHPAn029yNWK995hk41W2Yolo
PQ4etnvb/yuOhUpZhYEamCn2P7ApjxbhBO+/zfiiCXj8P74iQ30BkN/XJVt7pk99
mnRcAZoweoXwCedoHp6mFsiMUgyA/e2lK621uhLZxIDx8hLGheZWSIslFniRjw+0
dNZyoIoGYybzI4UJ8tw5dfP2qi0KZufFYbyimNNv3tVFoDpShijnxJpI6KQ+IeO7
KJNozVPbniNBEkw8JC0EN1CiuqdW2TZ1vyvfsj8s7EH0+IFNhcEPGMxbJzV8M9N5
Kk3Oznt5jks3HC5NGOC92i6e4DNa+JeYflLjs3k5fsuRTJ/i2dPBKKtP2nqguOTv
RJBf4YlQQZwsYInHThRCiEpGgkCz6oZboGcX/RV7sMupaESOsNvla4/bfat4uomc
xLGS8D+BMNHr0m9AZWLmmszpsYJlz/gZlr/uKfVncRdniuRVMlUkyPFR3NurFJr+
SP88MjXaaRGpHpxRjNbcGKDnHvliaFrIxEbdMQHfnTscC2qJaLQd9vyHu/UlFyOp
8QGS0C9okg+nh2CpJAxh5sQelfN/9OcNlggTIkUOPlqLaG+Fm6aiLc2e0+oCsi2A
RTYPorykiHd7KAwJTfp19sV8Y6GYLNuOd5sgeigcPbz8yPbc317sjDjyA2TCaT/X
TpyKEEwYHFyfO+PAp/Y6uA7dCXJED5aFvqat+BgvVFvudx5v2gU6KHYSEXAwiR2E
qOeg532m7vum2afO97UPZole0NWgL7WUdxd2Sq/xZkSHL5XPpeyyqEEwADpiRKuh
hKkX0QXEf7jBSBF7uPimJErpvlVkE1wi6cOJz9QdDx96o/ChdSoTDAMnTO8fABnn
SR1S2B3h/AjTPJvIInq8JVInkh0zfXCpTGxkKrxRu/0Li400P/aO4ercyveuKmoo
GycjtL/DBUoPH62RzffKZa0D8DUjYUin4KoZZ++aL0j7wkYVAC5PBFTazEKs0iZ0
2kSWBpVGG10KK7Piopxkkh8LRpRlUYIgDQl7H5AwQQ0SAUHM6fTU93R43lvZBXaT
-----END RSA PRIVATE KEY-----


EOF
cat >"$GITORIOUS_IDENTITY_FILE.pub" <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDh89fr9T5wN9ZNX15c/7WgM6fz8UM0aefFcBv6cHNl0w8NigfHwstcxyyJu+BKNylrNYJF2Der65n73JTpiQdQ0D1hYtXfBAGcD7CljdNVGCz0lAtLtSyH56IwjuND7hGp/R4g2d2FAyPsmgPG3ykTRK/lxjsF7vxGRYtJdRp/vmqxkTlfijEaVl4N9iUioEDl7G5xK2x0Lwd54m3OIQnFixYlxqlEtTgDQ3n3nO8XzoGCp6SaeTHP9EFX+dPzhrugEcx+7pPrggTCVfOrL6jCAyjlUGNjCU8Iwj0Bfpbv4nQMmvfecsBszD6+On+i749OwmuQsuIzdHlbrQ0XMuH1 abram.conelly@gmail.com

EOF

#echo git push --mirror "$remote"
git push --mirror "$remote"

rm -f "$GITORIOUS_IDENTITY_FILE"
rm -f "$GITORIOUS_IDENTITY_FILE.pub"

exit 0
