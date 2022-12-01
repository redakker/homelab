#!/bin/bash

echo '#!/bin/bash' > start.sh
#echo 'docker-compose \' >> start.sh

for f in $(pwd)/**/docker-compose.y*ml ; do

    echo 'docker-compose -f '$f' up -d --build --remove-orphans --always-recreate-deps' >> start.sh

done;

#echo ' up --build --remove-orphans --always-recreate-deps' >> start.sh

chmod +x start.sh