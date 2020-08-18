# pulsar-tutorials

## Install dependency

Ubuntu is the primary OS environment. 

Google chrome must be installed.

MongoDB is optional but is recommended. 

    sudo apt install mongodb

## Build the tutorials

    git clone https://github.com/platonai/pulsar-tutorials.git
    
    cd pulsar-tutorials

    mvn clean && mvn

## Run the examples

    mvn exec:java -pl basic -Dexec.mainClass=ai.platon.pulsar.tutorials.ManualKt

    mvn exec:java -pl sql -Dexec.mainClass=ai.platon.pulsar.tutorials.SqlManualKt

## Overview

Scrape out pages from a portal url using native api:

    val url = "https://list.jd.com/list.html?cat=652,12345,12349"

    val session = PulsarContexts.createSession()
    session.scrapeOutPages(url,
                "-expires 1d -itemExpires 7d -outLink a[href~=item]",
                ".product-intro",
                listOf(".sku-name", ".p-price"))

Scrape out pages from a portal url using x-sql:

        select
            dom_first_text(dom, '.sku-name') as name,
            dom_first_text(dom, '.p-price') as price
        from
            load_out_pages('$url -i 1d -ii 7d', 'a[href~=item]')
