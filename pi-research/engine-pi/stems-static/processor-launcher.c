/* Pi runtime adapter: preserve processor arguments, select its compatible loader.
 * Build statically so the adapter itself does not use the firmware's loader.
 * This contains no proprietary processor code or session material.
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main(int argc, char **argv) {
    char **args = calloc((size_t)argc + 5, sizeof(*args));
    if (!args) return 125;
    args[0] = "/opt/pi-graphics/ld-linux-aarch64.so.1";
    args[1] = "--library-path";
    args[2] = "/secure-media/stems-child-process.sqsh:/opt/pi-graphics:/usr/lib:/lib";
    args[3] = "/secure-media/stems-child-process.sqsh/stems-processor.real";
    for (int i = 1; i < argc; ++i) args[i + 3] = argv[i];
    /* Engine UI/audio injection libraries must not enter the worker. */
    unsetenv("LD_PRELOAD");
    execv(args[0], args);
    perror("Pi stem processor launcher");
    free(args);
    return 126;
}
