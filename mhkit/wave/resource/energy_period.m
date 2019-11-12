function Te=energy_period(S)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%    
%    Parameters
%    ------------
%    S: Spectral Density (m^2-s)
%           Pandas data frame
%       To make a pandas data frame from user supplied frequency and spectra
%       use py.pandas_dataframe.spectra_to_pandas(frequency,spectra)
%        OR
%        wave_spectra structure of form
%        wave_spectra.spectrum=Spectral Density (m^2-s;
%         wave_spectra.type=String of the spectra type, i.e. Bretschneider, 
%                time series, date stamp etc. ;
%         wave_spectra.frequency= frequency (Hz);
%
%    Returns
%    ---------
%    Te float
%        Wave energy Period (s)
%
%    Dependancies 
%    -------------
%    Python 3.5 or higher
%    Pandas
%    mhkit_python_utils
%    Numpy
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


py.importlib.import_module('mhkit');
py.importlib.import_module('mhkit_python_utils');

if (isa(S,'py.pandas.core.frame.DataFrame')~=1)
    if (isstruct(S)==1)
        x=size(S.spectrum);
        li=py.list();
        if x(2)>1 
            for i = 1:x(2)
                app=py.list(S.spectrum(:,i));
                li=py.mhkit_python_utils.pandas_dataframe.lis(li,app);
            
            end
            S=py.mhkit_python_utils.pandas_dataframe.spectra_to_pandas(uint32(S.frequency(:,1)),li,int32(x(2)));
        elseif x(2)==1
            S=py.mhkit_python_utils.pandas_dataframe.spectra_to_pandas(uint32(S.frequency),py.numpy.array(S.spectrum),int32(x(2)));
        end
        
    else
        ME = MException('MATLAB:significant_wave_height','S needs to be a Pandas dataframe, use py.mhkit_python_utils.pandas_dataframe.spectra_to_pandas to create one');
        throw(ME);
    end
end

Te=py.mhkit.wave.resource.energy_period(S);
Te=double(Te.values);
