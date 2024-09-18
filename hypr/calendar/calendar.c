#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#include "curl/curl.h"
#include "libpq-fe.h"

typedef struct string
{
    char *ptr;
    size_t len;
} Str;

typedef struct lines
{
    char **lines;
    size_t num;
} Lines;

typedef struct 

void init_string(Str *s)
{
    s->len = 0;
    s->ptr = malloc(s->len + 1);
    if (s->ptr == NULL)
    {
        fprintf(stderr, "malloc() failed\n");
        exit(EXIT_FAILURE);
    }
    s->ptr[0] = '\0';
}

size_t writefunc(void *ptr, size_t size, size_t nmemb, Str *s)
{
    size_t new_len = s->len + size * nmemb;
    s->ptr = realloc(s->ptr, new_len + 1);
    if (s->ptr == NULL)
    {
        fprintf(stderr, "realloc() failed\n");
        exit(EXIT_FAILURE);
    }
    memcpy(s->ptr + s->len, ptr, size * nmemb);
    s->ptr[new_len] = '\0';
    s->len = new_len;

    return size * nmemb;
}

int check_connection(PGconn *conn)
{
    if (PQstatus(conn) != CONNECTION_OK)
    {
        printf("error connecting: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        return 1;
    }
    printf("connected\n");
    return 0;
}

typedef struct Event
{
    int id;

    char *description;
    char *location;
    char *summary;
    char *rule;

} event;

int split_by_line(char *event_raw, Lines *line_info)
{
    line_info->lines = malloc(1);
    int start = 0,
        n = 0,
        last_size = 0;

    while (1)
    {
        char *newline,
            *remaining = event_raw + start,
            *line;
        int loc;

        newline = strchr(remaining, '\n');
        if (newline == NULL)
            break;

        loc = (int)(newline - remaining);

        line_info->lines = realloc(line_info->lines, (n + 1) * sizeof(char *));
        line_info->lines[n] = calloc(loc, sizeof(char));
        line = line_info->lines[n];
        strncpy(line, remaining, loc - 1);
        line[loc - 1] = '\0';

        if (line[0] == ' ')
        {
            last_size += loc;
            line_info->lines[n - 1] = realloc(line_info->lines[n - 1], last_size * sizeof(char));
            strncat(line_info->lines[n - 1], line + 1, loc);
            free(line);
        }
        else
        {
            last_size = loc;
            n++;
        }
        start = start + loc + 1;
    }
    line_info->num = n;
    return 0;
}

int free_lines(Lines *line_info)
{
    for (int i = 0; i < line_info->num; i++)
    {
        free(line_info->lines[i]);
    }
    free(line_info->lines);
    return 0;
}

int parse_events(Lines *l)
{
    for (int i = 0; i < l->num; i++)
    {
        char *line = l->lines[i];

    }
}

int add_event(char *event_raw, PGconn *conn)
{
    const char *values[] = {
        "20240904T111500",
        "20240904T120500",
        "",
        "Hasbrouck Lab Add room 20",
        "PHYSICS 151-01 LEC(33376)",
        "WEEKLY;UNTIL=20240909T035959Z;BYDAY=MO,WE,FR"};

    PGresult *result = PQexecParams(
        conn,
        "INSERT INTO events (start_time, end_time, description, location, summary, rule) VALUES ($1, $2, $3, $4, $5, $6)",
        6,
        NULL,
        values,
        NULL,
        NULL,
        0);
    return 0;
}

static void finish(PGconn *conn)
{
    PQfinish(conn);
    exit(1);
}

int get_calendar()
{
    CURL *curl = curl_easy_init();
    char *calendar_uri = getenv("CALENDAR_SECRET");
    Lines l = {.num = 0};
    Str s;
    init_string(&s);

    if (curl)
    {
        CURLcode res;
        curl_easy_setopt(curl, CURLOPT_URL, calendar_uri);
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &s);

        res = curl_easy_perform(curl);
        split_by_line(s.ptr, &l);

        for (int i = 0; i < 300; i++)
        {
            printf("%s\n", l.lines[i]);
        }

        free(s.ptr);
        free_lines(&l);
        curl_easy_cleanup(curl);
    }
    return 0;
}

int main()
{
    PGconn *conn;
    const char *info = "dbname=calendar";
    int status;

    get_calendar();

    // conn = PQconnectdb(info);
    // status = check_connection(conn);
    // if (status == 1)
    //     finish(conn);

    // add_event("", conn);
    // PQfinish(conn);
    return 0;
}