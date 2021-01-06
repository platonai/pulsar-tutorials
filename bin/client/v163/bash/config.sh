#!/bin/bash

host=42.194.241.96

# The host of the API server
if [[ "$host" = "" ]]; then
  export host=localhost
fi

# Ask the administrator for your username and authToken
export authToken=yoesoo-1-bb880fade2457372cadd84821b3f29d0

# Important!
# Change to your own callback url, we will post the result of x-sql to this url
export callbackUrl="http://localhost:8182/api/hello/echo"
# export callbackUrl="http://localhost:8182/api/hello/swallow"

# The example target url for our xsql
export fetchUrl='https://www.amazon.com/Disney-51394-Ariel-Necklace-Set/dp/B00BTX5926 -i 1s';
# export fetchUrl='https://www.amazon.com/dp/B07HF3X6Y4'
