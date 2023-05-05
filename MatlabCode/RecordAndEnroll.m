%% readAudio
t = 6;
f = 16+3;
rec = audiorecorder(f,8,1);
record(rec,t);
tic;
while toc<=(t+1)
    pause(1);
    disp('.');
end
recData = getaudiodata(rec);

