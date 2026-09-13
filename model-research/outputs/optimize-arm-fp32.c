#include "onnxruntime_c_api.h"
#include <stdio.h>
#include <dlfcn.h>
static const OrtApi*a;
static void ck(OrtStatus*s){if(s){fprintf(stderr,"%s\n",a->GetErrorMessage(s));a->ReleaseStatus(s);exit(1);}}
int main(int argc,char**argv){if(argc!=4)return 2;void*h=dlopen(argv[1],RTLD_NOW|RTLD_LOCAL);if(!h){fprintf(stderr,"%s\n",dlerror());return 1;}const OrtApiBase*(*base)(void)=dlsym(h,"OrtGetApiBase");if(!base)return 1;a=base()->GetApi(ORT_API_VERSION);if(!a)return 1;OrtEnv*env=NULL;OrtSessionOptions*so=NULL;OrtSession*s=NULL;ck(a->CreateEnv(ORT_LOGGING_LEVEL_WARNING,"optimize",&env));ck(a->CreateSessionOptions(&so));ck(a->SetIntraOpNumThreads(so,2));ck(a->SetInterOpNumThreads(so,1));ck(a->SetSessionGraphOptimizationLevel(so,ORT_ENABLE_ALL));ck(a->SetOptimizedModelFilePath(so,argv[3]));ck(a->CreateSession(env,argv[2],so,&s));a->ReleaseSession(s);a->ReleaseSessionOptions(so);a->ReleaseEnv(env);puts("ARM FP32 candidate created in local emulation.");dlclose(h);return 0;}
