#!/bin/bash

echo '#!/bin/bash' > start.sh
echo 'docker-compose \' >> start.sh

for f in ./**/docker-compose.y*ml ; do

    echo '-f '$f' \' >> start.sh

done;

echo ' up --build --remove-orphans --always-recreate-deps' >> start.sh

chmod +x start.sh