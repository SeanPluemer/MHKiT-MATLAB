.. _qc:

Quality control analysis
========================================

Before using the methods in the Wave, River, and Tidal modules, the input data provided by the user should undergo 
proper quality control analysis to ensure that the data is of high quality and fit for the intended purpose.  
Quality control analysis often includes steps to ensure that data is 
not missing, corrupt, or outside of the expected range.  
Additional analysis can include checking for 
stagnant readings, unusual abrupt changes, or outliers.
If data does not meet specified requirements, the data points that did not pass inspection should be 
removed or replaced by various means (interpolation, data from a duplicate sensor, values from a model) before using the data in analysis.

The :class:`~mhkit.qc` module contains a set of functions to for basic quality control analysis.  
These functions are imported from `Pecos <https://pecos.readthedocs.io>`_, an open source Python package 
designed for quality control analysis of timeseries data.  Pecos was originally developed to monitor solar photovoltaic systems, but is designed to be used for a wide range of applications.

Note, that the quality control functions require that the data has a datatime index.  
Other functionality in MHKiT-Matlab can use data that has datatime or numeric indexes.  
MHKiT-Matlab includes a utility function in the :class:`~mhkit.utils` module that converts numeric indexes into datetime indexes.

.. autosummary::

   ~mhkit.utils.index_to_datetime
   
The following quality control functions are available in MHKiT-Python.  
Additional functionality, including graphics and reports, can be included in quality control analysis by using Pecos directly. More information on the quality control functions be found at https://pecos.readthedocs.io.

.. autosummary::

   ~mhkit.qc.check_timestamp
   ~mhkit.qc.check_missing
   ~mhkit.qc.check_corrupt
   ~mhkit.qc.check_range
   ~mhkit.qc.check_delta
   ~mhkit.qc.check_outlier

Each function returns the following information:

* Cleaned data (data that failed a test is replaced by NaN)
* Boolean mask (indicates if data failed a test)
* Summary of the quality control test results

The clean data can be used directly in MHKiT-Python analysis, or the missing values can be replaced using various methods.  
Data replacement strategies are generally defined on a case by case basis. If large sections of the data failed quality control tests, the data might not be suitable for use.
Replacement strategies can be applied to the entire data set, or vary by data column or by time.
Possible strategies include:

* Replacing missing data using linear interpolation or other polynomial approximations
* Replacing missing data using a rolling mean of the data
* Replacing missing data with a data from a previous period (previous day, hour, etc.)
* Replacing missing data with data from a redundant sensor
* Replacing missing data with values from a model

These strategies can be accomplished using the Pandas methods ``interpolate``, ``replace``, and ``fillna``.  
See Pandas documentation for more details.

The `quality control analysis <examples/qc_example.html>`_ example illustrates quality control analysis using MHK data.

