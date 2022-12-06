#!/bin/bash

COMMAND_PREFIX="docker-compose -f "
COMMAND_POSTFIX=" up -d --build --remove-orphans --always-recreate-deps"
START_SCRIPT_NAME="start.sh"
GENERATOR_STARTS="Generating start script..."

echo '#!/bin/bash' > $START_SCRIPT_NAME

read -r -p "Do you want to select the services which need to be generated? [y/N] " response

case "$response" in
    [yY][eE][sS]|[yY])

        window=""

        for directory in */ ; do
            # Replace slashes in the end of the directory name
            d=${directory//\//}
            window="${window} ${d} service on "
        done

        eval list=($(whiptail --checklist "Please pick one" 30 50 25 ${window} 3>&1 1>&2 2>&3))

        # Debug
        #for choice in "${list[@]}"; do
        #    echo "Add $choice service to the start script."
        #done

        echo $GENERATOR_STARTS

        if [ ! -z "$list" ]; then

            listLength=${#list[@]}
            for (( i=0; i<${listLength}; i++ ));
            do
                path="${PWD}/${list[$i]}"

                echo -n "$COMMAND_PREFIX" >> $START_SCRIPT_NAME
                echo -n "$path" >> $START_SCRIPT_NAME

                if test -f ${path}"/docker-compose.yml"; then
                    echo -n "/docker-compose.yml" >> $START_SCRIPT_NAME
                fi
                if test -f ${path}"/docker-compose.yaml"; then
                    echo -n "/docker-compose.yaml" >> $START_SCRIPT_NAME
                fi

                echo -e "$COMMAND_POSTFIX"  >> $START_SCRIPT_NAME
            done;
        else
            echo 'Warning! Empty script was generated!'
            echo 'echo "Nothing to start."' >> $START_SCRIPT_NAME
        fi

        ;;
    *)
        echo $GENERATOR_STARTS
        for f in $(pwd)/**/docker-compose.y*ml ; do

            echo -n "$COMMAND_PREFIX"  >> $START_SCRIPT_NAME
            echo -n $f >> $START_SCRIPT_NAME
            echo "$COMMAND_POSTFIX" >> $START_SCRIPT_NAME

        done;

        ;;
esac

chmod +x $START_SCRIPT_NAME
echo "Done"