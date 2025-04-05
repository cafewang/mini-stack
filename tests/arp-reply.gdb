set pagination off

define hook-quit
    set confirm off
end

b arp_init
    commands 1
    continue&
end

b arp.c:arp_reply
    commands 2
    quit 1
end

run
shell arping -c1 -I tap0 10.0.0.5