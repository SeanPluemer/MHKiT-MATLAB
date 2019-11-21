function figure=plot_velocity_vs_power(V,P,varargin)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plots velovity vs power along with a polynomial fit 
%     
%     Parameters
%     ------------
%     V: array
%         Velocity [m/s] 
%         
%     P: array 
%          Power [W]
%
%   Optional
%  ----------
%  title: string
%       title for the plot
%
%   polynomial_coeff: array
%       polynomial coefficients which can be computed from 
%       polynomial_fit.m. Expects poly.coef
% 
%   Returns
%   ---------
%   figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure=plot(V,P);
xlabel('Velocity [^m^{3}/_{s}]','FontSize',20)
ylabel('Power [W]','FontSize',20)

if nargin == 3
    if isstring(varargin{1})
        title(varargin{1})
    elseif isnumeric(varargin{1})
        si=size(varargin{1});
        x=linspace(min(V),max(V),si(2));
        hold on
        plot(x,varargin{1})
    else
        ME = MException('MATLAB:plot_velocity_vs_power','Variable argument is of the wrong type');
        throw(ME);
    end
    
elseif nargin ==4 
    if isstring(varargin{1}) & isnumeric(varargin{2})
        si=size(varargin{2});
        x=linspace(min(V),max(V),si(2));
        hold on
        plot(x,varargin{2})
        title(varargin{1})
    elseif isstring(varargin{2}) & isnumeric(varargin{1})
        si=size(varargin{1});
        x=linspace(min(V),max(V),si(2));
        hold on
        plot(x,varargin{1})
        title(varargin{2})
    else
        ME = MException('MATLAB:plot_velocity_vs_power','Variable argument is of the wrong type');
        throw(ME);
    end
elseif nargin > 4
    ME = MException('MATLAB:plot_velocity_vs_power','Too many arguments given');
        throw(ME);
end

hold off