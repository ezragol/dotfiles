#include "stdio.h"
#include "stdlib.h"

#include "curl/curl.h"
#include "libpq-fe.h"

int connect_to_db() {
    char *
}

int main()
{
    CURL *curl = curl_easy_init();
    char *calendar_uri = getenv("CALENDAR_SECRET");
    printf("%s\n", calendar_uri);
    if (curl)
    {
        CURLcode res;
        curl_easy_setopt(curl, CURLOPT_URL, calendar_uri);
        res = curl_easy_perform(curl);
        curl_easy_cleanup(curl);
    }
}