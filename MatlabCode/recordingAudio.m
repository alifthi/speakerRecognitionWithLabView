%% readAudio
f = 16e3;
rec = audiorecorder(f,8,1);
record(rec);
disp('recording...');
tic;
while start
    pause(1);
    disp('.');
end
stop(rec)
recData = getaudiodata(rec);
