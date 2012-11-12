name "base"
description "Baseline configuration for all nodes"

run_list(
    "recipe[ohai]",
    "recipe[git]",
    "recipe[users::sysadmins]",
    "recipe[vim]",
    "recipe[sudo]",
    "recipe[ntp]",
    "recipe[resolver]",
    "recipe[build-essential]",
    "recipe[ruby]",
    "recipe[man]",
    "recipe[openssh]",
    "recipe[rsync]",
    "recipe[apt]"
)

default_attributes(
    "authorization" => {
        "sudo" => {
            "groups" => [ "admin", "wheel" ],
            "users" => [ "dezelin" ],
            "passwordless" => [ "dezelin" ]
        }
    },
    "resolver" => {
        "nameservers" => [ "8.8.8.8", "8.8.4.4" ]
    },
    "ntp" => {
        "servers" => [ "ntp.ubuntu.com" ]
    }
)
