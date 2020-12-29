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

if (!isset($host)) {
    $host='42.194.239.233';
}
$fetchUrl='https://www.amazon.com/dp/B07HF3X6Y4?psc=1';

$sql = file_get_contents(dirname(__FILE__)."/../config/query.sql");
$sql = str_replace("@url", "'" . $fetchUrl . "'", $sql);

$submitUrl = 'http://'.$host.':8182/api/x/a/q';
$uuid = submit($submitUrl, $sql);
# $url = 'http://localhost:8182/api/x/a/q';

$queryUrl = "http://" . $host . ":8182/api/x/a/status?uuid=$uuid&authToken=gJn6fUBh-1-af1639a924d7232099a037e9544cf43f";
$output = query($queryUrl);
while ($output['statusCode'] != 200) {
    print_r($output);
    sleep(3);
    $output = query($queryUrl);
}

print_r($output);
