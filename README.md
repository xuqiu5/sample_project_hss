# sample_project_hss
This is the sample project with HSS. It involves using a bash script to repeatedly call a R script for graphing a series of sample data in csv format.

### Install Packages
Three R packages(ggplot2, patchwork, dplyr) are needed for this pipeline. To install the packages, run:
```bash
install.packages('patchwork')
install.packages('ggplot2')
install.packages("dplyr")
```

### Run Pipeline
where '/your/path' is the pathway containing script loop.bash

'/data/path' is the folder containing input csv files.

'plot.R' is assumed to be in the parent folder of  '/data/path'. 

```bash
cd /your/path
bash loop.bash '/data/path'
```

### Output
The script will generate a output folder in '/data/path', it will contain one jpeg output for each csv file in the '/data/path' directory. One picture file contains four sub plots, where 3 are bar plots corresponding to column x,y,and a. One is pie chart corresponding to column z. 



![Example Output](https://github.com/xuqiu5/sample_project_hss/blob/main/Example%20output/sample_file_4_out.jpeg)
