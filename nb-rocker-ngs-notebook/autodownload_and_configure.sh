#!/usr/bin/with-contenv bash

USER=rstudio
HOME_DIR=/home/rstudio/

if [ ! -z "$INSTANCE_ID" ]; then
    echo "Changing the default password"
    echo "$USER:$INSTANCE_ID" | chpasswd
fi

if [ ! -z "$AUTODOWNLOAD_URL" ]; then
    if [ ! -z "$AUTODOWNLOAD_FILENAME" ]; then
        echo "Downloading $AUTODOWNLOAD_URL to $AUTODOWNLOAD_FILENAME"
        su "$USER" -c "cd '$HOME_DIR' && wget '$AUTODOWNLOAD_URL' -O '$AUTODOWNLOAD_FILENAME'"
    else
        echo "Downloading $AUTODOWNLOAD_URL"
        su "$USER" -c "cd '$HOME_DIR' && wget '$AUTODOWNLOAD_URL'"
    fi
    # execution if desired
    if [ ! -z "$AUTODOWNLOAD_EXEC" ]; then
        cd $HOME_DIR
        chmod u+x $AUTODOWNLOAD_EXEC
        ./$AUTODOWNLOAD_EXEC
    fi
    # background execution if desired
    if [ ! -z "$AUTODOWNLOAD_EXEC_BG" ]; then
        cd $HOME_DIR
        chmod u+x $AUTODOWNLOAD_EXEC_BG
        ./$AUTODOWNLOAD_EXEC_BG &
    fi
fi

