%% readAudio
f = 16e3;
t=2
rec = audiorecorder(f,8,1);
record(rec,t);
disp('recording...');
tic;
while toc<=(t+0.2)
    pause(1);
    disp('.');
end
recData = getaudiodata(rec);
%% loading model from directory
fname = 'ivec-english-16kHz.zip';
tmpDir = 'C:\Users\alifa\Documents\Uni\application of computer in control\project1\speakerRecognitionWithLabView\Model\';
zipFile = fullfile(tmpDir,fname);
unzip(zipFile,tempdir);
%% enroll new record
addpath(tempdir)
sr = speakerRecognition;
enrollRecord = recData;
label = "Ali";
enroll(sr,enrollRecord,label)
%% verify record
testRec = audiorecorder(f,8,1);
disp('recording...');
record(testRec,t);
tic;
while toc<=(t+0.2)
    pause(1);
    disp('.');
end
testRecord = getaudiodata(testRec);

candidates = identify(sr,testRecord);
isVerified = int8(verify(sr,testRecord,label));