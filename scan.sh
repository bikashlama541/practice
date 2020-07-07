#!/bin/bash
image_name=$1

scan()
{
 docker-compose exec engine-api anchore-cli image add $image_name
 docker-compose exec engine-api anchore-cli image wait $image_name
 docker-compose exec engine-api anchore-cli image content $image_name os
 docker-compose exec engine-api anchore-cli image vuln $image_name os
 docker-compose exec engine-api anchore-cli evaluate check $image_name
}

scan
