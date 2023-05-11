%% readAudio
stopRecording = 0;
try
    if start == 1 & ~(recordStarted == 1)
        f = 16e3;
        rec = audiorecorder(f,8,1);
        record(rec);
        recordStarted = 1;
    end
catch
    f = 16e3;
    rec = audiorecorder(f,8,1);
    record(rec);
    recordStarted = 1;
end
try
    if start ==0 & recordStarted == 1
        stop(rec)
        recData = getaudiodata(rec);
        stopRecording = 1;
    end
end