#include <stdio.h>
#include <string.h>

#include <cjson/cJSON.h>

#define VERSION "0.0.0"

int main(int argc, char const *argv[]) {
  // printf("Assets Downloader for Minecraft Batch Launcher %s\n", VERSION);

  if (argc < 2) {
    printf("Usage: %s <assets.json>\n", argv[0]);

    return 0;
  }

  /* ... */
  if (argc == 2 && strcmp(argv[1], "--help") == 0) {
    printf("Help:\n");
    printf("  --help\tShow help\n");
    printf("  --version\tShow version\n");
    return 0;
  } else if (argc == 2 && strcmp(argv[1], "--version") == 0) {
    return 0;
  }

  FILE *index_file;
  char str[900000];
  char buffer[100];

  index_file = fopen(argv[1], "r");
  while (fgets(buffer, sizeof(buffer), index_file)) {
    strcat(str, buffer);
  }
  fclose(index_file);

  cJSON *json = cJSON_Parse(str);
  cJSON *assets_objects = cJSON_GetObjectItem(json, "objects");
  unsigned int assets_objects_size = cJSON_GetArraySize(assets_objects);

  if (assets_objects) {
    cJSON *object = assets_objects->child;

    while (object) {
      char *hash = cJSON_GetStringValue(cJSON_GetObjectItem(object, "hash"));
      unsigned int size =
          cJSON_GetNumberValue(cJSON_GetObjectItem(object, "size"));
      printf("%s:%d\n", hash, size);

      object = object->next;
    }
  }

  return 0;
}
