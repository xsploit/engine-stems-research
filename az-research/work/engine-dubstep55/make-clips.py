from pathlib import Path
import subprocess,concurrent.futures,json
root=Path(__file__).resolve().parent;out=root.parents[1]/'outputs/dubstep55';out.mkdir(exist_ok=True)
jobs=[('original-mix',root/'kromestar-first80.wav')]
for s in range(4):jobs += [(f'engine-{s}',root/f'reference/engine-stem-{s}.wav'),(f'candidate-{s}',root/f'candidate/stem-{s}.wav')]
def clip(job):
 name,src=job;wav=out/(name+'.wav');mp3=out/(name+'.mp3')
 subprocess.run(['ffmpeg','-v','error','-y','-i',str(src),'-ss','55','-t','15','-c:a','pcm_f32le',str(wav)],check=True)
 subprocess.run(['ffmpeg','-v','error','-y','-i',str(wav),'-c:a','libmp3lame','-b:a','192k',str(mp3)],check=True)
 return {'name':name,'wav':str(wav),'mp3':str(mp3)}
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as ex: results=list(ex.map(clip,jobs))
pairs={'pairs':[{'stem':f'stem-{s}','reference':f'engine-{s}.wav','candidate':f'candidate-{s}.wav'} for s in range(4)]};(out/'pairs.json').write_text(json.dumps(pairs,indent=2))
for s in range(4):
 subprocess.run(['ffmpeg','-v','error','-y','-i',str(out/f'engine-{s}.wav'),'-i',str(out/f'candidate-{s}.wav'),'-filter_complex','[0:a]apad=pad_dur=1[a];[a][1:a]concat=n=2:v=0:a=1[o]','-map','[o]','-c:a','libmp3lame','-b:a','192k',str(out/f'AB-stem-{s}.mp3')],check=True)
print('Created 15-second clips and 31-second A/B clips')
