function Tavg=average_crest_period(S)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%    
%    Parameters
%    ------------
%    S: Spectral Density (m^2-s)
%           Pandas data frame
%       To make a pandas data frame from user supplied frequency and spectra
%       use py.pandas_dataframe.spectra_to_pandas(frequency,spectra)
%
%    Returns
%    ---------
%    Tavg:  float
%        Average Wave Period (s)
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
py.importlib.import_module('pandas_dataframe');

if (isa(S,'py.pandas.core.frame.DataFrame')~=1)
    ME = MException('MATLAB:average_crest_period','S needs to be a Pandas dataframe, use py.pandas_dataframe.spectra_to_pandas to create one');
    throw(ME);
end

Tavg=py.mhkit.wave.resource.average_crest_period(S);