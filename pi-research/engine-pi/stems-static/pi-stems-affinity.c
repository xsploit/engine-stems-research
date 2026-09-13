#define _GNU_SOURCE
#include <dlfcn.h>
#include <pthread.h>
#include <sched.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
int pthread_setaffinity_np(pthread_t thread, size_t size, const cpu_set_t *requested) {
    static int (*real_set)(pthread_t,size_t,const cpu_set_t*);
    if (!real_set) real_set = dlsym(RTLD_NEXT,"pthread_setaffinity_np");
    if (!real_set) return ENOSYS;
    if (size == sizeof(cpu_set_t)) {
        cpu_set_t target; CPU_ZERO(&target);
        for (int i=4;i<8;i++) CPU_SET(i,&target);
        if (CPU_EQUAL(requested,&target)) {
            if (sysconf(_SC_NPROCESSORS_ONLN) == 4) {
                CPU_ZERO(&target);CPU_SET(2,&target);CPU_SET(3,&target);
                int rc=real_set(thread,sizeof(target),&target);
                fprintf(stderr,"pi-stems-affinity: CPUs 4-7 -> 2-3 result=%d\n",rc);
                return rc;
            }
        }
    }
    return real_set(thread,size,requested);
}
