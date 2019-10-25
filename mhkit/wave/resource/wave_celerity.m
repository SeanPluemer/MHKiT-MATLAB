function Cg=wave_celerity(k,h,varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%    
%    Parameters
%    ------------
%    k: wave number (1/m)
%           Pandas data frame
%       To make a pandas data frame from user supplied frequency and spectra
%       use py.pandas_dataframe.spectra_to_pandas(frequency,spectra)
%        OR
%        k structure of form
%        k.values= wave number
%        k.frequency= frequency (Hz);
%    h: float
%         Water depth (m)

%
%     Optional 
%     ---------
%     g: float
%         gravitational acceleration (m/s^2)
%         
%
%     Returns
%     -------
%     Cg: structure
%         water celerity
%
%    Dependancies 
%    -------------
%    Python 3.5 or higher
%    Pandas
%    Scipy
%    Numpy
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[own_path,~,~] = fileparts(mfilename('fullpath'));
modpath= fullfile(own_path, '...');
P = py.sys.path;
if count(P,'modpath') == 0
    insert(P,int32(0),'modpath');
end

py.importlib.import_module('mhkit');


if (isa(k,'py.pandas.core.frame.DataFrame')~=1)
    if (isstruct(k)==1)
        k=py.pandas_dataframe.spectra_to_pandas(k.frequency,py.numpy.array(k.values));
        
    else
        ME = MException('MATLAB:wave_celerity','S needs to be a Pandas dataframe, use py.pandas_dataframe.spectra_to_pandas to create one');
        throw(ME);
    end
end

if nargin == 3 
    Cgdf=py.mhkit.wave.resource.wave_celerity(k,h,pyargs('g',varargin{1}));
elseif nargin == 2
    Cgdf=py.mhkit.wave.resource.wave_celerity(k,h);
else
    ME = MException('MATLAB:wave_celerity','incorrect numner of arguments');
        throw(ME);
end


Cg.values=double(py.array.array('d',py.numpy.nditer(Cgdf.values)));
Cg.frequency=double(py.array.array('d',py.numpy.nditer(Cgdf.index)));
Cg.h=h;
