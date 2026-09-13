#define _POSIX_C_SOURCE 200809L
#include "onnxruntime_c_api.h"
#include <stdio.h>
#include <dlfcn.h>
#include <time.h>
#include <math.h>
static const OrtApi *a;
static void ck(OrtStatus*s){if(s){fprintf(stderr,"%s\n",a->GetErrorMessage(s));a->ReleaseStatus(s);exit(1);}}
static double now(void){struct timespec t;clock_gettime(CLOCK_MONOTONIC,&t);return t.tv_sec+t.tv_nsec*1e-9;}
int main(int argc,char**argv){
 if(argc!=5){fprintf(stderr,"usage: lib threads optimization output\n");return 2;}
 void*h=dlopen(argv[1],RTLD_NOW|RTLD_LOCAL);if(!h){fprintf(stderr,"%s\n",dlerror());return 1;}
 const OrtApiBase*(*base)(void)=dlsym(h,"OrtGetApiBase");if(!base)return 1;
 a=base()->GetApi(ORT_API_VERSION);if(!a)return 1;
 int threads=atoi(argv[2]),opt=atoi(argv[3]);OrtEnv*env=NULL;OrtSessionOptions*so=NULL;OrtSession*s=NULL;OrtMemoryInfo*mi=NULL;OrtValue*x=NULL;
 ck(a->CreateEnv(ORT_LOGGING_LEVEL_WARNING,"bench",&env));ck(a->CreateSessionOptions(&so));ck(a->SetIntraOpNumThreads(so,threads));ck(a->SetInterOpNumThreads(so,1));ck(a->SetSessionGraphOptimizationLevel(so,(GraphOptimizationLevel)opt));
 double t=now();ck(a->CreateSession(env,"model.private.onnx",so,&s));double init=now()-t;
 size_t count=1*2*128*2048;float*input=malloc(count*sizeof(float));FILE*f=fopen("input.f32","rb");if(!f||fread(input,sizeof(float),count,f)!=count)return 1;fclose(f);
 int64_t dims[]={1,2,128,2048};ck(a->CreateCpuMemoryInfo(OrtArenaAllocator,OrtMemTypeDefault,&mi));ck(a->CreateTensorWithDataAsOrtValue(mi,input,count*sizeof(float),dims,4,ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT,&x));
 const char*in[]={"input"};const char*out[]={"output"};const OrtValue*inputs[]={x};double times[6];OrtValue*y=NULL;
 for(int i=0;i<6;i++){t=now();ck(a->Run(s,NULL,in,inputs,1,out,1,&y));times[i]=now()-t;if(i<5){a->ReleaseValue(y);y=NULL;}}
 float*data=NULL;ck(a->GetTensorMutableData(y,(void**)&data));size_t nout=1*8*128*2048;for(size_t i=0;i<nout;i++)if(!isfinite(data[i]))return 1;
 f=fopen(argv[4],"wb");if(!f||fwrite(data,sizeof(float),nout,f)!=nout)return 1;fclose(f);
 printf("{\"runtime\":\"%s\",\"threads\":%d,\"optimization\":%d,\"init_seconds\":%.9f,\"first_run_seconds\":%.9f,\"warm_seconds\":[",base()->GetVersionString(),threads,opt,init,times[0]);for(int i=1;i<6;i++)printf("%s%.9f",i==1?"":",",times[i]);printf("],\"finite\":true}\n");
 a->ReleaseValue(y);a->ReleaseValue(x);a->ReleaseMemoryInfo(mi);a->ReleaseSession(s);a->ReleaseSessionOptions(so);a->ReleaseEnv(env);free(input);dlclose(h);return 0;
}
