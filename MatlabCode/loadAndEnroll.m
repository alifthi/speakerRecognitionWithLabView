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