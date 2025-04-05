set pagination off

set $merge_updated=78

define hook-quit
    set confirm off
end

b arp_init
    commands 1
    continue&
end

b arp.c:$merge_updated
    commands 2
    print merge
    quit $
end

ignore 2 1
run
shell arping -c2 -I tap0 10.0.0.4