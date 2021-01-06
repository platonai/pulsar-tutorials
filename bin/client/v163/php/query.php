<?php

/**
 *The x-sql api is an async api, every call returns the id of the execution immediately.
 *
 * * you can poll the result using this id
 * * you have to specify your own callbackUrl, once we have the execution done, we post the result to this url
 *   requirement for your callback handler:
 *   * method: GET
 *   * media type: application/json
 */

require_once "detail/api.php";

# The url of this scrape task
$fetchUrl='https://www.amazon.com/dp/B07HF3X6Y4?psc=1';

$host='42.194.241.96';
$authToken='yoesoo-1-bb880fade2457372cadd84821b3f29d0';

# Load the x-sql for this scrape task
$sql = loadSql($fetchUrl);
$submitUrl = "http://$host:8182/api/x/a/q";
# The uuid of this scrape task
$uuid = submit($submitUrl, $sql);

# Ask the system if the task is finished
$queryUrl = "http://$host:8182/api/x/a/status?uuid=$uuid&authToken=$authToken";
$output = query($queryUrl);
while ($output['statusCode'] != 200) {
    print_r($output);
    sleep(3);
    $output = query($queryUrl);
}

print_r($output);
