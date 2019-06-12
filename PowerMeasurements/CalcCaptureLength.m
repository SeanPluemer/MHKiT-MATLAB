function captureLength = CalcCaptureLength(power,waveEnergy,time)

% Calculates the capture length frollowing the TS 62600-100 standards 
%
% Input:
%    power                 Time series of measured power (W) of form 
%                     [time , Nchannels]
%    waveEnergy                 Time series of the measured wave energy (W/m) of form
%                     [time , Nchanels]
%    time                    measurement time vector (s)
%
%
% Output: 
%    captureLength          Time series of the capture length (m)
%
% Dependancies: 
%       
%        
%
% Usage: 
%    CalcCaptureLength(power,waveEnergy,time)
%    calculates the capture length
%    
%
% Version 1, 06/05/2019 Rebecca Pauly, NREL

% check to see if correct number of arguments were passed
if nargin < 3 
    ME = MException('MATLAB:CalcCaptureLength','Incorrect number of input arguments, requires 3 arguments, %d arguments passed',nargin);
    throw(ME);
end

if nargin > 3 
    ME = MException('MATLAB:CalcCaptureLength',['Incorrect number of input arguments, too many arguments, requires at most 3, %d arguments passed',nargin]);
    throw(ME);   
end

% check that first input argument is a numeric matrix
if any([~ismatrix(power),~isnumeric(power), length(power)==1])
    ME=MException('MATLAB:CalcCaptureLenght','power must be a numeric matrix with length > 1');
    throw(ME);
end

%check that the 2nd input argument is a numeric matrix
if any([~ismatrix(waveEnergy),~isnumeric(waveEnergy),length(waveEnergy)==1])
    ME=MException('MATLAB:CalcCaptureLength','waveEnergy must be a numeric matrix with lenght >1');
    throw(ME);
end

%check that the 3rd input argument is a numeric vector
if any([~isvector(time),~isnumeric(time),length(time)==1])
    ME=MException('MATLAB:CalcCaptureLength','time must be a numeric vector with lenght >1');
    throw(ME);
end

%check that power and wave Energy are the same size
if any(length(power) ~= length(waveEnergy))
    ME=MException('MATLAB:CalcCaptureLength','power and waveEnergy need to be the same size');
    throw(ME);
end

%check that power and wave Energy are the same size
if any(length(power) ~= length(time))
    ME=MException('MATLAB:CalcCaptureLength','power and time need to have the same length');
    throw(ME);
end



captureLength=power./waveEnergy;


