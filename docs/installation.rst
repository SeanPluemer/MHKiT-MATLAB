Installation
========================================

MHKit Matlab consists of Matlab code which runs MHKit Python, therefore installation of both packages is necessary. 

MHKiT requires Python (3.5, 3.6, or 3.7) along with several Python 
package dependencies.  Information on installing and using Python can be found at 
https://www.python.org/.  Python distributions, such as Anaconda,
are recommended to manage the Python interface.  
Anaconda Python distributions include the Python packages needed to run MHKiT.

MHKiT can be installed using pip, git, or a downloaded zip file.  

**pip:** To install MHKiT using pip::

	pip install mhkit
	
**git**: To install MHKiT using git::

	git clone https://code.primre.org/mhkit/mhkit-python 
	cd mhkit-python
	python setup.py install

**zip file**: To install MHKiT using a downloaded zip file, go to https://code.primre.org/mhkit/mhkit-python, 
select the "Download" button and then select "Download zip".
This downloads a zip file called mhkit-python-master.zip.
The software can then be installed by unzipping the file and running setup.py::

	unzip mhkit-python-master.zip
	cd mhkit-python-master
	python setup.py install	
	
Requirements
--------------------

Required Python package dependencies include:

* Pandas
* Numpy
* Scipy
* Matplotlib
* Requests

Download MHKit Matlab.......

Set up the python environment in Matlab. Open Matlab and in the terminal type::

    pyversion

If the resulting python version is not 3.5, 3.6, or 3.7 open a Window or Mac terminal window and type::

    python3 -c "import sys; print(sys.executable)"

If the resulting path_to_exe indicates python 3.5, 3.6, or 3.7, copy the path and in the Matlab terminal run::

    pyversion('<path_to_exe>')

Note: Macintosh computers come with python 2.7 pre-installed. MHKit does not work with python 2.7.  A second version of 
python (v3.5, 3.6, or 3.7) will need to be installed on your machine. DO NOT DELETE python 2.7. Use the above steps to assure 
Matlab is running the proper version of python. 




