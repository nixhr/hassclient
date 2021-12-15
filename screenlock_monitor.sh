#!/bin/bash
dbus-monitor --session "type=signal,interface=org.gnome.SessionManager.Presence,member=StatusChanged" | \

( while true
    do read X
    echo $X
    if echo $X | grep "uint32 3" &> /dev/null; then
      ./set_ha_entity_state.sh x270_screenlock LOCKED
    elif echo $X | grep "uint32 0" &> /dev/null; then
      ./set_ha_entity_state.sh x270_screenlock UNLOCKED
    fi
    done )
