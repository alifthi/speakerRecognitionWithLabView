%% readAudio
t = 3;
f = 16+3;
rec = audiorecorder(f,8,1);
record(rec,t);
disp('recording...');
tic;
while toc<=(t+1)
    pause(1);
    disp('.');
end
recData = getaudiodata(rec);
%% loading model from directory
fname = 'ivec-english-16kHz.zip';
tmpDir = '../Model/';
zipFile = fullfile(tmpDir,fname);
unzip(zipFile,tempdir);
%% enroll new record
addpath(tempdir)
sr = speakerRecognition;
enrollRecord = recData(1:3*fs);
label = "Ali";
enroll(sr,enrollRecord,label)
%% verify record
testRec = audiorecorder(f,8,1);
disp('recording...');
record(testRec,t);
tic;
while toc<=(t+1)
    pause(1);
    disp('.');
end
testRecord = getaudiodata(testRec);

candidates = identify(sr,testRecord);
isVerified = verify(sr,testRecord,label);