#define UNICODE
#define _UNICODE
#include <windows.h>
#include <wchar.h>
#include <stdio.h>
struct Pump {HANDLE from,to,file;};
static int allwrite(HANDLE h,char*b,DWORD n){DWORD off=0,k;while(off<n){if(!WriteFile(h,b+off,n-off,&k,0)||!k)return 0;off+=k;}return 1;}
static DWORD WINAPI pump(void*arg){struct Pump*p=arg;char b[65536];DWORD n;while(ReadFile(p->from,b,sizeof(b),&n,0)&&n){if(p->file!=INVALID_HANDLE_VALUE)allwrite(p->file,b,n);if(!allwrite(p->to,b,n))break;}CloseHandle(p->to);return 0;}
int wmain(int argc,wchar_t**argv){
 wchar_t exe[32768],cmd[32768],path[32768];GetModuleFileNameW(0,exe,32768);wchar_t*s=wcsrchr(exe,L'\\');if(!s)return 2;wcscpy(s+1,L"stems-processor.original.exe");
 swprintf(cmd,32768,L"\"%ls\"",exe);for(int i=1;i<argc;i++){wcscat(cmd,L" \"");wcscat(cmd,argv[i]);wcscat(cmd,L"\"");}
 SECURITY_ATTRIBUTES sa={sizeof(sa),0,TRUE};HANDLE inR,inW,outR,outW;if(!CreatePipe(&inR,&inW,&sa,0)||!CreatePipe(&outR,&outW,&sa,0))return 3;SetHandleInformation(inW,HANDLE_FLAG_INHERIT,0);SetHandleInformation(outR,HANDLE_FLAG_INHERIT,0);
 STARTUPINFOW st={0};st.cb=sizeof(st);st.dwFlags=STARTF_USESTDHANDLES;st.hStdInput=inR;st.hStdOutput=outW;st.hStdError=GetStdHandle(STD_ERROR_HANDLE);PROCESS_INFORMATION pi={0};
 if(!CreateProcessW(exe,cmd,0,0,TRUE,0,0,0,&st,&pi))return 4;CloseHandle(inR);CloseHandle(outW);
 swprintf(path,32768,L"Z:\\home\\subsect\\Documents\\Codex\\2026-09-10\\so\\work\\engine-desktop-test\\private-capture\\stdout-%lu.private",GetCurrentProcessId());HANDLE capture=CreateFileW(path,GENERIC_WRITE,FILE_SHARE_READ,0,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
 struct Pump input={GetStdHandle(STD_INPUT_HANDLE),inW,INVALID_HANDLE_VALUE},output={outR,GetStdHandle(STD_OUTPUT_HANDLE),capture};
 HANDLE t=CreateThread(0,0,pump,&input,0,0);pump(&output);WaitForSingleObject(pi.hProcess,INFINITE);DWORD rc;GetExitCodeProcess(pi.hProcess,&rc);CloseHandle(capture);CloseHandle(t);CloseHandle(pi.hProcess);CloseHandle(pi.hThread);return (int)rc;
}
